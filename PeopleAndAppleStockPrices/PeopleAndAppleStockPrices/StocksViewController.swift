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

  var stocks = [[AppleStocks]]() {
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
    stocks = AppleStocks.getSections()
  }
  
  func averageForTheMonth(stocks: [AppleStocks]) -> Double {
    var average: Double = 0
    for each in stocks {
      average += each.open

    }
    return average / Double(stocks.count)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailVC = segue.destination as? StocksDetailVC,
      let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("failed to segue properly - check StocksViewController")
    }
    detailVC.stock = stocks[indexPath.section][indexPath.row]
    
  }
}

extension StocksViewController: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "stockCell", for: indexPath)
    
    let stock = stocks[indexPath.section][indexPath.row]
    
    cell.textLabel?.text = stock.date
    
    return cell
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    stocks[section].count
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return stocks.count
  }
  
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    let newTitle = stocks[section].first?.label.components(separatedBy: " ")
    let month = newTitle?.first ?? ""
    let year = newTitle?.last ?? ""
    let average = averageForTheMonth(stocks: stocks[section])
    let aString = String(format: "%.2f", average)
      return "\(month) \(year) Avg: \(aString)"
  }
}
