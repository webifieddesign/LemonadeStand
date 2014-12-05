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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        styleButtons()
        let image = UIImage(named: "LemonadeStand") as UIImage?
        let startDayButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        startDayButton.frame = CGRectMake(0, 0, 308.0, 280.0)
        startDayButton.backgroundColor = UIColor.redColor()
        startDayButton.setImage(image, forState: UIControlState.Normal)
        startDayButton.addTarget(self, action: "startDayButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(startDayButton)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func purchaseLemonButtonPressed(sender: UIButton) {
        ownLemonsCount += 1
        buyLemonsCount += 1
        totalDollars -= 2
        
        ownLemonsLabel.text = "\(ownLemonsCount)"
        buyLemonsLabel.text = "\(buyLemonsCount)"
        moneyLabel.text = "\(totalDollars)"
    }
    @IBAction func unpurchaseLemonButtonPressed(sender: UIButton) {
        ownLemonsCount -= 1
        buyLemonsCount -= 1
        totalDollars += 2
        
        ownLemonsLabel.text = "\(ownLemonsCount)"
        buyLemonsLabel.text = "\(buyLemonsCount)"
        moneyLabel.text = "\(totalDollars)"
    }
    @IBAction func purchaseIceButtonPressed(sender: UIButton) {
        ownIceCount += 1
        buyIceCount += 1
        totalDollars -= 1
        
        ownIceLabel.text = "\(ownIceCount)"
        buyIceLabel.text = "\(buyIceCount)"
        moneyLabel.text = "\(totalDollars)"
        
    }
    @IBAction func unpurchaseIceButton(sender: UIButton) {
        ownIceCount -= 1
        buyIceCount -= 1
        totalDollars += 1
        
        ownIceLabel.text = "\(ownIceCount)"
        buyIceLabel.text = "\(buyIceCount)"
        moneyLabel.text = "\(totalDollars)"
    }
    @IBAction func mixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixLemonButtonPressed(sender: UIButton) {
    }
    @IBAction func mixIceButtonPressed(sender: UIButton) {
    }
    @IBAction func unmixIceButtonPressed(sender: UIButton) {
    }
    @IBAction func startDayButtonPressed(sender: UIButton) {
    }
    

    

}

