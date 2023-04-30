//
//  AuthVM.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import Foundation
import FirebaseAuth
import FirebaseStorage

class AuthVM {
    
    //MARK: - Properties
    
    //MARK: - Login
    func loginUser(email: String, password: String) -> Bool {
        var loginSuccess = false
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                if authResult != nil  {
                    guard let name = authResult?.user.displayName else { return }
                    guard let email = authResult?.user.email else { return }
                    let currentUser = UserModel(name: name, email: email)
                    saveUserToDefaults(currentUser)
                    loginSuccess = true
                    
                } else { loginSuccess = false }
            } else {
                print("\nLogin Error -> \n\(error.debugDescription)")
            }
        }
        
        return loginSuccess
    }
    
    //MARK: - Register
    func registerUser(email: String, password: String) -> Bool {
        var registerSuccess = false
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                if authResult != nil  {
                    guard let name = authResult?.user.displayName else { return }
                    guard let email = authResult?.user.email else { return }
                    let currentUser = UserModel(name: name, email: email)
                    saveUserToDefaults(currentUser)
                    registerSuccess = true
                    
                } else { registerSuccess = false }
            } else {
                print("\nRegister Error -> \n\(error.debugDescription)")
            }
        }
        return registerSuccess
    }
    
    
    //MARK: - Forgot Password
    func resetPassword(email: String) {
        
    }
    
    //MARK: Loggout and remove user profile
    func saveUser(name: String) {
        
    }
}
