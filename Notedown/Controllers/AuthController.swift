//
//  AuthController.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import UIKit

class AuthController: UIViewController {
    
    //login proprties...
    @IBOutlet weak var loginemailField: UITextField!
    @IBOutlet weak var loginPasswordField: UITextField!
    
    //register properties...
    @IBOutlet weak var regNameField: UITextField!
    @IBOutlet weak var regPasswordField: UITextField!
    @IBOutlet weak var regEmailField: UITextField!
    
    //AuthVM reference
    let authVM = AuthVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func signInActoin(_ sender: Any) {
        //moveTo(storyboard: "AuthView", identifier: "SignupView", viewController: self)
        DispatchQueue.main.async { [weak self] in
            if self?.loginemailField.text != nil && self?.loginPasswordField.text != nil {
                let email = self?.loginemailField.text ?? ""
                let password = self?.loginPasswordField.text ?? ""
                let loginSuccess = self?.authVM.loginUser(email: email, password: password)
                if loginSuccess ?? false {
                    self?.navigateTo(storyboard: "HomeView", identifier: "HomeView")
                } else {  print("\nCouldn't login...\n") }
            
            } else { print("\nPlease enter email address & password to continue...\n") }
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        
        DispatchQueue.main.async { [weak self] in
            let name = self?.regNameField.text ?? ""
            let email = self?.regEmailField.text ?? ""
            let password = self?.regPasswordField.text ?? ""
            if !name.isEmpty && !email.isEmpty && !password.isEmpty {
                let loginSuccess = self?.authVM.registerUser(email: email, password: password)
                if loginSuccess ?? false {
                    self?.navigateTo(storyboard: "HomeView", identifier: "HomeView")
                    
                } else { print("\nCouldn't register...\n") }
                
            } else { print("\nPlease enter email address & password to continue...\n") }
        }
     
    }
    
 
    //Navigator
    private func navigateTo(storyboard: String, identifier: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: identifier)  as! HomeController
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
}
