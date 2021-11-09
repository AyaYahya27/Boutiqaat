//
//  PopUp.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 09/11/2021.
//

import UIKit

class PopUp{
    
     let  popUp: PopUpView = {
        let pop = PopUpView()
        return pop
    }()
    
     
    func openPopUp(error : String , view : UIView){
         popUp.errorLabel.text = error
         popUp.okButton.addTarget(self, action: #selector(self.closePopUp), for: .touchUpInside)
         view.addSubview(popUp.view)
         return
     }
     
     @objc func closePopUp(){
         popUp.view.removeFromSuperview()
     }
     
    
}
