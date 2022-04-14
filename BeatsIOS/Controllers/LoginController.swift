//
//  LoginController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit
import Foundation

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    @IBOutlet weak var gradienteImage: UIImageView!
    @IBOutlet weak var womanImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var pwErrorLabel: UILabel!
    
    private let LoginVM: LoginsViewModel = LoginsViewModel()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        resetFormulario()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        checkIsLoggedIn()
        
    }
    
    //MARK: - Methods
    
    private func configureUI() {
        
        self.navigationController?.navigationBar.barStyle = .black
        configureLabels()
        configureButtons()
        configureTextFields()
    }
    
    private func configureLabels() {
        
        nameLabel.text = LoginVM.nomeText
        nameLabel.textColor = .white
        nameLabel.font = UIFont.boldSystemFont(ofSize: 50)
        nameLabel.textAlignment = .center
        
        descriptionLabel.text = LoginVM.subNomeText
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        
        signInLabel.text = LoginVM.signUpText
        signInLabel.textColor = .white
        signInLabel.font = UIFont.boldSystemFont(ofSize: 15)
        
        userErrorLabel.textColor = .red
        userErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwErrorLabel.textColor = .red
        pwErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
    }
    
    private func configureButtons() {
        
        loginButton.layer.cornerRadius = 20
        loginButton.tintColor = .white
        loginButton.setTitle(LoginVM.loginButtonText, for: .normal)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        loginButton.setTitleColor(.white, for: .normal)
        
        let greenAttsSB: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor .green, .font: UIFont.boldSystemFont(ofSize: 15)]
        let attibutedTitleSignin = NSMutableAttributedString(string: LoginVM.signUpButtonText, attributes: greenAttsSB )
        signInButton.setAttributedTitle(attibutedTitleSignin, for: .normal)
    }
    
    private func configureTextFields() {
        
        userTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        userTextField.keyboardAppearance = .dark
        userTextField.textColor = .white
        userTextField.attributedPlaceholder = NSAttributedString(string: LoginVM.placeholderUserText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        
        
        pwTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwTextField.keyboardAppearance = .dark
        pwTextField.textColor = .white
        pwTextField.attributedPlaceholder = NSAttributedString(string: LoginVM.placeholderPwText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    
    private func resetFormulario() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        userErrorLabel.isHidden = false
        pwErrorLabel.isHidden = false
        
        userErrorLabel.text = ""
        pwErrorLabel.text = ""
        
        userTextField.text = ""
        pwTextField.text = ""
    }
    
    private func checkForValideForm() {
        if !userTextField.text!.isEmpty && !pwTextField.text!.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
    
    private func checkIsLoggedIn() {
        
        if LoginVM.checkIsLoggedIn() {
            self.performSegue(withIdentifier: "loginSegue", sender: self)
        }
    }
    

    //MARK: - Actions
    
    @IBAction func entrarButton(_ sender: Any) {
        
        guard let userEmail = userTextField.text else { return }
        guard let userPw = pwTextField.text else { return }
        
        let userDefautlsEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userDefautlsPwStored = UserDefaults.standard.string(forKey: "userPw")
        
        if userDefautlsEmailStored == userEmail {
            if userDefautlsPwStored == userPw {
                //Login is sucessful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                resetFormulario()
            }else{
                self.displayMyAlertMessage(title: "Atenção", message: "Senha inválida", buttonTitle: "Ok")
                return
            }
        }else{
            self.displayMyAlertMessage(title: "Atenção", message: "E-mail inválido", buttonTitle: "Ok")
        }
        
    }
    
    @IBAction func userTextFieldChange(_ sender: Any) {
        checkForValideForm()
    }
    
    
    @IBAction func pwTextFieldChange(_ sender: Any) {
        checkForValideForm()
    }

}
