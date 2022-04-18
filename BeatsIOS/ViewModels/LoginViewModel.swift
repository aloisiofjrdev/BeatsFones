//
//  LoginViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import Foundation

struct LoginsViewModel {
    
    // MARK: - Properties
    var nomeText: String {
        return LoginModel.nomeText
    }
    var subNomeText: String {
        return LoginModel.subNomeText
    }
    var placeholderUserText: String {
        return LoginModel.placeholderUserText
    }
    var placeholderPwText: String {
        return LoginModel.placeholderPwText
    }
    var loginButtonText: String {
        return LoginModel.loginButtonText
    }
    var signUpText: String {
        return LoginModel.signUpText
    }
    var signUpButtonText: String {
        return LoginModel.signUpButtonText
    }
    func checkIsLoggedIn() -> Bool {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        if isUserLoggedIn {
            return true
        } else {
            return false
        }
    }
}
