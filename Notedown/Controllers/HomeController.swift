//
//  HomeController.swift
//  Notedown
//
//  Created by Muhammad Suleman on 4/30/23.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    let homeVM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUserProfile()
        // Do any additional setup after loading the view.
    }

    private func setupUserProfile() {
        let profileData = fetchUserFromDefaults()
        if let profile = profileData {
            nameLabel.text = profile.email
            emailLabel.text = profile.email
            emailLabel.text = "Hello test"
        } else {
            print("\nUser profile data not found!\n")
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        let logoutSuccess = homeVM.logoutUser()
        
        print("\nLogout Suuccess -> \(logoutSuccess)\n")
        if logoutSuccess {
            navigateTo(storyboard: "AuthView", identifier: "LoginView")
        } else {
            print("\nCouldn't logout, please try again....\n")
        }
    }
    
    
    //Navigator
    private func navigateTo(storyboard: String, identifier: String) {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let destVC = storyboard.instantiateViewController(withIdentifier: identifier)  as! AuthController
        self.navigationController?.pushViewController(destVC, animated: true)
    }
    
}
