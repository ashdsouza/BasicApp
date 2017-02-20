//
//  ViewController.swift
//  BasicApp
//
//  Created by Ashley F Dsouza on 2/17/17.
//  Copyright © 2017 Ashley F Dsouza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    //MARK: Properties
    @IBOutlet weak var screenName: UITextField!
    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callback.
        screenName.delegate = self
    }
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        screenLabel.text = screenName.text
    }
    
    //MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker when the user hits cancel
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representation of the image. You want to use original
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        else {
            fatalError("Expected a dictionary containing an image, but was provided  the following: \(info)")
        }
        
        //set the photoImageView to display the selected image
        photoImageView.image = selectedImage
        
        //Dismiss the picker when the user hits cancel
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        screenName.resignFirstResponder()
        
        //UIImagePickerController is a view controller that lets a user pick  media from their photo library
        let imagePickerController = UIImagePickerController()
        
        //only allows pictures to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        //Make sure the ViewController knows when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func setDefaultScreen(_ sender: UIButton) {
        screenLabel.text = "Starting..."
    }
}

