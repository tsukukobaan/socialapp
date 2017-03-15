//
//  SignInVC.swift
//  socialapp
//
//  Created by 小林 泰 on 2017/03/15.
//  Copyright © 2017年 TokyoIceHockeyChannel. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {
    @IBOutlet weak var emailField: FieldDesign!
    @IBOutlet weak var passwordField: FieldDesign!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func facebookBtnPressed(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JESS: Unable to authenticate with Facebook - \(error)")
            } else if result?.isCancelled == true {
                print("JESS: User cancelled Facebook authentication")
                
            } else {
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
    }
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: {(user,error) in
            
            if error != nil {
                print("JESS: Unable to authenticate with firebase - \(error)")
            } else {
                print("JESS: Successfully authenticated with Firebase")
            }
        
        
        })
    }
    @IBAction func signInBtnPressed(_ sender: Any) {
        if let email = emailField.text, let pwd = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: pwd, completion: {(user,error) in
                
                if error == nil {
                    print("JESS: Email user authenticated with Firebase")
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: pwd, completion: {(user,error) in
                        
                        if error != nil {
                            print("JESS: Unable to authenticate with firebase  using email - \(error)")
                        } else {
                            print("JESS: Successfully authenticated with firebase")
                        }
                    
                    })
                    
                }
            
            })
        }
    }
}

















