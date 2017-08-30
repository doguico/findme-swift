//
//  ViewController.swift
//  findMe
//
//  Created by Guido Corazza on 8/29/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class MyProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var petPictureImageView: UIImageView!
    @IBOutlet weak var petNameTextField: UITextField!
    @IBOutlet weak var petDescriptionTextField: UITextField!
    @IBOutlet weak var userFirstNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "defaultImage")
        let pet = Pet(name: "Layla", description: "Es cachorra", picture: image)
        user = User(name: "Guido", lastname: "Corazza", pet: pet, phoneNumber: "123123123")
        
        self.petPictureImageView.image = user?.pet.picture
        self.petNameTextField.text = user?.pet.name
        self.petDescriptionTextField.text = user?.pet.description
        self.userFirstNameTextField.text = user?.name
        self.userLastNameTextField.text = user?.lastname
        self.phoneNumberTextField.text = user?.phoneNumber
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set photoImageView to display the selected image.
        user?.pet.picture = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: Actions
    
    @IBAction func saveChanges(_ sender: UIBarButtonItem) {
        user?.name = self.userFirstNameTextField.text!
        user?.lastname = self.userLastNameTextField.text!
        user?.pet.name = self.petNameTextField.text!
        user?.pet.picture = self.petPictureImageView.image
        user?.pet.description = self.petDescriptionTextField.text!
        user?.phoneNumber = self.phoneNumberTextField.text!
    }


}

