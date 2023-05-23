//
//  SecondViewModel.swift
//  Exercise2
//
//  Created by 조수민 on 2023/05/23.
//

import Foundation

class SecondViewModel {
    
    func fetchSecondData(completion: @escaping ([Shop]) -> Void) {
        ServiceManager.shared.request(
            request: .init(endPoint: .list),
            expecting: ShopList.self) { result in
                switch result {
                case .success(let shopList):
                    completion(shopList.shopList)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
