//
//  FeedVC.swift
//  lets-get-social
//
//  Created by Paul Defilippi on 10/11/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func signOutTapped(_ sender: AnyObject) {
        let keychainResult = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("PAUL: ID removed from keychain \(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
