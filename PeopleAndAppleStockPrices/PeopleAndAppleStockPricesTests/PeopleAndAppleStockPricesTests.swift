//
//  PeopleAndAppleStockPricesTests.swift
//  PeopleAndAppleStockPricesTests
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import XCTest
@testable import PeopleAndAppleStockPrices

class PeopleAndAppleStockPricesTests: XCTestCase {
  
  let filename = "userinfo"
  let ext = "json"

  func testUserInfoData() {
    let data = getData()
    
    
    XCTAssertNotNil(data)
  }
  
  func testUserData() {
    let users = getUsers()

    XCTAssertNotNil(users)
  }
  

}

extension PeopleAndAppleStockPricesTests {
  func getData() -> Data {
    let data = Bundle.readRawJSONData(filename: filename, ext: ext)
    return data
  }
  
  func getUsers() -> [Users]{
    let users = UserInfoData.getUserInfo()
    return users
  }
}
