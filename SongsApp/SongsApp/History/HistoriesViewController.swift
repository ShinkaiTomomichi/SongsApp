//
//  SongedListViewController.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/01.
//

import UIKit

class HistoriesViewController: UIViewController {

    @IBOutlet weak var songedListTableView: UITableView!
    var histories: [History] = []
    var historiesByDate: [[History]] = [[]]
    var dateUnique: [Date] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "履歴"
        
        songedListTableView.delegate = self
        songedListTableView.dataSource = self
        
        MockLoadHistories.shared.start()
        self.histories = MockLoadHistories.shared.histories
        self.historiesByDate = MockLoadHistories.shared.historiesByDate
        self.dateUnique = MockLoadHistories.shared.dateUnique
        
        // TODO: 削除
        // sampleGitHubAPI(keyword: "swift")
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        // 適当な情報をViewControllerに渡して遷移
        let historyEditStoryboard = UIStoryboard(name: "HistoryEdit", bundle: nil)
        let historyEditVC = historyEditStoryboard.instantiateInitialViewController() as! HistoryEditViewController
        // ここでviewcontrollerに編集 or 追加の情報を渡しておく
        self.navigationController?.pushViewController(historyEditVC, animated: true)
        
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
extension HistoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dateUnique.count
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return self.dateUnique[section].stringFromDate()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historiesByDate[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 設定されたIdentifierに対応するcellを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoriesTableViewCell", for: indexPath) as! HistoriesTableViewCell
        cell.titleLabel.text = historiesByDate[indexPath.section][indexPath.row].song?.title
        cell.artistLabel.text = historiesByDate[indexPath.section][indexPath.row].song?.artist
        cell.coverLabel.text = historiesByDate[indexPath.section][indexPath.row].song?.cover ?? ""
        cell.keyLabel.text = String(historiesByDate[indexPath.section][indexPath.row].key)

        // ここの画像サイズを一律で同じにしたいが、Youtubeのサムネの比率ベースで良さそう
        // またここは画像ではなくボタンで良さそう
        cell.thumbnailImage.image = getImageByUrl(url: historiesByDate[indexPath.section][indexPath.row].song?.getThumbnailLink() ?? "")
        return cell
    }
}

// MARK:- Sample
extension HistoriesViewController {
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
