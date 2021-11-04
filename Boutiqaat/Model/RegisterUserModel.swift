//
//  RegisterUserModel.swift
//  Boutiqaat

import Foundation

struct RegisterUserModel : Codable{
    
    let device_token : String
    let device_type : String
    let email : String
    let full_name : String
    let gender : String
    let lang: String
    let mobile_number : String
    let password : String
}





