//
//  ViewController.swift
//  iOS Assignment 2 - James Henshall
//
//  Created by Fiona on 20/5/17.
//  Copyright © 2017 Fiona. All rights reserved.
//

import UIKit
    var myIndex = 0

class ViewController: UITableViewController {
    
    var dataArray0 = ArrayController.sharedInstance.Array0
    var dataArray1 = ArrayController.sharedInstance.Array1
    var dataArray2 = ArrayController.sharedInstance.Array2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //reload tableview so it appears on inital launch
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Only one section / category in table. (Could allow user to add categories later??)
    
    // Load arrays
    override func viewDidAppear(_ animated: Bool) {
        //        Code for clearing User Defaults.
        //        UserDefaults.standard.removeObject(forKey: "Array1")
        //        UserDefaults.standard.removeObject(forKey: "Array2")
        //        UserDefaults.standard.removeObject(forKey: "Array0")
        
        //Check if user defaults is empty before loading
        if let x = UserDefaults.standard.object(forKey: "Array1") as? Array<Any>
        {
            ArrayController.sharedInstance.Array1 = x as! [String]
        }
        
        if let y = UserDefaults.standard.object(forKey: "Array2") as? Array< Any>
        {
            ArrayController.sharedInstance.Array2 = y as! [String]
        }
        
        if let z = UserDefaults.standard.object(forKey: "Array0") as? Array< Any>
        {
            ArrayController.sharedInstance.Array0 = z as! [Data]
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Number of rows in table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray1.count //Returning length of array
    }
    
    override func tableView(_ tableVIew: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = dataArray1[indexPath.row]
        }
        else
        {
            cell.textLabel?.text = "Section two" //Allowing for implementation of multiple sections if desired later
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    
}

