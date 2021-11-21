//
//  LoginViewModel.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation
//
//  LoginViewModel.swift
//  LoginBoutiqaat
//
//  Created by Ghazal Adnan on 30/10/2021.
//

import UIKit
import Alamofire
import SystemConfiguration
import KeychainSwift

class LoginViewModel{
    
    //MARK: -Attributes
    var username: String = ""
    var password: String = ""
    var tokenBody = TokenBody(username: "", password: "")
    var loginBody = LoginBody(email: "", password: "")
    
    init(username: String, password: String){
        self.username = username
        self.password = password
        
    }
    
    //MARK: - Encoding parameters of Token request
    func encodeTokenBody(completion : @escaping(Bool) ->Void){
        
        tokenBody.username = self.username
        tokenBody.password = self.password
       
        do
        {
            let jsonData = try JSONEncoder().encode(tokenBody)
            
            if let dictData = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? Dictionary<String, Any>{
                
                tokenBody.generateToken(with: "https://beta.boutiqaat.com/rest/V1/session/customer/token", params: dictData) { response, loginStatus in
                    if loginStatus{
//                        
                        self.handleLogin(token: response)
                        completion(loginStatus)
                        //MARK: -Set the email value in user defaults
//                        UserDefaults.standard.set(self.username, forKey: "email")
//                        UserDefaults.standard.set(response, forKey: "token")
//                        UserDefaults.standard.synchronize()
////
//                        let keychain = KeychainSwift()
//                        keychain.set(self.password, forKey: "password")
//                        print(keychain.get("password"))
//                        print(UserDefaults.standard.string(forKey: "email"))
//                        print(UserDefaults.standard.string(forKey: "token"))
                        //MARK: -Delete the email value from user defauts
                        UserDefaults.standard.removeObject(forKey: "email")
                                UserDefaults.standard.synchronize()
                    } else{
                        print(response)
                        completion(loginStatus)
                    }
                }
            }
        }
        catch{
            print("error")
            completion(false)
        }
        
    }
    
    //MARK: - Encoding parameters of Login request
    func handleLogin(token: String){
        loginBody.email = self.username
        loginBody.password = self.password
        let headers: HTTPHeaders = ["Authorization": "Bearer \(token)"]
        
        do
        {
            let jsonData = try JSONEncoder().encode(loginBody)

            if let dictData = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? Dictionary<String, Any>{
                LoginBody.performLogin(with: "https://beta.boutiqaat.com/rest/V1/customer/login", params: dictData, headers: headers)
            }
        }
        catch{
            print("error")
        }
    }
}


