//
//  RegisterViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 24/03/22.
//

import Foundation

protocol RegisterViewModelDelegate: AnyObject {
    
    func invalidUsername(_ value: String) -> String?
    func invalidPw(_ value:String) -> String?
    func containsDigit(_ value: String) -> Bool
    
}


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
}
