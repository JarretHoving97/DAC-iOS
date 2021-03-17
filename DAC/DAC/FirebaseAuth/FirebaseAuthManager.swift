//
//  FirebaseAuthManager.swift
//  DAC
//
//  Created by Jarret hoving on 15/03/2021.
//

import Foundation
import FirebaseAuth
import SwiftUI

class FirebaseAuthManager {
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let errorCode = AuthErrorCode(rawValue: error._code) {
                print("error: \(errorCode)")
                completionBlock(false)
            } else {
                print("Success logging in!")
                completionBlock(true)
            }
        }
    }
    
    
//    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
//            var message: String = ""
//            if let user = authResult?.user {
//                print(user)
//                message = "Logged in succesfully!"
//                completionBlock(true)
//            } else {
//                message = "Unvalid information"
//                completionBlock(false)
//            }
//        }
//    }
    
//    func didTapSignUpButton(email: String, password: String) {
//        let signUpManager = FirebaseAuthManager()
//            signUpManager.createUser(email: email, password: password) {[weak self] (success) in
//                guard let `self` = self else { return }
//                var message: String = ""
//                if (success) {
//                    message = "User was sucessfully created."
//                } else {
//                    message = "There was an error."
//                }
//                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
//                display(alertController: alertController)
//            }
//        }
}
