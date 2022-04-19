//
//  RegisterViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    func showAlert(title: String, message: String, buttonTitle: String)
    func showAlertWithPop(title: String, message: String, buttonTitle: String)
}

struct RegisterViewModel {
    private var delegate: RegisterViewModelDelegate?
    init(delegate: RegisterViewModelDelegate) {
        self.delegate = delegate
    }
    // MARK: - Properties
    var nomeText: String {
        return RegisterModel.nomeText
    }
    var subNomeText: String {
        return RegisterModel.subNomeText
    }
    var placeholderUserText: String {
        return RegisterModel.placeholderUserText
    }
    var placeholderPwText: String {
        return RegisterModel.placeholderPwText
    }
    var placeholderPwRepeatText: String {
        return RegisterModel.placeholderPwRepeatText
    }
    var registerButtonText: String {
        return RegisterModel.registerButtonText
    }
    var alreadyRegisterLabelText: String {
        return RegisterModel.alreadyRegisterLabelText
    }
    var alreadyRegisterButtonText: String {
        return RegisterModel.alreadyRegisterButtonText
    }
    func invalidUsername(_ value: String) -> String? {
        let regularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        if !predicate.evaluate(with: value) {
            return "Nome de usúario inválido"
        }
        return nil
    }
    func invalidPw(_ value: String) -> String? {
        if value.count < 8 {
            return "Senha precisa conter no mínimo 8 caracteres"
        }
        if containsDigit(value) {
            return "Senha precisa conter no mínimo 1 dígito"
        }
        return nil
    }
    func containsDigit(_ value: String) -> Bool {
        let regularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regularExpression)
        return !predicate.evaluate(with: value)
    }
    func validationUser(pwTextField: String, pwRepeatTextField: String) -> String? {
        if pwTextField != pwRepeatTextField {
            return "As senhas não coincidem"
        }
        return nil
    }
    func setUserDefautls(userEmail: String, userPw: String) {
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPw, forKey: "userPw")
        delegate?.showAlertWithPop(title: "Atenção", message: "Cadastro feito com sucesso!", buttonTitle: "Ok")
    }
    func pwErrorLabelValidation(pwTextField: String) -> String? {
        if pwTextField.isEmpty {
            return ""
        } else {
            if let errorMessage = invalidPw(pwTextField) {
                return errorMessage
            } else {
                return nil
            }
        }
    }
    func isHidddenValidation(pwTextField: String) -> Bool {
        if invalidPw(pwTextField) != nil {
            return false
        } else {
            return true
        }
    }
    func pwRepeatErrorLabelValidation(pwTextField: String, pwRepeatTextField: String) -> String? {
        if pwRepeatTextField.isEmpty {
            return ""
        } else {
            if let errorMessage = validationUser(pwTextField: pwTextField, pwRepeatTextField: pwRepeatTextField) {
                return errorMessage
            } else {
                return nil
            }
        }
    }
    func pwRepeatIsHiddenValidation(pwTextFeild: String, pwRepeatTextField: String) -> Bool {
        if validationUser(pwTextField: pwTextFeild, pwRepeatTextField: pwRepeatTextField) != nil {
            return false
        } else {
            return true
        }
    }
}
