//
//  HelperMethods.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import Foundation

//MARK: - Save-To-Userdefaults
func saveUserToDefaults(_ userData: UserModel) {
    if let encoded = try? JSONEncoder().encode(userData) {
        UserDefaults.standard.set(encoded, forKey: "currentUser")
    } else {
        print("\nCouldn't decode and save user object to UserDefaults\n")
    }
}

func fetchUserFromDefaults() -> UserModel? {
    var userProfile: UserModel?
    if let data = UserDefaults.standard.object(forKey: "currentUser") as? Data,
       let user = try? JSONDecoder().decode(UserModel.self, from: data) {
        print("\nSaved user profile -> \n\(user)\n")
        userProfile = user
    } else {
        print("\nUser rofile doesn't exist\n")
    }
    return userProfile
}

func removeUserFromDefaults() {
    
    UserDefaults.standard.removeObject(forKey: "currentUser")
    
}
