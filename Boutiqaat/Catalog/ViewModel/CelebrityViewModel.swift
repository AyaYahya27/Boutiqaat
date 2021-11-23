//
//  CelebrityViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 21/11/2021.
//

import Foundation
import Alamofire


class CelebrityViewModel{
    
    var payload = [CelebrityModel]()
 
    func callApi( completion: @escaping() -> Void)  {
      
        let headers : HTTPHeaders = ["param": "{\"gender\":\"4194\",\"app_version\":\"5.8.9\",\"platform\":\"app\"}" ,  "Cookie": "PHPSESSID=c41nipt9p7m4uh4dvcbl8rqa8o" ]
        
        let url = URL(string: CelebrityConstants.url)!
        
        GetRequest.getRequestWithoutParameters(withHeaders: headers,  url: url ) { response, errorMsg, error in
            if error {
                print(errorMsg!)
            }else {
                let decoder = JSONDecoder()
                do {
                    let data =  try
                    decoder.decode( [CelebrityModel].self, from: response as! Data )
                    self.payload = data
                     completion()
                    
                }catch {
                    print(error)
                }
                
            }
            
        }
       
        
    }
}

