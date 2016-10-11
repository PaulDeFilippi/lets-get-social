//
//  SignInVC.swift
//  lets-get-social
//
//  Created by Paul Defilippi on 10/5/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func facebookBtnPressed(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("PAUL: Unable to authenticate with Facebook - \(error)")
                
            } else if result?.isCancelled == true {
                print("PAUL: User cancelled Facebook authentication")
            } else {
                print("PAUL: Successfully authenticated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
            }
            
        }
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("PAUL: Unable to authenticate with Firebase - \(error)")
            } else {
                print("PAUL: Successfully authenticated with Firebase")
            }
        })
    }
}

