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
    @objc dynamic var runResult : String = ""
    @objc dynamic var crunchResult : String = ""
    @objc dynamic var plankResult : String = ""
    
    convenience init(name: String, runResult: String, crunchResult: String, plankResult: String){
        self.init()
        self.name = name
        self.runResult = runResult
        self.crunchResult = crunchResult
        self.plankResult = plankResult
    }
    
}
