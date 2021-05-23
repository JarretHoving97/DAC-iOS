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
    
    var loginMessage: String = ""
    var registrationMessage: String = ""
    
   func signIn(email: String, pass: String, completionBlock: @escaping (_ success: Bool) -> Void){
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if let error = error, let errorCode = AuthErrorCode(rawValue: error._code) {
                
                switch  errorCode {
                case .wrongPassword:
                    self.loginMessage = "Wachtwoord is onjuist"
                case .unverifiedEmail:
                    self.loginMessage = "Uw account is nog niet geverifieerd"
                case .userNotFound:
                    self.loginMessage = "Gebruikersnaam niet gevonden"
                case .invalidEmail:
                    self.loginMessage = "Ongeldige gebruikersnaam"
                default:
                    self.loginMessage = "Inloggen is niet mogelijk"
                }
                completionBlock(false)
            } else {
                self.loginMessage = "U bent ingelogd"
                completionBlock(true)
            }
        }
    }
    
    func registration(email: String, password: String, passRepeat: String, completionBlock: @escaping (_ success: Bool) -> Void){
        if !passwordIsValid(firstPassField: password, secondPassField: passRepeat) {
            registrationMessage = "Wachtwoord voldoet niet aan de eisen";  return
        } else {
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error, let errorCode = AuthErrorCode(rawValue: error._code) {
                    completionBlock(true)
                
                    switch errorCode {
                    case .emailAlreadyInUse:
                        self.registrationMessage = "Email bestaat al"
                    default:
                        print(error)
                        self.registrationMessage = "Er is iets mis gegaan."
                    }
                    completionBlock(false)
                } else {
                    self.registrationMessage = "Account succesvol geregistreerd!"
                }
            }
        }
    }
    
    func passwordIsValid(firstPassField: String, secondPassField: String) -> Bool {
        if firstPassField != secondPassField {
            registrationMessage = "Wachtwoord velden zijn niet gelijk"
            return false
        } else {
            let passwordTest =  NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])[A-Za-z\\d$@$#!%*?&]{6,}")
            return passwordTest.evaluate(with: firstPassField)
        }
    }
}
