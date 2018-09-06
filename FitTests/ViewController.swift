//
//  ViewController.swift
//  FitTests
//
//  Created by Danijel Vasov on 9/4/18.
//  Copyright © 2018 OSX. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var testsArray : Results<Tests>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let realm = RealmServices.sharedInstance.realm  // read from Realm File
        testsArray = realm.objects(Tests.self)
        tableView.reloadData()
    }

    @IBAction func addBtnPressed(_ sender: Any) {
        AlertService.addAlert(in: self) { (name, runResult, crunchResult) in
            let newTestResultToSave = Tests(name: name, runResult: runResult, crunchResult: crunchResult)
            RealmServices.sharedInstance.save(newTestResultToSave)
            self.tableView.insertRows(at: [IndexPath(row: self.testsArray.count-1, section: 0)], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? Cell else { return UITableViewCell() }
        let testResults = testsArray[indexPath.row]
        cell.configureCell(with: testResults)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testsArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let testToEdit = testsArray[indexPath.row]
        AlertService.updateAlert(in: self, tests: testToEdit) { (name, runResult, crunchResult) in
            let dictionary : [String : Any?] = ["name" : name,
                                                                "runResult" : runResult,
                                                                "crunchResult": crunchResult]
            RealmServices.sharedInstance.update(testToEdit, with: dictionary)
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else {return}
        let testToDelete = testsArray[indexPath.row]
        RealmServices.sharedInstance.delete(testToDelete)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }

}


class Cell : UITableViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var runLbl: UILabel!
    @IBOutlet weak var brunchLbl: UILabel!
    
    func configureCell(with tests: Tests){
        nameLbl.text = tests.name
        runLbl.text = tests.runResult
        brunchLbl.text = tests.crunchResult
    }
    
}

