//
//  FavouriteUserProfileVC.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SDWebImage
class FavouriteUserProfileVC: UIViewController {
    var user_id = String()
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var distanceLbl: UILabel!
    @IBOutlet weak var userProfileImage: UIImageView!
    @IBOutlet weak var detailsLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var jobLbl: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        SVProgressHUD.show()
        getCurrentUser()
        SVProgressHUD.dismiss()
    }
    
    //get current user api call
    func getCurrentUser(){
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
                        DispatchQueue.main.async {
                            self.detailsLbl.text = "\(jsonData["firstname"] as! String), \(jsonData["age"] as! String)"
                            self.heightLbl.text = "\( jsonData["height"] as! String)"
                            self.userProfileImage.sd_setImage(with: URL(string: jsonData["image"] as! String), placeholderImage: UIImage(named: "placeholder"))
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
    
    
    @IBAction func messagesBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func favouriteBtnAction(_ sender: UIButton) {
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
