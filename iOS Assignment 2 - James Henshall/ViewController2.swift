//
//  ViewController2.swift
//  iOS Assignment 2 - James Henshall
//
//  Created by Fiona on 20/5/17.
//  Copyright © 2017 Fiona. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionBox!.layer.borderWidth = 0.4
        titleBox!.layer.borderWidth = 0.4
        userImage.image = UIImage(named: "mealtime")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var titleBox: UITextField!
    @IBOutlet weak var descriptionBox: UITextView!

    
    @IBAction func selectPhoto(_ sender: Any) {
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        
        image.allowsEditing = false
        
        self.present(image, animated: true)
        {
            //After it is complete
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            userImage.image = image
        }
        else
        {
            //Error message to add.
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func publishButton(_ sender: UIButton) {
        
        let rTitle = String(titleBox.text!)
        
        let rDescription = String(descriptionBox.text!)
        
        let rImageRep = UIImageJPEGRepresentation(userImage.image!, 1.0)
        
        
        //User attempting to publish without a title or instructions
        if (rTitle == "" || rTitle == nil || rDescription == "" || rDescription == nil)
        {
            let alertController = UIAlertController(title: "Error", message:
                "Please provide a recipe title and instructions", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
        }
        else
            //Add to corresponding arrays
        {
            ArrayController.sharedInstance.Array1.append(rTitle!)
            ArrayController.sharedInstance.Array2.append(rDescription!)
            
           ArrayController.sharedInstance.Array0.append(rImageRep!)
            
            // Stores array information into UserDefaults so it's available between sessions.
            UserDefaults.standard.set(ArrayController.sharedInstance.Array1, forKey: "Array1")
            UserDefaults.standard.set(ArrayController.sharedInstance.Array2, forKey: "Array2")
            UserDefaults.standard.set(ArrayController.sharedInstance.Array0, forKey: "Array0")
            
            //reset inputs to default
            titleBox.text = ""
            descriptionBox.text = ""
            userImage.image = UIImage(named: "mealtime")
            
            //Display alert that recipe has been added -- Inplace of
            // transporting using back to catalogue
            let alertController = UIAlertController(title: "Recipe added!", message:
                "You're ready to cook!", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
