//
//  WebViewController.swift
//  VirtualTrainr
//
//  Created by Mark Meritt on 2017-04-04.
//  Copyright © 2017 Apptist. All rights reserved.
//

import UIKit

let accessToken = "AQUbJGXl6TXRFzE5KB39QgVakuXyBblHLJH5D4x2R_fhx-fPxB0cCDZqEbK0DNXo2Iu4IMAXhUxalWWqInOvIJDpB7Q7Wn8-AYDWehbL9upiuKhJbcKpvpF-MuUaqHshc-yh7dGuVTxz0J4vyGB_-5At_LfHnBa17OL0EawI8MQCl05RWIc"

class WebViewController: UIViewController, UIWebViewDelegate {
    
    let linkedInKey = "78p65nkwyoebwy"
    
    let linkedInSecret = "PAO5wMvHHmGeUbF1"
    
    let authroizationEndPoint = "https://www.linkedin.com/uas/oauth2/authorization"
    
    let accessTokenEndPoint = "https://www.linkedin.com/uas/oauth2/accessToken"
    
    var webView = UIWebView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UserDefaults.standard.removeObject(forKey: "LIAccessToken")

        
        webView.delegate = self
        
        self.view.addSubview(webView)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        webView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        webView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        webView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        
        startAuthorization()
        
        
    }
    
    func startAuthorization() {
        
        let responseType = "code"
        
        let redirectURL = "https://com.appcoda.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        let state = "linkedin\(Int(Date().timeIntervalSince1970))"
        
        let scope = "r_basicprofile"
        
        var authorizationURL = "\(authroizationEndPoint)?"
        authorizationURL += "response_type=\(responseType)&"
        authorizationURL += "client_id=\(linkedInKey)&"
        authorizationURL += "redirect_uri=\(redirectURL)&"
        authorizationURL += "state=\(state)&"
        authorizationURL += "scope=\(scope)"
        
        print(authorizationURL)
        
        let request = URLRequest(url: URL(string: authorizationURL)!)
        webView.loadRequest(request)
        
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let url = request.url!
        print(url)
        
        if url.host == "com.appcoda.linkedin.oauth" {
            if url.absoluteString.range(of: "code") != nil {
                
                let urlParts = url.absoluteString.components(separatedBy: "?")
                let code = urlParts[1].components(separatedBy: "=")[1]
                
                requestForAccessToken(code)
            }
        }
        
        return true
        
    }
    
    func requestForAccessToken(_ authorizationCode: String) {
        
        let grantType = "authorization_code"
        
        let redirectURL = "https://com.appcoda.linkedin.oauth/oauth".addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
        
        var postParams = "grant_type=\(grantType)&"
        postParams += "code=\(authorizationCode)&"
        postParams += "redirect_uri=\(redirectURL)&"
        postParams += "client_id=\(linkedInKey)&"
        postParams += "client_secret=\(linkedInSecret)"
        
        let postData = postParams.data(using: .utf8)
        
        var request = URLRequest(url: URL(string: accessTokenEndPoint)!)
        
        request.httpMethod = "POST"
        
        request.httpBody = postData
        
        request.addValue("application/x-www-form-urlencoded;", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession(configuration: .default)
        
        let task: URLSessionDataTask = session.dataTask(with: request) { (data, response, error) -> Void in
            
            let statusCode = (response as! HTTPURLResponse).statusCode
        
            if statusCode == 200 {
                do {
                    let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! NSDictionary
                    
                    print(dataDictionary)
                    
                    let accessToken = dataDictionary["access_token"] as! String
                    
                    UserDefaults.standard.set(accessToken, forKey: "LIAccessToken")
                    UserDefaults.standard.synchronize()
                    UserDefaults.standard.set(true, forKey: "userLoggedIn")
                    UserDefaults.standard.set(true, forKey: "linkedInCheck")

                    DispatchQueue.main.async(execute: { () -> Void in
                        self.present(MyDashboard(), animated: true, completion: nil)
                    })
                }
                catch {
                    print("Could not convert JSON data into a dictionary.")
                }
            }
        }
        task.resume()
    }
    
    // GET method to get image and name from access token in REST API
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
