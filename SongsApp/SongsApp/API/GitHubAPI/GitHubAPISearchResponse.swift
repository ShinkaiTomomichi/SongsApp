//
//  GitHubAPIRepository.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

struct GitHubAPISearchResponse<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    // JSONのキー名とプロパティ名が一致しない場合に利用
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct GitHubAPIRepository: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let owner: GitHubAPIUser
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
    }
}

struct GitHubAPIUser: Decodable {
    let id: Int
    let login: String
}
