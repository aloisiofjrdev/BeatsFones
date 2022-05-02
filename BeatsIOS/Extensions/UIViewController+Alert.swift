//
//  UIViewController+Alert.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 25/03/22.
//

import Foundation
import UIKit

extension UIViewController {
    func displayMyAlertMessage(title: String, message: String, buttonTitle: String, pop: Bool) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: buttonTitle, style: .default) { action in
            if pop {
                self.navigationController?.popViewController(animated: true)
            }
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil )
    }
}
