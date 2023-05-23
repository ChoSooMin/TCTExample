//
//  Main.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import Foundation

struct GroupMember: Codable {
    let groupMember: [Group]
}

struct Group: Codable {
    let group_id: String
    let group_name: String
    let member: [Member]
}

struct Member: Codable {
    let id: String
    let name: String
    let imageFile: String
}

