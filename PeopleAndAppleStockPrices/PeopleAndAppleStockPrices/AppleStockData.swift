//
//  AppleStockData.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation
import UIKit


struct AppleStocks: Decodable {
  let date: String
  let uClose: Double
  let uHigh: Double
  let uLow: Double
  let uVolume: Double
  let close: Double
  let open: Double
  let high: Double
  let low: Double
  let volume: Double
  let change: Double
  let changePercent: Double
  let label: String
  let changeOverTime: Double
}

//func dateFormatter() -> Date {
//  let formatter = DateFormatter()
//}


extension AppleStocks {
  static func getStocks() -> [AppleStocks] {
    var stocks = [AppleStocks]()
    
    guard let fileURL = Bundle.main.url(forResource: "applstockinfo", withExtension: "json") else {
      fatalError("")
    }
    
    do {
      let data = try Data(contentsOf: fileURL)
      
      let stockInfoData = try JSONDecoder().decode([AppleStocks].self, from: data)
      
      stocks = stockInfoData
    } catch {
      fatalError("")
    }
    return stocks
  }
}
