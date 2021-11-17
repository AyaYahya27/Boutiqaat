//
//  BoutiqaatViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import Alamofire


class BoutiqaatViewModel{
    func callApi(){
        
        let parameters: Parameters = [:]
        
        let headers : HTTPHeaders = ["Authorization": "Bearer ku2f1jlhmsmmuhhrimdkryfw41qfhb6c",
                                     "Cookie": "PHPSESSID=mv59jmc2jredblo4filgl9h985"]
        let url = URL(string: "https://magnumopus.boutiqaat.com/magnumopus/v1/landingpage/layout/home-women/app/1-kw/en?page=1")!
        
        GetRequest.getRequest(withHeaders: headers, withParameters: parameters, url: url) { response, errorMsg, error in
            print(response ?? error)
        }
    
        
    }
}
