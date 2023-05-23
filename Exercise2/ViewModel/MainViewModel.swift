//
//  MainViewModel.swift
//  Exercise2
//
//  Created by dahye on 2023/05/15.
//

import Foundation

class MainViewModel {
    
    func fetchMainData(completion: @escaping ([Group]) -> Void) {
        ServiceManager.shared.request(
            request: .init(endPoint: .list),
            expecting: GroupMember.self) { result in
                switch result {
                case .success(let groupMember):
                    completion(groupMember.groupMember)
                case .failure(let error):
                    print(error)
                }
        }
        
        
    }
}
