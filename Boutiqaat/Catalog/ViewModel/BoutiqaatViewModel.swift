//
//  BoutiqaatViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire

class BoutiqaatViewModel{
    
    var payload = [BoutiqaatSections]()
 
    func callApi(completion: @escaping([BoutiqaatSections]) -> Void)  {
        let headers : HTTPHeaders = [:]
        let url = URL(string: "https://magnumopus.boutiqaat.com/magnumopus/v1/landingpage/layout/home-women/app/1-kw/en?page=1")!
        
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
    
//    func parseProducts(payload : BoutiqaatSections){
//        let decoder = JSONDecoder()
//        do {
//            let jsonData = try JSONEncoder().encode(payload)
//            let aa = try decoder.decode( ProductBanners.self, from: jsonData )
//            print(aa.banners[0])
//        } catch {
//            print(error)
//        }
//    }
//    
//    func parseBanner(payload : BoutiqaatSections){
//        let decoder = JSONDecoder()
//        do {
//            let jsonData = try JSONEncoder().encode(payload)
//            let aa = try decoder.decode( NormalBanners.self, from: jsonData )
//            print(aa.banners[0])
//        } catch {
//            print(error)
//        }
//    }
//    
//    
//    
//}
//
}



//                    for banner in data.data.payload{
//
//                        switch banner.type{
//                        case "slider": let sliderBanners = self.parseBanner(payload: banner)
//                        case "celebrity": let celebrityBanners = self.parseBanner(payload: banner)
//                        case "product": let productBanneres = self.parseProducts(payload: banner)
//
//                        case "product": let productBanneres = self.parseProducts(payload: banner)
//
//                        default:
//                            let productBanneres = self.parseProducts(payload: banner)
//                        }
//
//                    }
//                    self.test = 6
//
//                    completion(self.test)
                    
