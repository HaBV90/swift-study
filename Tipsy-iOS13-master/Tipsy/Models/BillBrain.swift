//
//  BillBrain.swift
//  Tipsy
//
//  Created by HaBV on 25/11/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct BillBrain {
    
    var bill: Bill?
    
    mutating func calculateBill(bill: Float, tip: Int, people: Int) {
       
    }
    
//    mutating func setBillValue(bill: Float, tip: Int, people: Int) {
//        bill = Bill(billValue: Float(bill), tipValue: tip, people: people)
//    }
    
    func getBillValue() -> Float {
        return  bill?.billValue ?? 0.0
    }
    
    func getTipValue() -> Int {
        return bill?.tipValue ?? 0
    }
    
    func getPeopleValue() -> Int {
        return bill?.people ?? 0
    }
}
