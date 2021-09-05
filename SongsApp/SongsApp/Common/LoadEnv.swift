//
//  LoadEnv.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/05.
//

import Foundation

// .secretに登録した情報を辞書型で取得する
class LoadEnv {
    static func load() -> Void {
        guard let path = Bundle.main.path(forResource: ".secret", ofType: nil) else {
            fatalError("Not found: '/path/to/.env'.\nPlease create .env file reference from .env.sample")
        }
        let url = URL(fileURLWithPath: path)
        print(url)
        do {
            let data = try Data(contentsOf: url)
            let str = String(data: data, encoding: .utf8) ?? "Empty File"
            let clean = str.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "'", with: "")
            let envVars = clean.components(separatedBy:"\n")
            for envVar in envVars {
                let keyVal = envVar.components(separatedBy:"=")
                if keyVal.count == 2 {
                    print(keyVal[0], keyVal[1])
                }
            }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
