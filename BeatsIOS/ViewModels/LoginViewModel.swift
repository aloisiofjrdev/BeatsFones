//
//  LoginViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation


struct LoginsViewModel {
    
    // MARK: - Properties
    
    private var login: LoginModel = LoginModel()
    
    var nomeText: String {
        return self.login.nomeText
    }
    
    var subNomeText: String {
        return self.login.subNomeText
    }
    
    var placeholderUserText: String {
        return self.login.placeholderUserText
    }
    
    var placeholderPwText: String {
        return self.login.placeholderPwText
    }
    
    var loginButtonText: String {
        return self.login.loginButtonText
    }
    
    var signUpText: String {
        return self.login.signUpText
    }
    
    var signUpButtonText: String {
        return self.login.signUpButtonText
    }
}
