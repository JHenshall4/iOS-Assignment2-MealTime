//
//  ViewController3.swift
//  iOS Assignment 2 - James Henshall
//
//  Created by Fiona on 20/5/17.
//  Copyright © 2017 Fiona. All rights reserved.
// 

import UIKit

class ViewController3: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = ArrayController.sharedInstance.Array1[myIndex]        
        descriptionLabel.text = ArrayController.sharedInstance.Array2[myIndex]
   // Converts image data back into image
        userBackground.image = UIImage(data:ArrayController.sharedInstance.Array0[myIndex])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var userBackground: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
