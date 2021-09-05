//
//  HomeSceneViewController.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/01.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // セルには履歴からか新規で追加するか
        // 適当にSongsからおすすめを取り出す
        // おすすめを表示する方法はいくつか用意しよう
        navigationItem.title = "ホーム画面"
        
        LoadEnv.load()
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
