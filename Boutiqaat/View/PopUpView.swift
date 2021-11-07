//
//  PopUpView.swift
//  Boutiqaat
//
//  Created by Aya Yahya on 02/11/2021.
//
import UIKit

class PopUpView: UIViewController{
    
   static let viewWidth = UIScreen.main.bounds.width - 80

    
    
    
    private let warningImage : UIImageView = {
        let warning = UIImage(systemName: "exclamationmark.circle")
        let image = UIImageView(image: warning)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.tintColor = #colorLiteral(red: 0.6871555448, green: 0.575466454, blue: 0.1973420084, alpha: 1)
        return image
    }()
    
    
     
     private let warningBox : UIView = {
         let box = UIView()
         box.backgroundColor = .white
         box.frame = CGRect(x: 40 , y: (UIScreen.main.bounds.height - 180)/2 , width: viewWidth, height:200)
         box.layer.cornerRadius = 5
         return box
     }()
    
     let okButton : UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.6871555448, green: 0.575466454, blue: 0.1973420084, alpha: 1)
        button.layer.cornerRadius = 5
        button.setWidth(viewWidth - 60)
        button.setTitle("OK", for: .normal)
        return button
    }()
    
    
     let errorLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        
        label.font.withSize(10)
        return label
    }()
   
    
    init(){
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
       
    }
    
    
    func configureUI(){
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.4)
        
        view.addSubview(warningBox)
        warningBox.addSubview(warningImage)
        warningImage.centerX(inView: warningBox)
        warningImage.anchor(top: warningBox.topAnchor, paddingTop: 10, width: 50, height: 50
        )
        warningBox.addSubview(errorLabel)
        errorLabel.centerX(inView: warningBox)
        errorLabel.anchor(top: warningImage.bottomAnchor, paddingTop: 10, paddingLeft: 10, paddingRight: 10 , width: PopUpView.viewWidth - 20 , height: 50)
        
        
        
        warningBox.addSubview(okButton)
               okButton.centerX(inView: warningBox)
        okButton.anchor(bottom: warningBox.bottomAnchor , paddingBottom: 10)
               
    }
    
    
  
}
