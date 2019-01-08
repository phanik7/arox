//
//  GetUserByIdModel.swift
//  Arox
//
//  Created by Vivek Dharmani on 08/01/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
struct GetUserByIdModel {
    let firstName:String
    let lastName:String
    let age:Int
    let height:String
    let imageUrl:String
    let email:String
    let phone:String
    let gender:String
    init(firstName:String,lastName:String,age:Int,height:String,imageURL:String,email:String,phone:String,gender:String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
        self.height = height
        self.imageUrl = imageURL
        self.email = email
        self.phone = phone
        self.gender = gender
    }
}
