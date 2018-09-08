//
//  Tests.swift
//  FitTests
//
//  Created by Danijel Vasov on 9/6/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import Foundation
import RealmSwift

class Tests: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var runResult : String = ""
    @objc dynamic var crunchResult : String = ""
    @objc dynamic var plankResult : String = ""
    @objc dynamic var pushupResult : String = ""
    @objc dynamic var rowResult : String = ""
    
    convenience init(name: String, date: String, runResult: String, crunchResult: String, plankResult: String, pushupResult: String, rowResult: String){
        self.init()
        self.name = name
        self.date = date
        self.runResult = runResult
        self.crunchResult = crunchResult
        self.plankResult = plankResult
        self.pushupResult = pushupResult
        self.rowResult = rowResult
    }
    
}
