//
//  GitHubAPIClientError.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import Foundation

enum GitHubAPIClientError: Error {
    // 通信に失敗
    case connectionError(Error)
    // レスポンスのParseに失敗
    case responseParseError(Error)
    // APIからエラーレスポンスを取得
    case apiError(GitHubAPIError)
}

struct GitHubAPIError: Decodable, Error {
    struct FieldError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
    
    let message: String
    let fieldErrors: [FieldError]
}

