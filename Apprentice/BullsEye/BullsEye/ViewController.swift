//
//  ViewController.swift
//  BullsEye
//
//  Created by Karsten Gresch on 09.11.15.
//  Copyright © 2015 Closure One. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  var currentValue: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  
  @IBAction func showAlert() {
    let message = "The value of the slider is: \(currentValue)"
    
    let alertController = UIAlertController(title: "Hello world, again.", message: message, preferredStyle: .Alert)
    
    let alertAction = UIAlertAction(title: "Thanks for the information", style: .Default, handler: nil)
    
    alertController.addAction(alertAction)
    
    presentViewController(alertController, animated: true, completion: nil )
    
  }
  
  @IBAction func sliderMoved(slider: UISlider) {
    currentValue = lroundf(slider.value)
    print("Slider value: \(currentValue) ")
  }
  
  

}

