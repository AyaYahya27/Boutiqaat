//
//  RegisterationViewModel.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 30/10/2021.
//

import Foundation
import CoreData
import Alamofire



struct RegisterationViewModel{
    var email: String?
    var password : String?
    var fullName : String?
    var phone : String?
    var gender : String?
    var device_token = "fWLZsxC0QoA:APA91bGPPi5gHvh9aQJ_7w1m73YAFHHpaUKOZglxKjjYPPnPMvAC-iGTmFAkRTq7L0rL5VPucQ7qhmIlYcISIyAGSyqxa13iAecopA6LPQh1xzKD_k1-2oEfnhcOZFWKY4I_aS0wzJP4"
    var device_type = "A"
    var lang = "en"
    var credentials : Dictionary<String, Any> = [:]
    
    
    var formIsValid : Bool{
        return email?.isEmpty == false &&   fullName?.isEmpty == false &&
          password?.isEmpty == false
    }
    
   func callRegisterAPI(  completion: @escaping(_ msg :String, _ error : Bool) -> Void)   {
        
        if formIsValid {
            let newUser = RegisterUserModel(device_token: self.device_token, device_type: self.device_type, email: self.email! , full_name: self.fullName!, gender: self.gender!, lang: self.lang, mobile_number: self.phone!, password: self.password!)
            
          let  credentials = formCredentials(newUser : newUser)
            let headers : HTTPHeaders = ["Content-Type":"application/json"]
            let url = "https://beta.boutiqaat.com/rest/V1/customer/register"
             RegisterUser.register(withCredentials: credentials, withHeaders : headers, url : url) { msg, error in
                 
                 if error {
                     completion(msg,true)
                    print(msg)
                    
                }else{
                    
                    
                    saveCredintials(userInfo: newUser)
                    completion(msg, false)
                }
             }
           
        }
      
    }
    
    func formCredentials(newUser: RegisterUserModel) -> Dictionary<String, Any>{
        
        do{
            let data = try JSONEncoder().encode(newUser)
            guard let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Dictionary<String, Any> else { return [:]}
   
            return dict

        }
        catch{
            print("catch error")
            return [:]
        }
    
    }
    
    func  saveCredintials(userInfo: RegisterUserModel){
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newUser = User(context: context)
        newUser.email = userInfo.email
        newUser.password = userInfo.password
        newUser.fullname = userInfo.full_name
        newUser.device_token = userInfo.device_token
        newUser.device_type = userInfo.device_type
        newUser.gender = userInfo.gender
        newUser.lang = userInfo.lang
        newUser.phoneNumber = userInfo.mobile_number
        
        do {
            print("saved")
            try context.save()
        }catch{
            print("error saving data")
        }
        
        
    }
    
   
    
}
