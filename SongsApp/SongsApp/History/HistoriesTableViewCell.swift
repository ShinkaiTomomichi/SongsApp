//
//  SongedListTableViewCell.swift
//  SongsApp
//
//  Created by shinkaitomomichi on 2021/09/02.
//

import UIKit

class HistoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverLabel: UILabel!
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var thumbnailButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func editButtonTapped(_ sender: Any) {
        // 適当な情報をViewControllerに渡して遷移
        // let historyEditStoryboard = UIStoryboard(name: "HistoryEdit", bundle: nil)
        // let historyEditVC = historyEditStoryboard.instantiateInitialViewController() as! HistoryEditViewController
        // ここの遷移をどう実装しようか？
        // delegate形式にしてViewの方で実装するという方法がありそう
        // self.navigationController?.pushViewController(historyEditVC, animated: true)
    }
    
}
