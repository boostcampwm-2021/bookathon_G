//
//  EtcTableViewController.swift
//  Dogfood
//
//  Created by 윤상진 on 2021/09/23.
//

import UIKit
import FirebaseFirestore


class EtcTableViewController: UITableViewController {
    
    var documentId: String?
    var logs: [Log]!
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return dateFormatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EtcTableViewCell", for: indexPath) as? EtcTableViewCell else {
            return UITableViewCell()
        }
        cell.timeEmoji.text = dateFormatter.string(from: logs[indexPath.row].time)
        cell.detailEmoji.text = logs[indexPath.row].foodImgStr + "을 줬어요"
        cell.userImageView.image = UIImage(named: logs[indexPath.row].imgStr)
        return cell
    }
}
