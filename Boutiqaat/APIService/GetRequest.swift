//
//  GetRequest.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire

class GetRequest{
    
    static func getRequestWithoutParameters(withHeaders: HTTPHeaders, url: URL ,  completion: @escaping( _ response : NSDictionary? ,_ errorMsg: String?, _  error : Bool) -> Void){
        
        DispatchQueue.main.async {
            
            let request =  AF.request(url , method: .get, encoding: JSONEncoding.default, headers: withHeaders )
            
            request.responseJSON{ response  in
                
                print("response \n" )
                print(response)
                
                switch response.result{
                case .success(let value ):
                    if  response.response?.statusCode == 200    {
                        let JSON = value as! NSDictionary
//                        print(JSON)
                        
                        completion(JSON, nil,  false)
                    }
                case .failure(let error):
                    completion(nil, error.localizedDescription,  true)
                }
                
            }

            
        }
        
    }
}

//
//
//switch response.result{
//case .success(let value ):
//let JSON = value as! NSDictionary
//if  response.response?.statusCode == 200    {
// let status = JSON["login_status"]
//
// if status as! String == "error"{
//     completion(JSON["message"] as! String , true)
// }else{
//     completion ("success" , false)
// }
//}else{
// completion(JSON["message"] as! String , true)
//}
//
//case .failure(let error):
//print(error)
//completion(error.localizedDescription, true)
//
