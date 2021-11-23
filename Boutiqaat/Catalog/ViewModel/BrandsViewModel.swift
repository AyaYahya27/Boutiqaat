//
//  BrandsViewModel.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 22/11/2021.
//

import Alamofire
import UIKit


class BrandsViewModel{
    
    var brandsPayload = [BrandModel]()
    
       func callApi(completion: @escaping([BrandModel]) -> Void)  {
           let param = "{\"gender\":\"4194\",\"app_version\":\"5.8.6\"}"
           let headers : HTTPHeaders = ["param": param,
           "Cookie": "PHPSESSID=bj38lbkconk4ioffaojmfgmrog; selected_gender=women"]
           let url = URL(string: BrandsConstants.brandsUrl)!
           
           GetRequest.getRequestWithoutParameters(withHeaders: headers,  url: url) { response, errorMsg, error in
//               print(response)
               if error {
                   print(errorMsg!)
               }else {
                   let decoder = JSONDecoder()
                   do {
                       let data =  try decoder.decode( BrandsResponseModel.self, from: response as! Data )
                       print(data.all_brands[0])
                       self.brandsPayload = data.all_brands
                       completion(self.brandsPayload)
                       
                   }catch {
                       print(error)
                   }
                   
               }
               
           }
          
           
       }
}
