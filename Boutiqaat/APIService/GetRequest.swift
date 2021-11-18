//
//  GetRequest.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire

class GetRequest{
    

    static func getRequestWithoutParameters(withHeaders: HTTPHeaders,  url: URL ,  completion: @escaping( _ response : Any? ,_ errorMsg: String?, _  error : Bool) -> Void){
        
        DispatchQueue.main.async {
            
            let request =  AF.request(url , method: .get,  encoding: JSONEncoding.default, headers: withHeaders )

            
            request.responseJSON{ response  in
                switch response.result{
                case .success(let value ):
                    if  response.response?.statusCode == 200    {

                        completion(response.data, nil,  false)

                    }
                case .failure(let error):
                    completion(nil, error.localizedDescription,  true)
                }
                
           }

            
        }
        
    }
}

