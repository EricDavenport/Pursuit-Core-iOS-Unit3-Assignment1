//
//  UserInfoData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit

struct UserInfoData: Decodable {
  
  var results: [Users]
}

struct Users: Decodable {
  var gender: String
  var name: Name
  var location: Location
  var email: String
  var login: LoginInfo
  var phone: String
  var cell: String
  var picture: Picture
  
}

struct Name: Decodable {
  var title: String
  var first: String
  var last: String
}

struct Location: Decodable {
  var street: String
  var city: String
  var state: String
  var postcode: String
}

struct LoginInfo: Decodable {
  var username: String
}

struct Picture: Decodable {
  var large: String
  var medium: String
  var thumbnail: String
}

extension UserInfoData {
  
  static func getUserInfo() -> [Users] {
    var users = [Users]()
    
    guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
      fatalError("failed to locate json file.")
    }
    
    do {
      let data = try Data(contentsOf: fileURL)
      
      let userInfoData = try JSONDecoder().decode(UserInfoData.self, from: data)
      
      users = userInfoData.results
      
    } catch {
      fatalError("decoding error: \(error)")
    }
    return users
    
  }
  

}

