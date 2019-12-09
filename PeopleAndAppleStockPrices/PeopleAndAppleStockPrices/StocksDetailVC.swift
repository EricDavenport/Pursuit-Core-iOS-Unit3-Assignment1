//
//  StocksDetailVC.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class StocksDetailVC: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var openLabel: UILabel!
  @IBOutlet weak var closeLabel: UILabel!
  
  var stock: AppleStocks?

    override func viewDidLoad() {
        super.viewDidLoad()
      updateUI()
    }
   
  func updateUI() {
    if stock!.open > stock!.close {
          imageView.image = UIImage(named: "thumbsUp")
      self.view.backgroundColor = .green
    }
    else if stock!.open < stock!.close {
      self.view.backgroundColor = .red
      imageView.image = UIImage(named: "thumbsDown")
    }
    
    navigationItem.title = stock?.label
    dateLabel.text = stock?.date
    openLabel.text = stock?.open.description
    closeLabel.text = stock?.close.description
  
}
}
