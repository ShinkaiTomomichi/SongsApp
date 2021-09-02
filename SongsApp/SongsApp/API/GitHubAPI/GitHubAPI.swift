//
//  GitHubAPI.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

final class GitHubAPI {
    struct SearchRepositories: GitHubAPIRequest {
        let keyword: String
        typealias Response = GitHubAPISearchResponse<GitHubAPIRepository>
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/search/repositories"
        }
        
        var queryItems: [URLQueryItem] {
            return [URLQueryItem(name: "q", value: keyword)]
        }
    }
}
