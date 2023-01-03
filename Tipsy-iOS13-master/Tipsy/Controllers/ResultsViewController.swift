//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by HaBV on 25/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var numberOfPeople: Int?
    var tipPercentage: Double?
    var finalResult: String?
    
    override func viewDidLoad() {
        let tip = String(format: "%.0f", tipPercentage! * 100)
        super.viewDidLoad()
        totalLabel.text = finalResult
        settingsLabel.text = "Split between \(numberOfPeople!), with \(tip) tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
