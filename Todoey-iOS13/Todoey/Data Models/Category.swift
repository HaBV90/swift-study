//
//  Category.swift
//  Todoey
//
//  Created by HaBV on 16/12/2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation
import RealmSwift
import UIKit

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var color: String?
    let items = List<Item>()
}
