//
//  RealmServices.swift
//  FitTests
//
//  Created by Danijel Vasov on 9/4/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import Foundation
import RealmSwift


class RealmServices {
    private init() {}
    static let sharedInstance = RealmServices()
    
    let realm = try! Realm() 
    
    func save<T: Object>(_ object:  T ) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
            print(error)
        }
    }
    
    func update<T: Object>(_ object: T, with dictionary: [String : Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print(error)
        }
    }
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        }catch {
            print(error)
        }
    }
    
    
    
    
}
