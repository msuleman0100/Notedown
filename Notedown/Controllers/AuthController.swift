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
    
    let authVM = AuthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func signInActoin(_ sender: Any) {
        //moveTo(storyboard: "AuthView", identifier: "SignupView", viewController: self)
        if emailField.text != nil && passwordField.text != nil {
            let email = emailField.text ?? ""
            let password = passwordField.text ?? ""
            let loginSuccess = authVM.loginUser(email: email, password: password)
            if loginSuccess {
                saveUserToDefaults(.init(name: email, email: password))
                navigateTo(storyboard: "HomeView", identifier: "HomeView")
            } else {
                print("\nCouldn't login...\n")
            }
        
        } else {
            print("\nPlease enter email address & password to continue...\n")
        }
    }
    
    @IBAction func registerAction(_ sender: Any) { }
    
 
    //Navigator
    private func navigateTo(storyboard: String, identifier: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: identifier)  as! HomeController
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
}
