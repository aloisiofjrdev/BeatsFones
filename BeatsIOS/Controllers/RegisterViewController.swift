//
//  RegisterViewController.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var pwRepeatTextField: UITextField!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var userErrorLabel: UILabel!
    @IBOutlet weak var pwErrorLabel: UILabel!
    @IBOutlet weak var pwRepeatErrorLabel: UILabel!
    @IBOutlet weak var alreadyRegisterLabel: UILabel!
    @IBOutlet weak var alreadyRegisterButtonLabel: UIButton!
    private lazy var registerVM: RegisterViewModel = RegisterViewModel(delegate: self)
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        resetFormulario()
    }
    // MARK: - Methods
    private func configureUI() {
        self.navigationController?.navigationBar.barStyle = .black
        configureLabels()
        configureButtons()
        configureTextFiedls()
    }
    private func configureLabels() {
        nomeLabel.text = registerVM.nomeText
        nomeLabel.textColor = .white
        nomeLabel.font = UIFont.boldSystemFont(ofSize: 50)
        nomeLabel.textAlignment = .center
        descriptionLabel.text = registerVM.subNomeText
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 16)
        descriptionLabel.textAlignment = .center
        alreadyRegisterLabel.text = registerVM.alreadyRegisterLabelText
        alreadyRegisterLabel.textColor = .white
        alreadyRegisterLabel.font = UIFont.boldSystemFont(ofSize: 15)
        userErrorLabel.textColor = .red
        userErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwErrorLabel.textColor = .red
        pwErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        pwRepeatErrorLabel.textColor = .red
        pwRepeatErrorLabel.font = UIFont.boldSystemFont(ofSize: 13)
        let greenAttsSB: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor .green, .font: UIFont.boldSystemFont(ofSize: 15)]
        let attibutedTitleSignin = NSMutableAttributedString(string: registerVM.alreadyRegisterButtonText, attributes: greenAttsSB )
        alreadyRegisterButtonLabel.setAttributedTitle(attibutedTitleSignin, for: .normal)
    }
    private func configureButtons() {
        buyButton.layer.cornerRadius = 20
        buyButton.tintColor = .white
        buyButton.setTitle(registerVM.registerButtonText, for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        buyButton.setTitleColor(.white, for: .normal)
    }
    private func configureTextFiedls() {
        userTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        userTextField.keyboardAppearance = .dark
        userTextField.textColor = .white
        userTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderUserText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        pwTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwTextField.keyboardAppearance = .dark
        pwTextField.textColor = .white
        pwTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderPwText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
        pwRepeatTextField.backgroundColor = UIColor(white: 1, alpha: 0.1)
        pwRepeatTextField.keyboardAppearance = .dark
        pwRepeatTextField.textColor = .white
        pwRepeatTextField.attributedPlaceholder = NSAttributedString(string: registerVM.placeholderPwRepeatText, attributes: [.foregroundColor: UIColor(white: 1, alpha: 0.7)])
    }
    private func resetFormulario() {
        buyButton.isEnabled = false
        buyButton.alpha = 0.5
        userErrorLabel.isHidden = false
        pwErrorLabel.isHidden = false
        userErrorLabel.text = ""
        pwErrorLabel.text = ""
        pwRepeatErrorLabel.text = ""
        userTextField.text = ""
        pwTextField.text = ""
        pwRepeatTextField.text = ""
    }
    private func checkForValideForm() {
        buyButton.isEnabled = userErrorLabel.isHidden && pwErrorLabel.isHidden && pwRepeatErrorLabel.isHidden ?  true : false
        buyButton.alpha = userErrorLabel.isHidden && pwErrorLabel.isHidden && pwRepeatErrorLabel.isHidden ? 1 : 0.5
    }
    // MARK: - Actions
    @IBAction func userTextFieldChanged(_ sender: Any) {
        guard let userName = userTextField.text else { return }
        userErrorLabel.text = registerVM.userErrorLabelValidation(userTextField: userName)
        userErrorLabel.isHidden = registerVM.userErrorLabelisHidddenValidation(userTextField: userName)
        checkForValideForm()
    }
    @IBAction func pwTextFieldChanged(_ sender: Any) {
        guard let password = pwTextField.text else { return }
        pwErrorLabel.text = registerVM.pwErrorLabelValidation(pwTextField: password)
        pwErrorLabel.isHidden = registerVM.isHidddenValidation(pwTextField: password)
        checkForValideForm()
    }
    @IBAction func pwRepeatTextFieldChanged(_ sender: Any) {
        guard let password = pwTextField.text else { return }
        guard let passwordRp = pwRepeatTextField.text else { return }
        pwRepeatErrorLabel.text = registerVM.pwRepeatErrorLabelValidation(pwTextField: password, pwRepeatTextField: passwordRp)
        pwRepeatErrorLabel.isHidden = registerVM.pwRepeatIsHiddenValidation(pwTextFeild: password, pwRepeatTextField: passwordRp)
        checkForValideForm()
    }
    @IBAction func registerButtonAction(_ sender: Any) {
        guard let userEmail = userTextField.text else { return }
        guard let userPw = pwTextField.text else { return }
        registerVM.setUserDefautls(userEmail: userEmail, userPw: userPw)
        resetFormulario()
    }
    @IBAction func alreadyRegisterButtonAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func showAlert(title: String, message: String, buttonTitle: String) {
        self.displayMyAlertMessage(title: title, message: message, buttonTitle: buttonTitle)
    }
    func showAlertWithPop(title: String, message: String, buttonTitle: String) {
        self.displayMyAlertMessageWithActionPop(title: title, message: message, buttonTitle: buttonTitle)
    }
}
