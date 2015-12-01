//
//  ViewController.swift
//  Checklists
//
//  Created by Karsten Gresch on 25.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
  
  var checkListItems = [ChecklistItem]()
  
  required init?(coder aDecoder: NSCoder) {
    let row0item = ChecklistItem()
    row0item.text = "Walk the fish."
    row0item.checked = false
    checkListItems.append(row0item)

    let row1item = ChecklistItem()
    row1item.text = "Massage my neck."
    row1item.checked = false
    checkListItems.append(row1item)
    
    let row2item = ChecklistItem()
    row2item.text = "Learn singing."
    row2item.checked = false
    checkListItems.append(row2item)
    
    let row3item = ChecklistItem()
    row3item.text = "ASMR practice."
    row3item.checked = false
    checkListItems.append(row3item)
    
    let row4item = ChecklistItem()
    row4item.text = "Eat File Wellington."
    row4item.checked = false
    checkListItems.append(row4item)
    
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
  
  // MARK: Content related methods
  func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    
    if checklistItem.checked {
      cell.accessoryType = .Checkmark
    } else {
      cell.accessoryType = .None
    }
  }
  
  func configureTextForCell(cell: UITableViewCell, withChecklistItem checklistItem: ChecklistItem) {
    let label = cell.viewWithTag(1000) as? UILabel
    label?.text =  checklistItem.text
  }
  
  // MARK: Data Source methods
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return checkListItems.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
    let checklistItem = checkListItems[indexPath.row]

    configureTextForCell(cell, withChecklistItem: checklistItem)
    configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
    
    return cell
  }
  
  
    // MARK: Table delegate methods
  override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    if let cell = tableView.cellForRowAtIndexPath(indexPath) {
       let checklistItem = checkListItems[indexPath.row]
   checklistItem.toggleChecked()
   configureCheckmarkForCell(cell, withChecklistItem: checklistItem)
      
    }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

}

