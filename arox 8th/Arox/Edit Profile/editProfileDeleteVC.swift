//
//  editProfileDeleteVC.swift
//  Arox
//
//  Created by apple on 1/7/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class editProfileDeleteVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    var image:[UIImage] = [UIImage(named: "Bitmapimg4")!,UIImage(named: "Bitmapimg2")!,UIImage(named: "Bitmapsettingpic")!,UIImage(named: "1sqare")!,]

    @IBOutlet weak var profileImageEditDeleteProfile: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! editProfileDeleteCollectionViewCell
        cell.collectionImageOL.image = image[indexPath.row]
        return cell
    }

    @IBAction func uploadImageBtnAction(_ sender: UIButton) {
    }
    @IBAction func changeOrderBtnAction(_ sender: UIButton) {
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: false)
    }
    @IBAction func deleteBtnAction(_ sender: UIButton) {
    }
    
}
