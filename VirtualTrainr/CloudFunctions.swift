//
//  CloudFunctions.swift
//  VirtualTrainr
//
//  Created by Anthony Ma on 26/5/2017.
//  Copyright © 2017 Apptist. All rights reserved.
//

import Foundation
import FirebaseDatabase


class CloudFunctions: DataBase {
    
    // phone notification
    //    var phoneDelegate: PhoneDelegate?
    
    private static let _instance = CloudFunctions()
    
    // public instance
    
    static var instance: CloudFunctions {
        return _instance
    }
    
    // functions list
    enum Function: String {
        case tokboxCall = "https://us-central1-virtualtrainr-24620.cloudfunctions.net/tokboxCall"
        case sendPushMessage = "https://us-central1-virtualtrainr-24620.cloudfunctions.net/sendPushMessage"
    }
    
    func tokboxCall(function: Function, trainer: Trainer, user: User) {
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let urlString = function.rawValue
        let url = URL(string: urlString)!
        
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "GET"
        
        // Make the request
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error == nil {
                // Get the HTTP status code of the request.
                let statusCode = (response as! HTTPURLResponse).statusCode
                print(statusCode)
                
                if statusCode == 200 {
                    // Convert the received JSON data into a dictionary.
                    do {
                        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        print(dataDictionary ?? "")
                        
                        //                        DataService.instance.createUser(trainer: trainer, user: user, dictionary: dataDictionary!)
                        /*
                         DispatchQueue.main.async(execute: { () -> Void in
                         
                         })
                         */
                    }
                    catch {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            else {
                print(error?.localizedDescription ?? "")
            }
        }
        task.resume()
    }
    
    func sendNewMessage(function: Function) {
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let urlString = function.rawValue
        let url = URL(string: urlString)!
        
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "GET"
        do {
            let parameters = ["name": "c1uuTr4gOc4:APA91bFhELY19zJaILAHi5jPCwY1oY1wqCW2RBtq2ml303W_AUdritAvtGxbZaKm6deAD9jWrRy7FIIf6wXZsi-s12vgoWFSZAPJJvZH62t-va3WDzHigQEimox5yCdbdSpEXc3mA8K7", "note":"message"]
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        
        // Make the request
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error == nil {
                // Get the HTTP status code of the request.
                let statusCode = (response as! HTTPURLResponse).statusCode
                print(statusCode)
                
                if statusCode == 200 {
                    // Convert the received JSON data into a dictionary.
                    do {
                        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        print(dataDictionary ?? "")
                        
                        //                        DataService.instance.createCall(trainer: trainer, user: user, dictionary: dataDictionary!)
                        /*
                         DispatchQueue.main.async(execute: { () -> Void in
                         
                         })
                         */
                    }
                    catch {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            else {
                print(error?.localizedDescription ?? "")
            }
        }
        task.resume()
        
    }
    
    func postMessage() {
        
        let apn = "c1uuTr4gOc4:APA91bFhELY19zJaILAHi5jPCwY1oY1wqCW2RBtq2ml303W_AUdritAvtGxbZaKm6deAD9jWrRy7FIIf6wXZsi-s12vgoWFSZAPJJvZH62t-va3WDzHigQEimox5yCdbdSpEXc3mA8K7"
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let urlString = "https://fcm.googleapis.com/fcm/send"
        
        let url = URL(string: urlString)!
        
        let request = NSMutableURLRequest(url: url)
        
        request.httpMethod = "POST"
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("AAAAtUr2alE:APA91bFTNv43Z0Ndm1TJYAL_xSqqg312ep1i0qZmXgEQbVaxljNubuR4RRuIJ11p9j0F1xKI0_s7GmNjw1Kpgh6hFjFCP25nTy8SsGTAX5S1Z4P7dWqnH62b2Ktp99ndYNuHn9vBp_5j", forHTTPHeaderField: "Authorization")
        
        let parameters = ["to": apn, "message": "Hi"]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            
        } catch let error {
            print(error.localizedDescription)
        }
        
        
        // Make the request
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest) { (data, response, error) -> Void in
            if error == nil {
                // Get the HTTP status code of the request.
                let statusCode = (response as! HTTPURLResponse).statusCode
                print(statusCode)
                
                if statusCode == 200 {
                    // Convert the received JSON data into a dictionary.
                    do {
                        let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String:Any]
                        print(dataDictionary ?? "")
                        
                        //                        DataService.instance.createCall(trainer: trainer, user: user, dictionary: dataDictionary!)
                        /*
                         DispatchQueue.main.async(execute: { () -> Void in
                         
                         })
                         */
                    }
                    catch {
                        print("Could not convert JSON data into a dictionary.")
                    }
                }
            }
            else {
                print(error?.localizedDescription ?? "")
            }
        }
        task.resume()
    }
}

