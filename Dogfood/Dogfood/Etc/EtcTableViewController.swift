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
    var logs: Logs!
    lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH시 mm분"
        return dateFormatter
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        logs = Logs(listner: { [weak self] in self?.tableView.reloadData() })
        configureLogs()
    }
    
    func configureLogs() {
        let db = Firestore.firestore()
        guard let documentId = documentId else {
            return
        }
        let collection = db.collection("Dogs")
        collection.document(documentId).getDocument { [weak self] snapshot, error in
            guard let snapshotData = snapshot?.data(),
                  let snapshotArr = snapshotData["Logs"] as? [Dictionary<String, Any>]
            else {
                return
            }
            var datas = [(String, Date)]()
            for logData in snapshotArr {
                guard let icon = logData["icon"] as? String,
                      let timestamp = logData["time"] as? Timestamp
                else {
                  return
                }
                datas.append((icon, timestamp.dateValue()))
            }
            self?.logs.datas = datas
        }
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return logs.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EtcTableViewCell", for: indexPath) as? EtcTableViewCell else {
            return UITableViewCell()
        }
        cell.timeEmoji.text = logs[indexPath.row].0
        cell.detailEmoji.text = dateFormatter.string(from: logs[indexPath.row].1)
        return cell
    }
}
