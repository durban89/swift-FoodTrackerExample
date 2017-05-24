//
//  ViewController.swift
//  FoodTrackerExample
//
//  Created by durban.zhang on 2017/5/18.
//  Copyright © 2017年 durban.zhang. All rights reserved.
//

import UIKit
import os.log

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    // MARK: properties
//    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControlView: RatingControlView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    /*
     This value is either passed by `MealTableViewController` in `prepare(for:sender:)`
     or constructed as part of adding a new meal.
     */
    var meal:MealModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mealNameTextField.delegate = self;
        
        if let meal = meal {
            navigationItem.title = meal.name
            mealNameTextField.text = meal.name
            photoImageView.image = meal.photo
            ratingControlView.rating = meal.rating
        }
        
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following \(info)")
        }
        
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log:OSLog.default, type: .debug)
            return
        }
        
        let name = mealNameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControlView.rating
        
        meal = MealModel(name: name, photo: photo, rating: rating)
        
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode{
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {

        // Hide the keyword
        mealNameTextField.resignFirstResponder()
        
        // UIImagePickerController is a view controller that let a user pick media from their photo library.
        let imagePickerController = UIImagePickerController()
        
        // Only allow photos to be picked, not taken
        imagePickerController.sourceType = .photoLibrary
        
        // Make sure Viewcontroller is notified when the user picks an image
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        mealNameLabel.text = "Default Text";
//    }
    
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyword
        textField.resignFirstResponder();
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
//        mealNameLabel.text = textField.text;
        os_log("DidEndEditing")
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.becomeFirstResponder()
        // Disable the save button while editing
        saveButton.isEnabled = false
    }
    
    // MARK: Private Methods
    private func updateSaveButtonState(){
        // Disable the Save Button if the text field is empty.
        let text = mealNameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}

