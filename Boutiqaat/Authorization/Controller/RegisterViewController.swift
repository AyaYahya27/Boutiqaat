
import UIKit

class RegisterViewController : NavigationViewController{
    
    
    
    private var registerationViewModel = RegisterationViewModel()
    private var selectedGender : GenderButton?
    private var spinner = Spinner()
    private var popup = PopUp()
    
    
    
    private let emailTextField : NormalTextField = {

        let tf = NormalTextField(placeholder: "Email Address", secure: false)
        tf.keyboardType = .emailAddress
        return tf

    }()
    
    
    private let passwordTextField : UITextField = {

        let passwordShowButton : UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Show", for: .normal)
            button.setTitleColor(#colorLiteral(red: 0.6817419529, green: 0.5798506141, blue: 0.1964682341, alpha: 1), for: .normal)
            button.layer.cornerRadius = 5
            button.addTarget(self , action: #selector(handleShowButton), for: .touchUpInside)
            button.setHeight(50)
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            button.isEnabled = true
            return button
        }()
        let tf = PasswordTextField(placeholder: "Password", secure: false)
        tf.rightView = passwordShowButton
        tf.rightViewMode = .always

        tf.keyboardType = .default
        return tf

    }()
    
    private let fullnameTextField : UITextField = {
        let tf = NormalTextField(placeholder: "Full Name", secure: false)
        tf.keyboardType = .default
        return tf

    }()

    let countryCodeLabel : UITextField = {
         let tf = UITextField()
         let spacer = UIView()
         spacer.setDimensions(height: 50, width: 12)
         tf.leftView = spacer
         tf.leftViewMode = .always
         tf.rightView = spacer
         tf.rightViewMode = .always
         tf.layer.borderWidth = 0.5
         tf.layer.borderColor = CGColor(gray: 0.5, alpha: 0.3)
         tf.backgroundColor = .white
         tf.isEnabled = false
         return tf

     }()

    private let phoneTextField : UITextField = {
        let tf = NormalTextField(placeholder: "Mobile Number (for order updates)", secure: false)
        tf.keyboardType = .numberPad
        return tf

    }()
  
    
    private let femaleButton : GenderButton = {
        let button = GenderButton()
        button.setButtonUI(placeholder: "Female", id: "1")
        button.addTarget(self, action: #selector(handleGenderSelect), for: .touchUpInside)
        return button
    }()
    
    private let maleButton : GenderButton = {
        let button = GenderButton()
        button.setButtonUI(placeholder: "Male" , id : "2")
        button.addTarget(self, action: #selector(handleGenderSelect), for: .touchUpInside)
        return button
    }()
    
    private let laterButton : GenderButton = {
        let button = GenderButton()
        
        button.setButtonUI(placeholder: "Later", id : "3")
        button.addTarget(self, action: #selector(handleGenderSelect), for: .touchUpInside)
        return button
    }()
    
    
    private let registerButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("REGISTER", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6817419529, green: 0.5798506141, blue: 0.1964682341, alpha: 1)
        button.layer.cornerRadius = 5
        button.setHeight(50)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    private let alreadyHaveAccountButton : UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.attributedTitle(firstPart:  "Already have an account?  ", secondPart: "Log In" )
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()


    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureNotificationObservers()

        
    }
    
    
    
    // function to set the UI view
    func configureUI(){
    
        nav(color: .white, title: "Register")  // set the navigation bar
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handleClose))
        view.backgroundColor = #colorLiteral(red: 0.9499955773, green: 0.9446783662, blue: 0.9664382339, alpha: 1)              // set the backgroundcolor
        
        selectedGender = femaleButton
        selectedGender?.selected()
        
        
        countryCodeLabel.text = "+965"

        let phoneStack = UIStackView(arrangedSubviews: [countryCodeLabel, phoneTextField])
        phoneStack.axis = .horizontal
        phoneStack.spacing = 0
        
        
        
        // set the Form view
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, phoneStack ])
        
        stack.axis = .vertical
        stack.spacing = 0
        view.addSubview(stack)
        stack.anchor(top : view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:  32, paddingLeft: 20, paddingRight: 20)
        
        
        let stackh = UIStackView(arrangedSubviews: [femaleButton, maleButton, laterButton])
        stackh.distribution = .fillEqually
        stackh.axis = .horizontal
        stackh.spacing = 0
        stackh.layer.cornerRadius = 3
        view.addSubview(stackh)
        stackh.anchor(top : phoneTextField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:  32, paddingLeft: 20, paddingRight: 20)
        
        
        view.addSubview(registerButton)
        registerButton.centerX(inView: view)
        registerButton.anchor(top : stackh.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:  32, paddingLeft: 20, paddingRight: 20)
        
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(top : registerButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop:  20, paddingLeft: 20, paddingRight: 20)
        
    }
    
    func configureNotificationObservers(){
    
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        phoneTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    
    
    @objc func textDidChange(sender : UITextField){

        switch sender {
        case emailTextField : registerationViewModel.email = sender.text
        case passwordTextField : registerationViewModel.password = sender.text
        case fullnameTextField :  registerationViewModel.fullName = sender.text
        case phoneTextField : registerationViewModel.phone = sender.text
        default: print("sender doesnot exist")
            
        }
    }
    
    @objc func handleShowButton(){
        if passwordTextField.isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
        }else {
            passwordTextField.isSecureTextEntry = true
        }
    }
    
    @objc func handleGenderSelect(sender: UIButton){
        let button = sender as! GenderButton
        button.selected()
        if let selectedGender = selectedGender {
            
            if selectedGender != button{
                selectedGender.unSelected()
            }
            
        }
        selectedGender = button
        
    }
    
    @objc func handleRegister(){
        
        
        
        if !FormValidation.checkValidEmail(email : emailTextField.text!){
            popup.openPopUp(error: "Enter a Valid Email", view: view)
            return

        }
        
        if FormValidation.checkPassword(password: passwordTextField.text!) != ""{
            let msg = FormValidation.checkPassword(password: passwordTextField.text!)
            popup.openPopUp(error: msg, view: view)
            return
        }
       
       if fullnameTextField.text == "" {
           popup.openPopUp(error: "Enter your Name", view: view)
            return
         }
        if phoneTextField.text?.count != 8 {
            popup.openPopUp(error: "Enter a Valid phone number", view: view)
            return
        }
       if selectedGender?.id == "" {
           popup.openPopUp(error: "Select Your Gender", view: view)
           return
        }
    
       
        
        
        registerationViewModel.email =  emailTextField.text
        registerationViewModel.password = passwordTextField.text
        registerationViewModel.fullName = fullnameTextField.text
        registerationViewModel.phone = phoneTextField.text
        registerationViewModel.gender = selectedGender?.id
        
        spinner.showSpinner(button: registerButton)
        
      
        registerationViewModel.callRegisterAPI(){msg , error in
            if error{
                self.popup.openPopUp(error: msg, view: self.view)
                self.spinner.hideSpinner(button: self.registerButton, title: "Register")
            }else{
                let controller = MainTabController()
                self.navigationController?.pushViewController(controller, animated: true)
                
            }
        }
        
       
           
    }
    
    @objc func handleShowLogin(){
        
        let controller = LoginController()
        navigationController?.pushViewController(controller, animated: true)
 
    }
    
    
    @objc func handleClose(){
     
     self.navigationController?.pushViewController(MainTabController(), animated: true)
       
     }

}



