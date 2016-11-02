//
//  ViewController.swift
//  Checklists10
//
//  Created by Karsten Gresch on 17.10.16.
//  Copyright © 2016 Closure One. All rights reserved.
//

import UIKit

class Checklist10ViewController: UITableViewController {
  
  var checklist10Items: [Checklist10Item]
  
  
  required init?(coder aDecoder: NSCoder) {
    checklist10Items = [Checklist10Item]()
    
    let row0item = Checklist10Item()
    row0item.text = "Walk the dog"
    row0item.checked = false
    checklist10Items.append(row0item)
    let row1item = Checklist10Item()
    row1item.text = "Brush my teeth"
    row1item.checked = true
    checklist10Items.append(row1item)
    let row2item = Checklist10Item()
    row2item.text = "Learn iOS development"
    row2item.checked = true
    checklist10Items.append(row2item)
    let row3item = Checklist10Item()
    row3item.text = "Soccer practice"
    row3item.checked = false
    checklist10Items.append(row3item)
    let row4item = Checklist10Item()
    row4item.text = "Eat ice cream"
    row4item.checked = true
    checklist10Items.append(row4item)
    
    super.init(coder: aDecoder)
  }

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
    
    print("cellForRowAt indexPath: \(indexPath )")
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)

    let checklist10Item = checklist10Items[indexPath.row]
    let label = cell.viewWithTag(1000) as! UILabel
    label.text = checklist10Item.text
    
    configureCheckmark(for: cell, at: indexPath)
    
    return cell
  }
  
  // MARK: TV delegate related
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("didSelectRowAt indexPath: \(indexPath )")
    
    if let cell = tableView.cellForRow(at: indexPath) {
      if indexPath.row == 0 {
        checklist10Items[0].checked = !checklist10Items[0].checked
      } else if indexPath.row == 1 {
        checklist10Items[1].checked = !checklist10Items[1].checked
      } else if indexPath.row == 2 {
        checklist10Items[2].checked = !checklist10Items[2].checked
      } else if indexPath.row == 3 {
        checklist10Items[3].checked = !checklist10Items[3].checked
      } else if indexPath.row == 4 {
        checklist10Items[4].checked = !checklist10Items[4].checked
      }
     configureCheckmark(for: cell, at: indexPath)
      
    }
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // MARK Individual methods
  
  func configureCheckmark(for cell: UITableViewCell, at indexPath: IndexPath) {
    
    print("configureCheckmark cell: \(cell) indexPath: \(indexPath )")

    var isChecked = false
   
    if indexPath.row == 0 {
      isChecked = checklist10Items[0].checked
    } else if indexPath.row == 1 {
      isChecked = checklist10Items[1].checked
    } else if indexPath.row == 2 {
      isChecked = checklist10Items[2].checked
    } else if indexPath.row == 3 {
      isChecked = checklist10Items[3].checked
    } else if indexPath.row == 4 {
      isChecked = checklist10Items[4].checked
    }
    if isChecked {
      cell.accessoryType = .checkmark
    } else {
      cell.accessoryType = .none
    }
  }
  
  

}

