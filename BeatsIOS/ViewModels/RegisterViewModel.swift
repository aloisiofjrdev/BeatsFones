//
//  RegisterViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation


struct RegisterViewModel {
    
    // MARK: - Properties
    
    //private var register: RegisterModel = RegisterModel()
    
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
    
    func invalidPw(_ value:String) -> String? {
        
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
}
