//
//  Second.swift
//  Exercise2
//
//  Created by 조수민 on 2023/05/24.
//

import Foundation

struct ShopList: Codable {
    let shopList: [Shop]
}

struct Shop: Codable {
    let id: Int
    let category: String
    let name: String
    let point: Double
    let review: Int
    let adFlag: String
    let imageFile: String
}
