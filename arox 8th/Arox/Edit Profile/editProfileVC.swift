//
//  editProfileVC.swift
//  Arox
//
//  Created by apple on 1/7/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SDWebImage
class editProfileVC: UIViewController {
    var name = String()
    var location = String()
    var height = String()
    var imageUrl = String()

    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var jobLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var aboutTextView: UITextView!
    @IBOutlet weak var imagePageControlOL: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        SVProgressHUD.show()
        getCurrentUser()
        SVProgressHUD.dismiss()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func editBtnAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "editProfileDeleteVC") as! editProfileDeleteVC
        self.navigationController?.pushViewController(vc, animated: false)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    
    //get current user api call
    func getCurrentUser(){
        let user_id = UserDefaults.standard.value(forKey: "user_id")
        print(user_id)
        let parameters:Parameters = ["user_id":user_id]
        let url = Constants.getUserById
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:nil).responseJSON { (response) in
            switch response.result{
                
            case .success:
                if let data = response.result.value as? AnyObject{
                    let status = data.value(forKey: "status") as! Int
                    let msg = data.value(forKey: "message") as! String
                    if status == 1{
                        let jsonData = data.value(forKey: "data") as! [String:Any]
                        print(jsonData)
                        self.name = jsonData["firstname"] as! String
                        self.height = jsonData["height"] as! String
                        self.imageUrl = jsonData["image"] as! String
                        DispatchQueue.main.async {
                            self.nameLbl.text = self.name
                            self.heightLbl.text = self.height
                            self.profileImage.sd_setImage(with: URL(string: self.imageUrl), placeholderImage: UIImage(named: "placeholder"))
                        }
                    }else{
                        let alertController = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
                        
                        // Create the actions
                        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                            UIAlertAction in
                           
                        }
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)

                    }
                    
                }
            case .failure(_):
                print(response.error)
            }
        }
    }
    
    
    
}
