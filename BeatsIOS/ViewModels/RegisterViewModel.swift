//
//  RegisterViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation


struct RegisterViewModel {
    
    // MARK: - Properties
    
    private var register: RegisterModel = RegisterModel()
    
    var nomeText: String {
        return self.register.nomeText
    }
    
    var subNomeText: String {
        return self.register.subNomeText
    }
    
    var placeholderUserText: String {
        return self.register.placeholderUserText
    }
    
    var placeholderPwText: String {
        return self.register.placeholderPwText
    }
    
    var placeholderPwRepeatText: String {
        return self.register.placeholderPwRepeatText
    }
    
    var registerButtonText: String {
        return self.register.registerButtonText
    }
    
    var alreadyRegisterLabelText: String {
        return self.register.alreadyRegisterLabelText
    }
    
    var alreadyRegisterButtonText: String {
        return self.register.alreadyRegisterButtonText
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
