//
//  BoutiqaatViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire

class BoutiqaatViewModel{
    
   
    var apiResponse = [ProductBannerModel]()
    var test : Int = 0
   
    func callApi(completion: @escaping(Int) -> Void)  {
        let headers : HTTPHeaders = [:]
        let url = URL(string: "https://magnumopus.boutiqaat.com/magnumopus/v1/landingpage/layout/home-women/app/1-kw/en?page=1")!
        
        GetRequest.getRequestWithoutParameters(withHeaders: headers,  url: url) { response, errorMsg, error in

            if error {
                print(errorMsg!)
            }else {
                let decoder = JSONDecoder()
                do {
                    let data =  try
                    decoder.decode( BoutiqaatResponseModel.self, from: response as! Data )
                    self.test = 6
                    completion(self.test)
                  
                }catch {
                    print(error)
                }
               
            }

        }
        
    }
    
    func doit(array : BoutiqaatSections){
        let decoder = JSONDecoder()
        do {
           let jsonData = try JSONEncoder().encode(array)
           let aa = try decoder.decode( ProductBanners.self, from: jsonData )
            print(aa.banners[0])
        } catch {
            print(error)
        }
    }
    
    
    
}

