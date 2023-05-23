//
//  Detail.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import Foundation

struct ConversationWrapper: Codable {
    let conversation: Conversation
}

struct Conversation: Codable {
    let keyword: String
    let response: String
}
