//
//  Bundle+Extensions.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Bundle {
    class func readRawJSONData(filename: String, ext: String) -> Data {
        guard let fileURL = Bundle.main.url(forResource: filename, withExtension: ext) else {
            fatalError("resource with filename \(filename) not found")
        }
        var data: Data!
        do {
            data = try Data(contentsOf: fileURL)
            
        } catch {
            fatalError("contents not found eror \(error)")
        }
   return data
}
}
