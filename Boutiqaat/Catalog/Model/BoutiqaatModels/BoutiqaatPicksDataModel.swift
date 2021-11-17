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
    let payload : [BoutiqaatPicksDataModel]
}

struct BoutiqaatSections: Codable{
 
    let name : String
    let rowCount : Int
    let recordCount : Int
    let banners : [BoutiqaatPicksDataModel]
}

struct SectionBanners{
    let key: String
    let id: String
    let label: String
    let position: Int
    let imageUrl: String
   
}

struct BoutiqaatPicksDataModel: Codable{
//    let name : String
//    let rowCount : Int
//    let recordCount : Int
//    let banners : [ProductBannerModel]
    let banners: [Any]
    
    enum CodingKeys: String, CodingKey {
           case banners
           
       }
    
    
    init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            banners = try values.decode([Any].self, forKey: .banners)
        }
    
    func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)
           try container.encode(banners, forKey: .banners)
           
       }
    
}


struct ProductBannerModel: Codable{
    
    let key : String
    let id : String
    let label : String
    let imageUrl : String
    let brandName : String?
    let mrp : String?
    let specialPrice : String?
    let currrencyCode : String?
    let discountPercent : String?
    let qtyAvailable :  String?
    let isSaleable : String?
    let qtyAllowed : String?
    let exclusive : String?
    
    

  
   
}
