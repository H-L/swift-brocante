//
//  LoginViewController.swift
//  Brocante
//
//  Created by Hadrien Lepoutre on 22/05/2017.
//  Copyright © 2017 Hadrien Lepoutre. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailField.keyboardType = UIKeyboardType.emailAddress
        self.emailField.autocorrectionType = UITextAutocorrectionType.no
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // If user already logged, just go to the next view
        if let _ = FIRAuth.auth()?.currentUser {
            self.showAlert(title: "Signed In", message: "You're already signed in")
            self.signingIn()
        }
    }
    
    // User Authentification
    @IBAction func signIn(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            guard let _ = user else {
                if let error = error {
                    if let errCode = FIRAuthErrorCode(rawValue: error._code) {
                        switch errCode {
                        case .errorCodeUserNotFound :
                            self.showAlert(title: "User not found", message: "Damn boy ! You do not exist !")
                        case .errorCodeWrongPassword :
                            self.showAlert( title: "Wrong Username or Password", message: "Blblblblbl")
                        default :
                            self.showAlert( title: "Error", message: "\(error.localizedDescription)")
                        }
                    }
                }
                assertionFailure("user and error are nil")
                return
            }
            
            self.signingIn()
        })
    }
    
    // Create a basic user account
    @IBAction func signUp(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: emailField.text!, password: passwordField.text!, completion: { (user, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else { 
                print("User created...")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Once signed in, go to the next view
    func signingIn() {
        performSegue(withIdentifier: "FromLoginToTabBar", sender: nil)
    }
    
    // Snippets for alerts handling
    func showAlert( title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
    }
}
