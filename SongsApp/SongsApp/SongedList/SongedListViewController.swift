//
//  SongedListViewController.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/01.
//

import UIKit

class SongedListViewController: UIViewController {

    @IBOutlet weak var songedListTableView: UITableView!
    var songedList = MockLoadSongedList.init().getSongedList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "履歴"
        
        songedListTableView.delegate = self
        songedListTableView.dataSource = self
        
        // TODO: 削除
        // sampleGitHubAPI(keyword: "swift")
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        print("ボタンが押されました")
    }
    
    private func getImageByUrl(url: String) -> UIImage{
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage(systemName: "xmark.circle.fill") ?? UIImage()
    }
}

// MARK:- UITableViewDelegate, UITableViewDataSource
extension SongedListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 設定されたIdentifierに対応するcellを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongedListTableViewCell", for: indexPath) as! SongedListTableViewCell
        cell.titleLabel.text = songedList[indexPath.row].title!
        cell.artistLabel.text = songedList[indexPath.row].artist!
        cell.coverLabel.text = "Cover:" + (songedList[indexPath.row].cover ?? "なし")
        cell.keyLabel.text = String(songedList[indexPath.row].key ?? 0)
        // ここの画像サイズを一律で同じにしたいが、Youtubeのサムネの比率ベースで良さそう
        // またここは画像ではなくボタンで良さそう
        cell.thumbnailImage.image = getImageByUrl(url: songedList[indexPath.row].imageURL ?? "")
        return cell
    }
}

// MARK:- Sample
extension SongedListViewController {
    private func sampleGitHubAPI(keyword: String) {
        // APIクライアントの生成
        let client = GitHubClient()
        
        // リクエストの発行
        let request = GitHubAPI.SearchRepositories(keyword: keyword)
        
        // リクエストの配信
        client.send(request: request) { result in
            switch result {
            case let .success(response):
                for item in response.items {
                    // レポジトリの所有者と名前を出力
                    print(item.owner.login + "/" + item.name)
                }
            case let .failure(error):
                // エラー詳細を出力
                print(error)
            }
        }
        
    }
}
