//
//  LoginController.swift
//  Exam 4
//
//  Created by XchoBeglaryan on 25.05.21.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    private var tapGesture: UITapGestureRecognizer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuration()
        }
        
    func configuration() {
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGesture(_:)))
        self.view.addGestureRecognizer(tapGesture!)
        email.delegate = self
        password.delegate = self
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
   

    @IBAction func loginFunc(_ sender: UIButton) {
        if validate() {
            gotohome()
        }
    }
    
    func gotohome() {
        let home = self.storyboard?.instantiateViewController(identifier: "HomeController") as! HomeController
        self.present(home, animated: true, completion: nil)
    }
    @discardableResult
    
    func validate() -> Bool {
        var result = false
        if email.emailValidation {
            
            email.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            result = true
            }
        if password.passwordValidation {
            password.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            result = true
        }
        return result
    }
    
    
    
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        
        email.resignFirstResponder()
        password.resignFirstResponder()
        self.view.becomeFirstResponder()
    }
}

extension LoginController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == email {
            email.resignFirstResponder()
            password.becomeFirstResponder()
        } else {
            email.resignFirstResponder()
            password.resignFirstResponder()
        }
        return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validate()
        
    }
}
