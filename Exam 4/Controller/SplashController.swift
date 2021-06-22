//
//  ViewController.swift
//  Exam 4
//
//  Created by XchoBeglaryan on 25.05.21.
//

import UIKit

class SplashController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var logoImageSplash: UIImageView!
    var labelName = "Created by Xcho Beglaryan"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.perform(#selector(goToLogin), with: nil, afterDelay: 3)
        animation()
    }


    @objc func goToLogin() {
        let login: Void = performSegue(withIdentifier: "LoginController", sender: nil)
        
        return login
    }
    

    func animation() {
            var index = 0.0
            
            for char in labelName {
                
                Timer.scheduledTimer(withTimeInterval: 0.05 * index, repeats: false) { timer in
                    
                    self.labelText.text?.append(char)
                }
                index += 1
            }
        }

}

