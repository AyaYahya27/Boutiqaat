//
//  CategoryViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 21/11/2021.
//

import Foundation
import Alamofire


class CategoryViewModel{
    
    var payload = [CategoryDataModel]()
 
    func callApi( completion: @escaping() -> Void)  {
      
        let headers : HTTPHeaders = ["param": "{\"gender\":\"4194\",\"app_version\":\"5.8.2\"}" ,  "Cookie": "PHPSESSID=c41nipt9p7m4uh4dvcbl8rqa8o" ]
        
        let url = URL(string: CategoryConstants.url)!
        
        GetRequest.getRequestWithoutParameters(withHeaders: headers,  url: url ) { response, errorMsg, error in
            if error {
                print(errorMsg!)
            }else {
                let decoder = JSONDecoder()
                do {

                    let data =  try decoder.decode( CategoriesResponseModel.self, from: response as! Data )
                    self.payload = data.shoplanding_category
                    completion()
                    
                }catch {
                    print(error)
                }
                
            }
            
        }
       
        
    }
}

