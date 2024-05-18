//
//  SignupViewController.swift
//  chatWithMe
//
//  Created by Rishav chandra on 24/02/24.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func signupPressed(_ sender: UIButton) {
        if let email = emailTextField.text , let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult , error in
                if let e = error {
                    print(e)
                }else {
                    self.performSegue(withIdentifier: "GoToMsg", sender: self)
                }
            }
        }
    }
}


    
