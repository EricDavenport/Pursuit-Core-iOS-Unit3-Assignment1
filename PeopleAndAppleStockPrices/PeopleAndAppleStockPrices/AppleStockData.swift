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
  
  static func getSections() -> [[AppleStocks]] {
    
    let applStocks = getStocks()
    
    var dateLabel = Set<String>()
    
    for stock in applStocks {
      
      var stockDate = stock.label
      var refactoredDate = stockDate.components(separatedBy: " ")
      refactoredDate.remove(at: 1)
      stockDate = refactoredDate.joined()
      dateLabel.insert(stockDate)
    }
    
    var sectionsArr = Array(repeating: [AppleStocks](), count: dateLabel.count)
    print(dateLabel.count)
    var currentIndex = 0
    
    var currentMonth = applStocks.first?.label.components(separatedBy: " ").first ?? ""
    
    for stock in applStocks {
      let month = stock.label.components(separatedBy: " ").first ?? ""
      
      if month == currentMonth {
        sectionsArr[currentIndex].append(stock)
        
      } else {
        currentIndex += 1
        currentMonth = stock.label.components(separatedBy: " ").first ?? ""
        sectionsArr[currentIndex].append(stock)
      }
    }
    return sectionsArr
    
  }
}

