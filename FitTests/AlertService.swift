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
    
    static func addAlert(in vc: UIViewController, completion: @escaping (String, String, String,String,String,String,String)->()) {
        
        let alert = UIAlertController(title: "Add new test results:", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (nameTextField) in
            nameTextField.placeholder = "client name"
        }
        alert.addTextField { (dateTxtField) in
            dateTxtField.placeholder = "date"
        }
        alert.addTextField { (runTextField) in
            runTextField.placeholder = "run result in 12 min"
        }
        alert.addTextField { (crunchTextField) in
            crunchTextField.placeholder = "crunches result in 1 min"
        }
        alert.addTextField { (plankTextField) in
            plankTextField.placeholder = "plank max time"
        }
        alert.addTextField { (pushupTxtField) in
            pushupTxtField.placeholder = "pushup result in 1 min"
        }
        alert.addTextField { (rowTxtField) in
            rowTxtField.placeholder = "row result time (500 m)"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let date = alert.textFields?[1].text,
                let runResult = alert.textFields?[2].text,
                let crunchResult = alert.textFields?[3].text,
                let plankResult = alert.textFields?[4].text,
                let pushupResult = alert.textFields?[5].text,
                let rowResult = alert.textFields?.last?.text
            
            else {return}
            
            completion(name, date, runResult, crunchResult, plankResult, pushupResult, rowResult)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    static func updateAlert(in vc: UIViewController, tests: Tests, completion: @escaping (String, String, String,String,String,String,String)->()) {
        let alert = UIAlertController(title: "Edit results:", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (nameField) in
            nameField.placeholder = "client name"
            nameField.text = tests.name
        }
        alert.addTextField { (dateField) in
            dateField.placeholder = "date"
            dateField.text = tests.date
        }
        alert.addTextField { (runField) in
            runField.placeholder = "run result in 12 min"
            runField.text = tests.runResult
        }
        alert.addTextField { (crunchField) in
            crunchField.placeholder = "crunches result in 1 min"
            crunchField.text = tests.crunchResult
        }
        alert.addTextField { (plankField) in
            plankField.placeholder = "plank max time"
            plankField.text = tests.plankResult
        }
        alert.addTextField { (pushupField) in
            pushupField.placeholder = "pushup result in 1 min"
            pushupField.text = tests.pushupResult
        }
        alert.addTextField { (rowField) in
            rowField.placeholder = "row result time (500 m)"
        }
        
        
        let updateAction = UIAlertAction(title: "Update", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
            let date = alert.textFields?[1].text,
            let runResult = alert.textFields?[2].text,
            let crunchResult = alert.textFields?[3].text,
            let plankResult = alert.textFields?[4].text,
            let pushupResult = alert.textFields?[5].text,
            let rowResult = alert.textFields?[6].text
            else {return}
        
        completion(name, date, runResult, crunchResult, plankResult, pushupResult, rowResult)
    }
    
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive , handler: nil)
        alert.addAction(updateAction)
        alert.addAction(cancelAction)
        vc.present(alert, animated: true, completion: nil)
    }
    
    
    
}
