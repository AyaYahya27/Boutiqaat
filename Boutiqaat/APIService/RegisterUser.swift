//
//  RegisterUser.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 30/10/2021.
//

import Foundation
import Alamofire


struct RegisterUser {
    
   
   
    static func register (withCredentials credentials : Dictionary<String, Any> , withHeaders: HTTPHeaders, url: String ,  completion: @escaping(_ msg :String, _ error : Bool) -> Void) {
        
        DispatchQueue.main.async {
                   
                   let headers : HTTPHeaders = withHeaders
                   let params : Parameters =  credentials
                 
                   let request =  AF.request(url , method: .post, parameters: params, encoding: JSONEncoding.default, headers: headers )

                   request.responseJSON{ response  in

                       switch response.result{
                       case .success(let value ):
                    let JSON = value as! NSDictionary
                    if  response.response?.statusCode == 200    {
                        let status = JSON["login_status"]
                            
                        if status as! String == "error"{
                            completion(JSON["message"] as! String , true)
                        }else{
                            completion ("success" , false)
                        }
                    }else{
                        completion(JSON["message"] as! String , true)
                    }
                    
                case .failure(let error):
                   print(error)
                    completion(error.localizedDescription, true)
                }
           }
            
            
       }
       
    }
    
    
}

