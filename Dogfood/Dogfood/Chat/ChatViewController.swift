//
//  ChatViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/24.
//

import UIKit
import FirebaseFirestore

struct Chat {
    let imgStr:String
    let userName:String
    let content:String
}

class ChatViewController: UIViewController {

    var chats:[[String:String]] = []
    var message:[Chat] = []
    let myCellId = "myCell"
    let yourCellId = "yourCell"
    var userName: String {
        return UserDefaults.standard.string(forKey: Config.userName) ?? "user"
    }
    var userImg: String {
        return UserDefaults.standard.string(forKey: Config.userImg) ?? "person1"
    }
    var familyCode:String {
        return UserDefaults.standard.string(forKey: Config.familyCode) ?? "abc"
    }
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var chatView: UIView!
    @IBOutlet weak var sendButton: UIButton!
    
    @IBAction func send(_ sender: Any) {
        guard let content = textField.text else { return }
        
        let chat:[String:String] = [
            "userName" : userName,
            "imgStr" : userImg,
            "content" : content
        ]
        
        self.chats.append(chat)
        
        Collection.chatCollection.document(familyCode).updateData([
            "message" : chats
        ]) { error in
            self.tableView.reloadData()
        }
        self.textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSet()
        addSnapshotListener()
    }
    
    func tableviewSet() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "myChatCell", bundle: nil), forCellReuseIdentifier: myCellId)
        tableView.register(UINib(nibName: "yourChatCell", bundle: nil), forCellReuseIdentifier: yourCellId)
    }
    
    func chatLayout() {
        self.chatView.backgroundColor = .systemBrown
        self.textField.layer.cornerRadius = 15
        self.textField.attributedPlaceholder = NSAttributedString(AttributedString("채팅을 입력해주세요", attributes:  AttributeContainer([ .font : UIFont.boldSystemFont(ofSize: 15), .foregroundColor : UIColor.white ])))
        
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
