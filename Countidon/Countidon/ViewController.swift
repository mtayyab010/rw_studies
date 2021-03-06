//
//  ViewController.swift
//  Countidon
//
//  Created by Karsten Gresch on 18.09.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}



class ViewController: UIViewController {
  
  @IBOutlet weak var counterView: CounterView!
  @IBOutlet weak var counterLabel: UILabel?
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var graphView: GraphView!
  // dynamic labels
  @IBOutlet weak var averageWaterDrunk: UILabel?
  @IBOutlet weak var maxLabel: UILabel?
  @IBOutlet weak var medalView: MedalView?
  
  var isGraphViewShowing = false
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let counterValue = counterView?.counter
    {
     counterLabel?.text = "\(counterValue)"
    } else {
     counterLabel?.text = "0"
    }
    checkTotal()
    
    
    
    // let tapGR = UITapGestureRecognizer(target: self, action: "counterViewTap:")
//     self.containerView.addGestureRecognizer(tapGR)
//    self.counterView.addGestureRecognizer(tapGR)
//     self.graphView.addGestureRecognizer(tapGR)
    
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: Inidivual stuff
  func setupGraphDisplay() {
    // let numberOfDays: Int = 7
    
    // replace last day w/ today's data
    graphView.graphPoints[graphView.graphPoints.count-1] = counterView.counter
    graphView.setNeedsDisplay()
    maxLabel?.text = "\(graphView.graphPoints.max())"
    // average from graphPoints
    let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
    averageWaterDrunk?.text = "\(average)"
    
    // today's day number
    // let dateFormatter = NSDateFormatter()
    let calendar = Calendar.current
    let componentOptions: NSCalendar.Unit = .weekday
    let components = (calendar as NSCalendar).components(componentOptions, from: Date())

    var weekday = components.weekday
    let days = ["S", "S", "M", "T", "W", "T", "F"]
    
    for i in (1...days.count).reversed() {
      if let labelView = graphView.viewWithTag(i) as? UILabel {
        if weekday == 7 {
          weekday = 0
        }
        labelView.text = days[(weekday--)!]
        if weekday < 0 {
          weekday = days.count - 1
        }
      }
    }
  }
  
  func checkTotal() {
   
     if let checkedMedalView = medalView  {
   if counterView.counter >= 8 {
      checkedMedalView.showMedal(true)
          }
    else {
   
     checkedMedalView.showMedal(false)
    }
    }
   
  }
  
    // MARK: Actions
  
  @IBAction func pushButtonPressed(_ button: PushButtonView) {
    if button.isAddButton {
      if counterView?.counter <= NumberOfGlasses {
        counterView?.counter++
      }
    } else {
      if counterView?.counter > 0 {
        counterView?.counter--
      }
    }
    
    if let currentCounter = counterView?.counter
    {
      print(currentCounter)
      counterLabel!.text = String(currentCounter)
    }
      
    if isGraphViewShowing {
      counterViewTap(nil)
    }
    
    checkTotal()
    
  }
  
  @IBAction func counterViewTap(_ gestureRecognizer: UITapGestureRecognizer?) {
    print("******* in tapped 1 GraphView showing: \(isGraphViewShowing)")
    // if let counterViewTapped = counterView, let graphViewTapped = graphView
    // {
      print("******* in tapped 2")
      if (isGraphViewShowing) {
        UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        
      } else {
        UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
          setupGraphDisplay()
      }
      isGraphViewShowing = !isGraphViewShowing
  }
  
  
  
}

