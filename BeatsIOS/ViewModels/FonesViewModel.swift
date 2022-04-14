//
//  FonesViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation
import UIKit

protocol FonesViewModelDelegate: AnyObject {
    func onLoadFones()
    func onError(error: Error)
}

class FonesViewModel {
    
    private weak var delegate: FonesViewModelDelegate?
    private let service: WebServiceProtocol
    private(set) var fones = [FonesModel]()
    var arrayFones: [FonesModel] = []
    
    init(delegate: FonesViewModelDelegate, service: WebServiceProtocol = WebService()) {
        self.delegate = delegate
        self.service = service
    }
    
    func loadFones() {
        service.getFones { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .failure(let error):
                self.delegate?.onError(error: error)
            case .success(let fones):
                
                self.fones = fones
                self.delegate?.onLoadFones()
                
            }
        }
    }
    
    func setLogOutUserDefaults() {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
    }
}

