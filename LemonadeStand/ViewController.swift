//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Chris Shaughnessy on 12/4/14.
//  Copyright (c) 2014 Webified Design. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ownLemonsLabel: UILabel!
    @IBOutlet weak var ownIceLabel: UILabel!
    @IBOutlet weak var buyLemonsLabel: UILabel!
    @IBOutlet weak var buyIceLabel: UILabel!
    @IBOutlet weak var mixLemonsLabel: UILabel!
    @IBOutlet weak var mixIceLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var customerCountLabel: UILabel!

    @IBOutlet weak var weatherImageView: UIImageView!
    
    @IBOutlet weak var purchaseLemonButton: UIButton!
    @IBOutlet weak var unpurchaseLemonButton: UIButton!
    @IBOutlet weak var purchaseIceButton: UIButton!
    @IBOutlet weak var unpurchaseIceButton: UIButton!
    @IBOutlet weak var mixLemonButton: UIButton!
    @IBOutlet weak var unmixLemonButton: UIButton!
    @IBOutlet weak var mixIceButton: UIButton!
    @IBOutlet weak var unmixIceButton: UIButton!
    
    var totalDollars = 10
    var ownLemonsCount = 1
    var ownIceCount = 1
    var buyLemonsCount = 0
    var buyIceCount = 0
    var mixLemonsCount = 0
    var mixIceCount = 0
    var numberOfVisitors = 0
    var numberOfCustomers = 0
    var lemonadeRatio: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        if totalDollars <= 0 {
            showAlertWithText("Uh oh", message: "You ran out of money!")
        }
        else {
            ownLemonsCount += 1
            buyLemonsCount += 1
            totalDollars -= 2
            
            ownLemonsLabel.text = "\(ownLemonsCount)"
            buyLemonsLabel.text = "\(buyLemonsCount)"
            moneyLabel.text = "\(totalDollars)"
        }
        
        if buyLemonsCount > 0 {
            unpurchaseLemonButton.enabled = true
        }
    }
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        
            ownLemonsCount -= 1
            buyLemonsCount -= 1
            totalDollars += 2
            
            ownLemonsLabel.text = "\(ownLemonsCount)"
            buyLemonsLabel.text = "\(buyLemonsCount)"
            moneyLabel.text = "\(totalDollars)"
        
        if buyLemonsCount <= 0 || ownLemonsCount <= 0{
            unpurchaseLemonButton.enabled = false
        }
    }
    @IBAction func purchaseIceButtonPressed(sender: UIButton) {
        if totalDollars <= 0 {
            showAlertWithText("Uh oh", message: "You ran out of money!")
        }
        else {
            ownIceCount += 1
            buyIceCount += 1
            totalDollars -= 1
            
            ownIceLabel.text = "\(ownIceCount)"
            buyIceLabel.text = "\(buyIceCount)"
            moneyLabel.text = "\(totalDollars)"
        }
        if buyIceCount > 0 {
            unpurchaseIceButton.enabled = true
        }
        
    }
    @IBAction func unpurchaseIceButton(sender: UIButton) {
        ownIceCount -= 1
        buyIceCount -= 1
        totalDollars += 1
        
        ownIceLabel.text = "\(ownIceCount)"
        buyIceLabel.text = "\(buyIceCount)"
        moneyLabel.text = "\(totalDollars)"
        
        if buyIceCount <= 0 || ownIceCount <= 0 {
            unpurchaseIceButton.enabled = false
        }
    }
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
        if ownLemonsCount <= 0 {
            showAlertWithText("Uh oh", message: "You ran out of lemons!")
        }
        else {
            mixLemonsCount += 1
            ownLemonsCount -= 1
            
            mixLemonsLabel.text = "\(mixLemonsCount)"
            ownLemonsLabel.text = "\(ownLemonsCount)"
            if ownLemonsCount == 0 {
                unpurchaseLemonButton.enabled = false
            }
        }
        if mixLemonsCount > 0 {
            unmixLemonButton.enabled = true
        }
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
        mixLemonsCount -= 1
        ownLemonsCount += 1
        
        mixLemonsLabel.text = "\(mixLemonsCount)"
        ownLemonsLabel.text = "\(ownLemonsCount)"
        
        if mixLemonsCount <= 0 {
            unmixLemonButton.enabled = false
        }
        if ownLemonsCount > 0 {
            unpurchaseLemonButton.enabled = true
        }
    }
    @IBAction func mixIceButtonPressed(sender: UIButton) {
        if ownIceCount <= 0 {
            showAlertWithText("Uh oh", message: "You ran out of ice!")
        }
        else {
            mixIceCount += 1
            ownIceCount -= 1
            
            mixIceLabel.text = "\(mixIceCount)"
            ownIceLabel.text = "\(ownIceCount)"
            if ownIceCount == 0 {
                unpurchaseIceButton.enabled = false
            }
        }
        if mixIceCount > 0 {
            unmixIceButton.enabled = true
        }
    }
    @IBAction func unmixIceButtonPressed(sender: UIButton) {
        mixIceCount -= 1
        ownIceCount += 1
        
        mixIceLabel.text = "\(mixIceCount)"
        ownIceLabel.text = "\(ownIceCount)"
        
        if mixIceCount <= 0 {
            unmixIceButton.enabled = false
        }
        else {
            unpurchaseIceButton.enabled = true
        }
    }
    @IBAction func startDayButtonPressed(sender: UIButton) {
        
        self.lemonadeRatio = CGFloat(mixLemonsCount) / CGFloat(mixIceCount)
        self.numberOfVisitors = Int(arc4random_uniform(UInt32(10)) + 1)
        
        var weatherRating = Int(arc4random_uniform(UInt32(3)) + 1)
        var taste: CGFloat = 0.0
        
        if mixLemonsCount == 0 || mixIceCount == 0 {
            showAlertWithText("Not so fast", message: "You need to mix your lemonade first!")
        }
        else {
            if weatherRating == 1 {
                weatherImageView.hidden = true
                if numberOfVisitors >= 3 {
                    numberOfVisitors -= 3
                }
                else {
                    while numberOfVisitors > 0 {
                        numberOfVisitors--
                    }
                }
            }
            else if weatherRating == 2 {
                weatherImageView.image = UIImage(named: "mild")
                weatherImageView.hidden = false
            }
            else if weatherRating == 3 {
                weatherImageView.image = UIImage(named: "rain")
                weatherImageView.hidden = false
                numberOfVisitors += 4
            }
            
            for var i = 0; i < numberOfVisitors; i++ {
                var tasteInt = CGFloat(arc4random_uniform(10))
                taste = (tasteInt / 10)
                
                if taste < 0.4 && lemonadeRatio > 1 {
                    totalDollars++
                    numberOfCustomers++
                    println("Customer Taste: \(taste)")
                    println("Paid!")
                }
                else if taste >= 0.4 && taste <= 0.6 && lemonadeRatio == 1.0 {
                    totalDollars++
                    numberOfCustomers++
                    println("Customer Taste: \(taste)")
                    println("Paid!")
                }
                else if taste < 1 && taste > 0.6 && lemonadeRatio < 1 {
                    totalDollars++
                    numberOfCustomers++
                    println("Customer Taste: \(taste)")
                    println("Paid!")
                }
                else {
                    println("Customer Taste: \(taste)")
                    println("No Match, No Revenue")
                }
            }
            println("****End of Day****")
            customerCountLabel.text = "\(numberOfCustomers)"
            resetBuysAndMixes()
        }
    }
    
    func resetBuysAndMixes() {
        buyLemonsCount = 0
        buyIceCount = 0
        mixLemonsCount = 0
        mixIceCount = 0
        numberOfVisitors = 0
        numberOfCustomers = 0
        resetLabels()
    }
    func resetLabels() {
        buyLemonsLabel.text = "\(buyLemonsCount)"
        buyIceLabel.text = "\(buyIceCount)"
        mixLemonsLabel.text = "\(mixLemonsCount)"
        mixIceLabel.text = "\(mixIceCount)"
        moneyLabel.text = "\(totalDollars)"
    }
    func showAlertWithText (header: String, message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

