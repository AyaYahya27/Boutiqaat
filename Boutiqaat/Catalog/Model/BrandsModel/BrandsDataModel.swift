//
//  BrandsDataModel.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 22/11/2021.
//

import Foundation

struct BrandsResponseModel: Codable{
    let all_brands : [BrandModel]
}


struct BrandModel: Codable{
    
    let name: String
    let product_count: Int
    let thumbnail: String
}
