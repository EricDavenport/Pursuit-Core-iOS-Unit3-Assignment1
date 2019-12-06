//
//  StocksViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!

  var stocks = [AppleStocks]() {
    didSet {
      tableView.reloadData()
    }
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
      tableView.dataSource = self
    }
  
  func updateUI() {
    stocks = AppleStocks.getStocks().sorted {$0.date < $1.date}
  }
    
  

    

}

extension StocksViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
    
    let stock = stocks[indexPath.row]
    
    cell.textLabel?.text = stock.date
    
    return cell
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    stocks.count
  }
}
