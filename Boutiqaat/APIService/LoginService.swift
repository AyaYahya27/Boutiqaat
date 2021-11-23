//
//  LoginService.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation


import UIKit
import Alamofire

struct TokenBody: Codable{
    
    var username: String
    var password: String
    //MARK: -Request Token from API
    func generateToken(with url: String, params: Parameters, completion : @escaping(String, Bool) ->Void)  {
        
        var errorMSG: String = ""
        
        DispatchQueue.main.async {
            AF.request(url, method: .post, parameters: params, encoding: URLEncoding.queryString)
                .responseJSON { response in
                    switch (response.response?.statusCode) {
                                          
                    case 200:
                        do{
                            if let generatedToken = try JSONDecoder().decode(TokenData.self, from: response.data!).token{
                                                            completion(generatedToken, true)
                            }
                        } catch let error as NSError {
                            print("Failed to load: \(error)")
                            errorMSG = ("Failed to load: \(error)")
                            completion(errorMSG,false)
                        }
                            
                    case 401:
                        do{
                            if let errormessage = try JSONDecoder().decode(TokenData.self, from: response.data!).message{
                                completion(errormessage, false)}
                        } catch let error as NSError {
                            print("Failed to load: \(error)")
                            errorMSG = ("Failed to load: \(error)")
                            completion(errorMSG,false)
                        }
                        
                    case .none:
                        completion(errorMSG, false)
                    case .some(_):
                        completion(errorMSG, false)
                    }
                }
        }
    }
}

struct LoginBody: Codable{
//    let device_token: String = "ttt"
//    let device_type = "A"
    var email: String
//    let lang = "en"
    var password: String
    
    //MARK: -perform Login using API
    
    static func performLogin(with url: String, params: Parameters, headers: HTTPHeaders){
        DispatchQueue.main.async {
            AF.request(url, method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
                print(response)
            }
        }
    }
}


