//
//  CategoriesModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 21/11/2021.
//

import Foundation

struct CategoriesResponseModel: Codable{
    let ad_status : String
    let category_name : String
    let shoplanding_category : [CategoryDataModel]
    
}

struct CategoryDataModel: Codable {
    
    let category_id: String
    let name : String
    let category_url : String
    let category_image_rectangle : String
}

struct ChildCategory : Codable {
    let category_id : String
    let name : String
    
}
