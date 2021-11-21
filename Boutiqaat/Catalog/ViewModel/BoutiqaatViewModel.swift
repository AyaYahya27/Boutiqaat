//
//  BoutiqaatViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire

class BoutiqaatViewModel{
    
    var payload = [BoutiqaatSection]()
 
    func callApi(sender: String, completion: @escaping([BoutiqaatSection]) -> Void)  {
        let headers : HTTPHeaders = [:]
        var url : URL
        if sender == CatalogConstants.women
        {
            url = URL(string: CatalogConstants.url + CatalogConstants.womenUrl)!
        }
        else {
            url = URL(string: CatalogConstants.url + CatalogConstants.menUrl)!
        }
        GetRequest.getRequestWithoutParameters(withHeaders: headers,  url: url) { response, errorMsg, error in
            
            if error {
                print(errorMsg!)
            }else {
                let decoder = JSONDecoder()
                do {
                    let data =  try decoder.decode( BoutiqaatResponseModel.self, from: response as! Data )
                    self.payload = data.data.payload
                    completion(self.payload)
                    
                }catch {
                    print(error)
                }
                
            }
            
        }
       
        
    }
  
}
