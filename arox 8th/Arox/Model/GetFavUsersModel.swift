//
//  GetFavUsersModel.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
struct GetFavUsers {
    let firstName:String
    let lastName:String
    let id:String
    let imageUrl:String
    let status:String
    let followerId:String
    init(firstName:String,lastName:String,id:String,imageURL:String,status:String,followerId:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.id = id
        self.imageUrl = imageURL
        self.status = status
        self.followerId = followerId
    }
}
