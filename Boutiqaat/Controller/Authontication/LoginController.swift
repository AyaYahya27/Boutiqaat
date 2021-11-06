//
//  LoginController.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation

//
//  ViewController.swift
//  LoginBoutiqaat
//
//  Created by Ghazal Adnan on 28/10/2021.
//

import UIKit
import Alamofire

class LoginController: NavigationView{
    
    //MARK: -PROPERTIES
    
  
    
    private let loginButton: UIButton = {
        let button = CustomButton(color: #colorLiteral(red: 0.6721322536, green: 0.5807828307, blue: 0.1846646965, alpha: 1), buttonTitle: "Log In")
        button.addTarget(self, action: #selector(handleLoginPressed), for: .touchUpInside)
        return button
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email", icon: "envelope")
        
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password", icon: "lock")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = AttributedButton(text: "Forgot password?", bold: true)
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = AttributedButton(text: "Don't have account yet? Create one!", bold: false)
        button.addTarget(self, action: #selector(handleCreateAccount), for: .touchUpInside)
        return button
    }()
    
//    private let popUp: PopUpView = {
//        let popup = PopUpView()
//
//        return popup
//    }()
    
    
    //MARK: -LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9578720927, green: 0.9524629712, blue: 0.9742853045, alpha: 1)
        configureUI()
        
    }
    
    //MARK: -HELPERS
    
    func configureUI(){
        nav(color: .white, title: "Login")

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleClose))
        

        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 32, paddingLeft: 20, paddingRight: 20)
        
        let buttonStack = UIStackView(arrangedSubviews: [loginButton, forgotPasswordButton, dontHaveAccountButton])
        buttonStack.axis = .vertical
        buttonStack.spacing = 10
        view.addSubview(buttonStack)
        buttonStack.centerX(inView: view)
        buttonStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
    }
    
//    func openPopUp(error : String){
//        popUp.errorLabel.text = error
//        popUp.okButton.addTarget(self, action: #selector(self.closePopUp), for: .touchUpInside)
//        view.addSubview(popUp.view)
//        return
//    }
    
    
    func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
    //MARK: -Actions
    
    @objc func handleClose(){
       print("CLOSE WAS PRESSED!")
    }
    
    @objc func handleLoginPressed(){
        
        if !FormValidation.checkValidEmail(email: emailTextField.text!){
            openPopUp(error: "Enter a valid email")
            return
        }
      
        if (passwordTextField.text!.count) < 6{
            openPopUp(error: "Password Not Correct")
            return
        }
        
             if let email = self.emailTextField.text, let password = self.passwordTextField.text{
                let viewModel = LoginViewModel(username: email, password: password)
                 let isEmailValid = validateEmail(enteredEmail: email)

                 showSpinner(button: loginButton)
                DispatchQueue.main.async {
                viewModel.encodeTokenBody { loginStatus in
                    print(loginStatus)
                    if loginStatus{
                        self.dismiss(animated: true, completion: nil)
                        let controller = MainTabController()
                        self.navigationController?.pushViewController(controller, animated: true)
                        
                    } else{
                        
                        self.openPopUp(error: "Invalid data")
                        self.popUp.okButton.addTarget(self, action: #selector(self.handleDismissWarning), for: .touchUpInside)
                        self.hideSpinner(button: self.loginButton, title: "Login")
                    }
                }
            }
                 
             }

        
    }
    
    @objc func handleForgotPassword(){

        let controller = ForgotPasswordController()
        navigationController?.pushViewController(controller, animated: true)
        
        
    }
    
    @objc func handleCreateAccount(){
                print("Ceate account pressed")
        let controller = RegisterViewController()
        navigationController?.popViewController(animated: true)
    }
    
    
    @objc func handleDismissWarning(){
        print("pressed!!")
        popUp.view.removeFromSuperview()
    }
//    @objc func closePopUp(){
//        popUp.view.removeFromSuperview()
//    }
    
}

