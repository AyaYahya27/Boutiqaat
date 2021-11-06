//
//  FormValidationController.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 06/11/2021.
//

import Foundation


class Form{
    
    static func checkValidEmail(email: String) -> Bool{

        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: email)

    }
    
    static func checkPassword(password : String) -> String{
        
        if password == "" {
            return "Enter password"
        }

        if password.count < 6 {
            return "password should be at least 6 charcters"
        }

        if password.rangeOfCharacter(from: CharacterSet.uppercaseLetters) != nil{

            if password.rangeOfCharacter(from: CharacterSet.lowercaseLetters) != nil{
                if password.rangeOfCharacter(from: CharacterSet.punctuationCharacters) != nil
                {
                    if password.rangeOfCharacter(from: CharacterSet.decimalDigits) == nil{
                        return "password should have at least one digit character character"
                    }
                   
                }else {
                    return "password should have at least one special character character"
                }

            }else {
                return "password should have at least one lowercase character"
            }

        }else{
            return "password should have at least one uppercase character"
        }


        return ""
    }
    
}
