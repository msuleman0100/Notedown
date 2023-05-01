//
//  AuthVM.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

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
                    //guard let uID = authResult?.user.uid else { return }
                    let currentUser = UserModel(name: name, email: email)
                    //self.saveUserToFirebaseStorag(uID: uID, name: name)
                    saveUserToDefaults(currentUser)
                    registerSuccess = true
                    
                } else { registerSuccess = false }
            } else {
                print("\nRegister Error -> \n\(error.debugDescription)")
            }
        }
        return registerSuccess
    }
    
    func saveUserToFirebaseStorag(uID: String, name: String) {
        var dbRef = Database.database().reference()
        let params: [String: Any] = [
            "name": name
            ]
        dbRef.child("Users").child("\(uID)").updateChildValues(params)
    }
    
    
    //MARK: - Forgot Password
    func resetPassword(email: String) {
        
    }
    

}
