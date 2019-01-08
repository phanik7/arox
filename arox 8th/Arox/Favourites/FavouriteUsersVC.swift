//
//  FavouriteUsersVC.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import SVProgressHUD
class FavouriteUsersVC: UIViewController {
var usersArray = [GetFavUsers]()
    @IBOutlet weak var recentSeenCollectionView: UICollectionView!
    
    
    @IBOutlet weak var recentlySeenParentView: UIView!
    @IBOutlet weak var favouriteUsersTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
            recentSeenCollectionView.delegate = self
            recentSeenCollectionView.dataSource = self
            favouriteUsersTableView.delegate = self
            favouriteUsersTableView.dataSource = self
             //   getFavUsersApi()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        getFavUsersApi()
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.usersArray.removeAll()
        SVProgressHUD.dismiss()
    }
    // get favourite users api
    func getFavUsersApi(){
        let user_id = UserDefaults.standard.value(forKey: "user_id")
        let parameters:Parameters = ["user_id":1]
        let url = Constants.getFavUsers
        SVProgressHUD.show()
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:nil).responseJSON { (response) in
            switch response.result{
                
            case .success:
                if let data = response.result.value as? AnyObject{
                    let status = data.value(forKey: "status") as! Int
                    let msg = data.value(forKey: "message") as! String
                    if status == 1{
                        let jsonData = data.value(forKey: "data") as! [[String:Any]]
                        for i in 0..<jsonData.count{
                            self.usersArray.append(GetFavUsers(firstName: jsonData[i]["firstname"] as! String, lastName: jsonData[i]["lastname"] as! String, id: jsonData[i]["follower_id"] as! String, imageURL: jsonData[i]["image"] as! String, status: jsonData[i]["status"] as! String, followerId: jsonData[i]["person_followed"] as! String))
                        }
                        DispatchQueue.main.async {
                            self.favouriteUsersTableView.reloadData()
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
extension FavouriteUsersVC : UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    //table view delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteUsersTableViewCell", for: indexPath) as! FavouriteUsersTableViewCell
        cell.nameLbl.text = usersArray[indexPath.row].firstName
        cell.userImage.sd_setImage(with: URL(string: usersArray[indexPath.row].imageUrl), placeholderImage: UIImage(named: "noimage1"))
        if usersArray[indexPath.row].status == "online"{
            cell.statusImage.image = UIImage(named: "Oval")
        }
        print(usersArray[indexPath.row].followerId)
        SVProgressHUD.dismiss()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "FavouriteUserProfileVC") as! FavouriteUserProfileVC
        profileVC.user_id = usersArray[indexPath.row].followerId
        self.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    //collection view delegate methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecentlyViewedCollectionViewCell", for: indexPath) as! RecentlyViewedCollectionViewCell
        cell.recentlyViewedUserImage.image = UIImage(named: "Bitmapsettingpic")
        cell.recentlyViewedUserNameLbl.text = "Dummy user"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.recentlySeenParentView.frame.size.width/2.5, height: self.recentlySeenParentView.frame.size.height)
    }
}
