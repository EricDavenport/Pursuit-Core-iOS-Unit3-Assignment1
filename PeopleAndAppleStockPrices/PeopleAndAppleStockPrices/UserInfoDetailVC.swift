//
//  UserInfoDetailVC.swift
//  PeopleAndAppleStockPrices
//
//  Created by Eric Davenport on 12/5/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class UserInfoDetailVC: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var genderLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  
  
  var currentUser: User?

    override func viewDidLoad() {
        super.viewDidLoad()
      navigationItem.title = currentUser?.name.fullName(user: currentUser!)
      updateUI()
    }
  
  func loadImage(imageURL: String) -> UIImage {
    var image: UIImage
    guard let url = URL(string: imageURL) else {
      fatalError("bad url: \(imageURL)")
    }
    
    do {
      let imageData = try Data(contentsOf: url)
      image = UIImage(data: imageData)!
    } catch {
      fatalError("\(error)")
    }
    return image
  }

  
  func updateUI() {
    imageView.image = loadImage(imageURL: (currentUser?.picture.large)!)
      genderLabel.text = currentUser?.gender
        phoneLabel.text = "Home: \(currentUser!.phone)\nCell: \(currentUser!.cell)"
    locationLabel.text = "\(currentUser!.location.street) \(currentUser!.location.city) \(currentUser!.location.state) \(currentUser!.location.postcode)"
    emailLabel.text = currentUser?.email
  }
  
    

    
}
