//
//  HomeVM.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import Foundation
import FirebaseAuth

class HomeVM {
    
    //MARK: Logout User
    func logoutUser() -> Bool {
        var logoutSuccess = false
            let firebaseAuth = Auth.auth()
            do {
                try firebaseAuth.signOut()
                removeUserFromDefaults()
                logoutSuccess = true
            } catch let signOutError as NSError {
                print("\nLogout Error -> \n\(signOutError.debugDescription)")
                logoutSuccess = false
            }
        
        return logoutSuccess
    }
}
