//
//  ViewController.swift
//  SeeFood
//
//  Created by Joseph Pizzo on 4/18/18.
//  Copyright © 2018 PEEZEE. All rights reserved.
//

import UIKit
import CoreML
import Vision


// Addes in UIPickerControllerDelegate and UINavigationControllerDelegate to enable use of camera
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Image View
    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //any error may be tied to the delegate set in ViewController class
        imagePicker.delegate = self
        
        // brings up an UIImagePicker that contains the camera module allowing the user to use the front or rear camera
        imagePicker.sourceType = .camera
        
        // brings up an UIImagePicker that contains the camera module allowing the user to use the photolibrary
        //imagePicker.sourceType = .photoLibrary
        
        // Is the user allowed to edit the image? allows the user to crop image to decrease area of item
        imagePicker.allowsEditing = false
    }
    
    // delegate method- tells the Viewcontroller class that the user haas picked an image or a movie
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        //down cast to UIImage with optional binding with as? and set as UIImage
        if let userPickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = userPickedImage
        }
        
        imagePicker.dismiss(animated: true, completion: nil)
        
    }

    
    //Camera Button Tapped
    @IBAction func CameraTapped(_ sender: UIBarButtonItem) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    


}

