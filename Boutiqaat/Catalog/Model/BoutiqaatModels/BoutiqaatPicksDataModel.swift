//
//  BoutiqaatPicksDataModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 16/11/2021.
//

import Foundation
import DynamicCodable

struct BoutiqaatResponseModel: Codable{
    
    let data : BoutiqaatDataModel
    let defaultBlockCount : Int
   
}

struct BoutiqaatDataModel: Codable{
  
    let pageCount : Int
    let totalBlock : Int
    let layout : String
    let payload : [BoutiqaatSection]
 
}

struct BoutiqaatSection: Codable{
    let type : String
    let name : String
    let rowCount : Int
    let recordCount : Int
    let banners : [BannerModel]
}
struct BannerModel: Codable{

    let key : String
    let id : String
    let label : String
    let imageUrl : String
    let brandName : String?
    let mrp : String?
    let specialPrice : String?
    let currencyCode : String?
    let discountPercent : String?
    let qtyAvailable :  String?
    let isSaleable : String?
    let qtyAllowed : String?
    let exclusive : String?
    

}
