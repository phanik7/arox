//
//  messageVC.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class messageVC: UIViewController {

    @IBOutlet weak var messagesTableView: UITableView!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var notificationLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        // Do any  additional setup after loading the view.
        notificationLbl.layer.cornerRadius = notificationLbl.bounds.size.width/2
        notificationLbl.layer.masksToBounds = true
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        print("tapped")
        self.navigationController?.popViewController(animated: true)
    }
    

}
extension messageVC : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageTableViewCell", for: indexPath) as! MessageTableViewCell
        cell.userImage.image = UIImage(named: "Unknown")
        cell.nameLbl.text = "Dummy data"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
