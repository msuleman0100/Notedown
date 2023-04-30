//
//  AuthController.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import UIKit

class AuthController: UIViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func signInActoin(_ sender: Any) {
        moveTo(storyboard: "AuthView", identifier: "SignupView", viewController: self)
    }
    
    @IBAction func registerAction(_ sender: Any) {
    }
    
}
