//
//  ViewController.swift
//  PeopleAndAppleStockPrices
//
//  Created by Alex Paul on 12/7/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var users = [User]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    loadData()
    navigationItem.title = "Users"
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let detailViewController = segue.destination as? UserInfoDetailVC,
      let indexPath = tableView.indexPathForSelectedRow else {
        fatalError("Unable to segue properly")
        
    }
    let user = users[indexPath.row]
    
    detailViewController.currentUser = user
    
  }
  
  func loadData() {
    users = UserInfoData.getUserInfo().sorted {$0.name.first < $1.name.first}
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
  
  
  
}

extension UserInfoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
    
    let user = users[indexPath.row]
    
    cell.textLabel?.text = "\(user.name.first.uppercased()) \(user.name.last.uppercased())"
    cell.imageView?.image = loadImage(imageURL: user.picture.thumbnail)
    
    return cell
  }
}
