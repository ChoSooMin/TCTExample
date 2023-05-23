//
//  ServiceManager.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import Foundation

enum APIEndPoint {
    case list
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .list:
            return "/dcx/3/groupMember"
        case .detail(let keyword):
            return "/dcx/1/conversation/\(keyword)"
        }
    }
    
    var method: String {
        switch self {
        case .list:
            return "GET"
        case .detail:
            return "GET"
        }
    }
}

class APIRequest {
    
    private enum Constants {
        static let baseURL = "http://localhost:3300"
    }
    
    private let endPoint: APIEndPoint
    
    init(endPoint:APIEndPoint) {
        self.endPoint = endPoint
    }
    
    var url: URL? {
        let urlString = Constants.baseURL + endPoint.path
        return URL(string: urlString)
    }
    
    var httpMethod: String {
        return endPoint.method
    }
    
}

class ServiceManager {
    
    static let shared = ServiceManager()
    
    enum NetworkError: Error {
        case invalidURL
        case failedToGetData
        case failedToConvertJsonData
    }
    
    private init() {}
    
    func request<T: Codable>(
        request: APIRequest,
        expecting type: T.Type,
        completion: @escaping (Result<T, NetworkError>) -> Void
    ) {
        
        guard let urlRequest = makeRequest(from: request) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.failedToGetData))
            }
            
            do {
                let result = try JSONDecoder().decode(type, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(.failedToConvertJsonData))
            }
            
            
        }
        task.resume()
        
    }
    
    private func makeRequest(from request: APIRequest) -> URLRequest? {
        guard let url = request.url else {
            return nil
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.httpMethod
        return urlRequest
    }
}
