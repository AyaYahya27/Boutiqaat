//
//  BoutiqaatPicksDataModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation

struct BoutiqaatPicksDataModel: Codable{
    let name : String
    let rowCount : Int
    let recordCount : Int
    let banners : [ProductBannerModel]
    
}


struct ProductBannerModel: Codable{
    let id : String
    let label : String
    let imageUrl : String
    let brandName : String
    let mrp : String
    let specialPrice : String
    let currrencyCode : String
    let discountPercent : String
    let qtyAvailable :  String
    let isSaleable : String
    let qtyAllowed : String
    let exclusive : String
}
