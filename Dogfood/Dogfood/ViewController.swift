//
//  ViewController.swift
//  Dogfood
//
//  Created by 이진하 on 2021/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func move(_ sender: Any) {
//        let vc = UIStoryboard(name: "main", bundle: nil).instantiateViewController(withIdentifier: "main")
//        self.navigationController?.pushViewController(vc, animated: true)
        
        let vc = UIStoryboard(name: "UserSettings", bundle: nil).instantiateViewController(withIdentifier: "SelectViewController")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

