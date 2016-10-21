//
//  ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class Checklist10ViewController: UITableViewController {
  
  var row0text = "Walk the dog"
  var row1text = "Brush teeth"
  var row2text = "Learn iOS development"
  var row3text = "Soccer practice"
  var row4text = "Eat ice cream"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: TV Data Source related
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
    
    if let label = cell.viewWithTag(1000) as! UILabel? {
      if indexPath.row == 0 {
        label.text = row0text
      } else if indexPath.row == 1 {
        label.text = row1text
      } else if indexPath.row == 2 {
        label.text = row2text
      } else if indexPath.row == 3 {
        label.text = row3text
      } else if indexPath.row == 4 {
        label.text = row4text
      }
    }
    
    return cell
  }
  
  // MARK: TV delegate related
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
      } else {
        cell.accessoryType = .none
      }
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }

}

