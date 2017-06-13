//
//  AuthService.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-03-31.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit

typealias Completion = (_ errorMessage: String?, _ data: AnyObject?) -> Void

class AuthService: NSObject {
    var authDelegate: AuthenticateStatus?
    
    private static let _instance = AuthService()
    
    let app = UIApplication.shared.delegate as! AppDelegate
    
    static var instance: AuthService {
        return _instance
    }
    
    func login(email: String, password: String, onComplete: Completion?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    // if user not found error
                    if errCode == .userNotFound {
                        
                        // create user if it doesn't exist
                        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                            if error != nil {
                                self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                            }
                            else {
                                if user?.uid != nil {
                                    
                                    // save user uid to database
                                    if UserDefaults.standard.string(forKey: "Account") == "Seeker" {
                                        DataService.instance.createUser(uid: user!.uid, email: user!.email!, preferences: .seeker)
                                    }
                                    if UserDefaults.standard.string(forKey: "Account") == "Trainer" {
                                        DataService.instance.createUser(uid: user!.uid, email: user!.email!, preferences: .trainer)
                                    }
                                    
                                    Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                                        if error != nil {
                                            print(error!.localizedDescription)
                                        }
                                        else {
                                            /*
                                             // email verification
                                             if user?.isEmailVerified == false {
                                             print("not verified")
                                             Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                                             if error != nil {
                                             print(error?.localizedDescription)
                                             }
                                             else {
                                             // do something now that it is sent
                                             }
                                             })
                                             
                                             }
                                             else {
                                             
                                             }
                                             */
                                            self.authDelegate?.login()
                                            print("signed in created user")
                                        }
                                    })
                                    
                                }
                                else {
                                    self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                                }
                            }
                        })
                    }
                    else {
                        // handle other errors
                        self.handleFirebaseError(error: error! as NSError, onComplete: onComplete)
                    }
                }
            }
            else {
                /*
                 if user?.isEmailVerified == false {
                 print("not verified")
                 Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                 if error != nil {
                 print(error?.localizedDescription)
                 }
                 else {
                 // do something now that it is sent
                 }
                 })
                 }
                 else if (user?.displayName != nil) {
                 let signedInUser = User(uid: (user?.uid)!, email: (user?.email!)!, name: nil)
                 print(signedInUser.uid, signedInUser.email, user?.displayName!)
                 }
                 
                 else {
                 let signedInUser = User(uid: (user?.uid)!, email: (user?.email!)!, name: nil)
                 print(signedInUser.uid, signedInUser.email, "")
                 }
                 */
                
                self.authDelegate?.login()
                print("signed in")
                onComplete?(nil, user)
            }
        })
    }
    
    func handleFirebaseError(error: Error, onComplete: Completion?) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            switch errorCode {
            case .invalidEmail:
                onComplete?("Invalid email address", nil)
                break
            case .wrongPassword:
                onComplete?("Invalid password", nil)
                break
            case .emailAlreadyInUse, .accountExistsWithDifferentCredential:
                onComplete?("Could not create account. Email already in use", nil)
                break
            default:
                onComplete?("There was a problem authenticating. Try again.", nil)
            }
        }
    }
    
    func checkSignedIn() -> Bool {
        if let user = Auth.auth().currentUser {
            print(user.email!)
            return true
        }
        else {
            print("no one signed in")
            return false
        }
    }
    
    /*
    func getSignedInUser() -> Person {
        if let user = Auth.auth().currentUser {
            if user.displayName != nil {
                let signedInUser = Person(id: user.uid, email: user.email!, name: nil)
                print(signedInUser.id, signedInUser.email, user.displayName!)
                return signedInUser
            }
            else {
                let signedInUser = Person(id: user.uid, email: user.email!, name: nil)
                print(signedInUser.uid, signedInUser.email, "")
                return signedInUser
            }
        }
        else {
            let noUserSignedIn = Person(id: "", email: "", name: nil)
            return noUserSignedIn
        }
    }
    */
    
    // sign out
    func performSignOut() {
        try! Auth.auth().signOut()
    }
    
    // password reset
    func passwordReset(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                self.handleFirebaseError(error: error, onComplete: nil)
            } else {
                // no error
            }
        }
    }
    
    // save display name
    func saveDisplay(name: String) {
        if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest() {
            changeRequest.displayName = name
            changeRequest.commitChanges(completion: { (error) in
                print(error?.localizedDescription)
            })
        }
    }
}

