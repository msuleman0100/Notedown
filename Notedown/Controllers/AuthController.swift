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
        
//        loginemailField.text = "sa6@sa.com"
//        loginPasswordField.text = "112233"
    }
   
    
    @IBAction func signInActoin(_ sender: Any) {
        let email = loginemailField.text ?? ""
        let password = loginPasswordField.text ?? ""
        
        let waitingView = WaitingView()
        if email != "" && password != "" {
            waitingView.show(sender: self)
            authVM.loginUser(email: email, password: password) { loginSuccess,error   in
                if loginSuccess {
                    print("\ntest done")
                    waitingView.hide()
                    self.navigateTo(storyboard: "HomeView", identifier: "HomeView")
                } else {
                    waitingView.hide()
                    let alertView = PopupView()
                    alertView.alertTitle = "Signin Failed!"
                    alertView.alertDesc = "Couldn't signin reason '\(error ?? "Unknown")'"
                    alertView.appear(sender: self)
                }
            }
        } else {
            waitingView.hide()
            let alertView = PopupView()
            alertView.alertTitle = "Signin Failed!"
            alertView.appear(sender: self)
        }
    }
    
    @IBAction func registerAction(_ sender: Any) {
        

        let name = regNameField.text ?? ""
            let email = regEmailField.text ?? ""
            let password = regPasswordField.text ?? ""
        
            let waitingView = WaitingView()
            if name != "" && email != "" && password != "" {
                waitingView.show(sender: self)
                authVM.registerUser(email: email, password: password,
                                    name: name, completion: { loginSuccess, error in
                    if loginSuccess {
                        print("\nReggisstered suuccess......")
                        waitingView.hide()
                        self.navigateTo(storyboard: "HomeView", identifier: "HomeView")
                    } else {
                        waitingView.hide()
                        let alertView = PopupView()
                        alertView.alertTitle = "Signin Failed!"
                        alertView.alertDesc = "Couldn't registered reason '\(error ?? "Unknown")'"
                        alertView.appear(sender: self)
                    }
                })
            } else {
                waitingView.hide()
                let alertView = PopupView()
                alertView.alertTitle = "Register Failed!"
            }
     
     
    }
    
 
    //Navigator
    private func navigateTo(storyboard: String, identifier: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: identifier)  as! HomeController
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
}
