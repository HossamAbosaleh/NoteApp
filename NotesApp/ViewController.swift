//
//  ViewController.swift
//  NotesApp
//
//  Created by Abu Salleeiihh on 12/25/19.
//  Copyright © 2019 Abu Salleeiihh. All rights reserved.
//

import UIKit



class ViewController: UIViewController , UITextFieldDelegate {
    @IBOutlet var detailsTextView : UITextView!
    @IBOutlet var titleLable : UITextField!
    @IBOutlet var saveButton : UIButton!
    @IBOutlet var clearTextView : UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        detailsTextView.textViewDesign()
        titleLable.textFieldDiesgn()
        saveButton.buttonDiesgn()
        clearTextView.layer.cornerRadius = clearTextView.frame.height / 2
         
        titleLable.delegate = self
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    @IBAction func savemynote(_ sender: Any) {
    let newNotes = MyNote(context: context)
        newNotes.title = titleLable.text
        newNotes.details = detailsTextView.text
        newNotes.date_save = NSDate() as Date
        do {
             appDelegate.saveContext()
            let alerControl = UIAlertController(title: "Welcome", message: "Your note has been successfully saved", preferredStyle:.alert)
            let okAction = UIAlertAction(title: "Done", style: .cancel, handler: nil)
            alerControl.addAction(okAction)
            self.present(alerControl, animated: true)
        } catch  {
            print(error.localizedDescription)
        }
        titleLable.text = ""
        detailsTextView.text = ""
    }
    
    @IBAction func clearDefultWords(_ sender: Any) {
        detailsTextView.text = ""
        
    }
    

}




extension UITextView {
    func textViewDesign()  {
        self.layer.cornerRadius = 15.0
             self.layer.shadowColor = UIColor.blue.cgColor
             self.layer.shadowOffset = .zero
             self.layer.shadowOpacity = 3.7
             self.layer.shadowRadius = 20.0
             self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
             self.layer.shouldRasterize = true
         
    }
}
extension UITextField{
    func textFieldDiesgn() {
        self.layer.cornerRadius = 15
    }
}
extension UIButton{
    func buttonDiesgn() {
        self.layer.cornerRadius = 15
        
                    self.layer.shadowColor = UIColor.black.cgColor
                    self.layer.shadowOffset = .zero
                    self.layer.shadowOpacity = 0.7
                    self.layer.shadowRadius = 10.0
                    self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
                    self.layer.shouldRasterize = true
    }
}
