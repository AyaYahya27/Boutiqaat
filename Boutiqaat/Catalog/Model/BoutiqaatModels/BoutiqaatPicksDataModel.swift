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
    let payload : [BoutiqaatSections]
    
    
//    init() {
//        pageCount = 0
//        totalBlock = 0
//        layout = ""
//        let section = BoutiqaatSections(from: <#Decoder#>)
//        payload = [section]
//    }
}

struct BoutiqaatSections: Codable{
    let type : String
    let name : String
    let rowCount : Int
    let recordCount : Int
    let banners : [BannerModel]
//    enum CodingKeys: String, CodingKey {
//        case banners
//        case type
//        case name
//        case rowCount
//        case recordCount
//
//       }
//
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        banners = try values.decode([Any].self, forKey: .banners)
//        type = try values.decode(String.self, forKey: .type)
//        name = try values.decode(String.self, forKey: .name)
//        rowCount = try values.decode(Int.self, forKey: .rowCount)
//        recordCount = try values.decode(Int.self, forKey: .recordCount)
//        }
//
//    func encode(to encoder: Encoder) throws {
//           var container = encoder.container(keyedBy: CodingKeys.self)
//           try container.encode(banners, forKey: .banners)
//        try container.encode(type, forKey: .type)
//        try container.encode(name, forKey: .name)
//        try container.encode(rowCount, forKey: .rowCount)
//        try container.encode(recordCount, forKey: .recordCount)
//
//       }
}

//struct ProductBanners : Codable {
//    let banners : [ProductBannerModel]
//
////    init() {
////        let product = ProductBannerModel()
////        banners = [product]
////    }
//}

//struct NormalBanners : Codable {
//    let banners : [NormalBannerModel]
//
////    init() {
////        let product = ProductBannerModel()
////        banners = [product]
////    }
//}

//struct NormalBannerModel : Codable {
//    let key : String
//    let id : String
//    let label : String
//    let imageUrl : String
//}

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
    
//
//    init() {
//        key = ""
//        id = ""
//        label = ""
//        imageUrl = ""
//        brandName = ""
//        mrp = ""
//        specialPrice = ""
//        currencyCode = ""
//        discountPercent = ""
//        qtyAvailable = ""
//        isSaleable = ""
//        qtyAllowed = ""
//        exclusive = ""
//
//    }
}
