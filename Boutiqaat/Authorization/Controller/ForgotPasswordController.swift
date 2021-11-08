//
//  ForgotPasswordController.swift
//  Boutiqaat
//
//  Created by Ghazal Adnan on 06/11/2021.
//

import Foundation


import UIKit
class ForgotPasswordController: NavigationView{

    //MARK: -Properties

    private let instructiolabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "To reset your password, enter the email address you use to sign in to boutiqaat"
        label.textAlignment = .center
        return label
    }()

    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Enter your email address", icon: "envelope")
        return tf
    }()

    private let nextButton: UIButton = {
        let button = CustomButton(color: #colorLiteral(red: 0.6721322536, green: 0.5807828307, blue: 0.1846646965, alpha: 1), buttonTitle: "NEXT")
        button.addTarget(self, action: #selector(handlenextButtonPressed), for: .touchUpInside)
        return button
    }()


    //MARK: -Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }


    //MARK: -Helpers

    func configureUI(){

        nav(color: .white, title: "Forgot your Password?")

        view.backgroundColor = #colorLiteral(red: 0.9578720927, green: 0.9524629712, blue: 0.9742853045, alpha: 1)
        let stack = UIStackView(arrangedSubviews: [instructiolabel, emailTextField, nextButton])
        stack.axis = .vertical
        stack.spacing = 30
        view.addSubview(stack)
        stack.centerX(inView: view)
        stack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,right: view.rightAnchor,paddingTop: 20,paddingLeft: 20,paddingRight: 20)

    }

    //MARK: -Actions
    @objc func handlenextButtonPressed(){
        print("Next Button Pressed")
    }
}
