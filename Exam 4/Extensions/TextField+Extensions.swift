//
//  TextField+Extensions.swift
//  Exam 4
//
//  Created by XchoBeglaryan on 25.05.21.
//

import UIKit

extension UITextField {
    
    var emailValidation: Bool {
        if !(self.text?.contains("@"))! || self.text!.count < 6 {
            self.layer.borderWidth = 2
            self.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
            return false
        }
        return true
    }
    
    var passwordValidation: Bool {
        if self.text!.count < 6 {
            
            self.layer.borderWidth = 2
            self.layer.borderColor = CGColor(red: 255, green: 0, blue: 0, alpha: 1)
            return false
        }
        return true
    }
}
