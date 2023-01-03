//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    let title: String
    let choiceOne: String
    let choiceOneDestination: Int
    let choiceTwo: String
    let choiceTwoDestination: Int
    
    init(t: String, c1: String, cd1: Int, c2: String, cd2: Int) {
        title = t
        choiceOne = c1
        choiceTwo = c2
        choiceOneDestination = cd1
        choiceTwoDestination = cd2
    }
}
