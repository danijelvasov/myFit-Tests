//
//  AlertService.swift
//  FitTests
//
//  Created by Danijel Vasov on 9/4/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit

class AlertService {
    
    private init () {}
    
    static func addAlert(in vc: UIViewController, completion: @escaping (String, String, String)->()) {
        
        let alert = UIAlertController(title: "Add new test results:", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "client name"
        }
        alert.addTextField { (runTextField) in
            runTextField.placeholder = "run result"
        }
        alert.addTextField { (crunchTextField) in
            crunchTextField.placeholder = "crunches result"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let runResult = alert.textFields?[1].text,
                let crunchResult = alert.textFields?.last?.text
            else {return}
            
            completion(name,runResult,crunchResult)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func updateAlert(in vc: UIViewController, tests: Tests, completion: @escaping (String, String, String)->()) {
        let alert = UIAlertController(title: "Edit results:", message: nil, preferredStyle: .alert)
        alert.addTextField { (nameField) in
            nameField.placeholder = "client name"
            nameField.text = tests.name
        }
        alert.addTextField { (runField) in
            runField.placeholder = "run result"
            runField.text = tests.runResult
        }
        alert.addTextField { (crunchField) in
            crunchField.placeholder = "crunches result"
            crunchField.text = tests.crunchResult
        }
        
        
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
            let runResult = alert.textFields?[1].text,
            let crunchResult = alert.textFields?.last?.text else {return}
        
        completion(name, runResult,crunchResult)
    }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive , handler: nil)
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    
}
