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
    func loginUser(email: String, password: String,
                   completion: @escaping (Bool, String?) -> Void) {
        print("\nEntered to loginUser func...")
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            print("\nEntered to sinIn func...")
            if error == nil {
                if let uID = authResult?.user.uid {
                    self.fetchUserFromFirebase(uID: uID) { userName in
                        print("\nEntered to fetchUserFromFirebase...")
                        let currentUser = UserModel(name: userName, email: email)
                        saveUserToDefaults(currentUser)
                        completion(true, nil)
                    }
                }
            } else {
                completion(false, error?.localizedDescription ?? "")
                print("\nLogin Error -> \n\(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    //MARK: - Register
    func registerUser(email: String, password: String, name: String, completion: @escaping (Bool, String?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                guard let uID = authResult?.user.uid else { return }
                let currentUser = UserModel(name: name, email: email)
                self.saveUserToFirebaseStorag(uID: uID, name: name)
                saveUserToDefaults(currentUser)
                completion(true, nil)
            } else {
                completion(false, error?.localizedDescription)
            }
        }
    }
    
    func saveUserToFirebaseStorag(uID: String, name: String) {
        let dbRef = Database.database().reference()
        let params: [String: Any] = [ "name": name ]
        dbRef.child("Users").child("\(uID)").updateChildValues(params)
    }
    
    func fetchUserFromFirebase(uID: String, completion: @escaping (String) -> Void) {
        let dbRef = Database.database().reference()
        let user = dbRef.child("Users").child("\(uID)")
        user.observe(.value) { dataSnapshot in
            let name = dataSnapshot.childSnapshot(forPath: "name").value as? String ?? "Unknown"
            print("\nName -> \(name)")
            completion(name)
        }
    }
    
    //MARK: - Forgot Password
    func resetPassword(email: String) {
        
    }
    

}
