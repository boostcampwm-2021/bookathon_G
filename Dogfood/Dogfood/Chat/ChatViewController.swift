//
//  ChatViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/24.
//

import UIKit

struct Chat {
    let imgStr:String
    let userName:String
    let content:String
}

class ChatViewController: UIViewController {

    var message:[Chat] = []
    let myCellId = "myCell"
    let yourCellId = "yourCell"
    var userName: String {
        return UserDefaults.standard.string(forKey: Config.userName) ?? "user"
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "myChatCell", bundle: nil), forCellReuseIdentifier: myCellId)
        tableView.register(UINib(nibName: "yourChatCell", bundle: nil), forCellReuseIdentifier: yourCellId)
    }
}


extension ChatViewController :UITableViewDelegate ,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let chat = message[indexPath.row]
        
        if chat.userName == self.userName {
            let cell = tableView.dequeueReusableCell(withIdentifier: myCellId, for: indexPath) as? myChatCell
            
            cell?.chat = chat
            
            return cell!
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: yourCellId, for: indexPath) as? yourChatCell
            
            cell?.chat = chat
            
            return cell!
            
        }
                
    }
    
}
