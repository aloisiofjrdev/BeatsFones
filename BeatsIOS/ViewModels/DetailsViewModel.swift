//
//  DetailsViewModel.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 22/03/22.
//

import Foundation

struct DetailsViewModel {
    
    // MARK: - Properties
    
    private var details: DetailsModel = DetailsModel()
    
    var nomeText: String {
        return self.details.nomeText
    }
    
    var notaText: String {
        return self.details.notaText
    }
    
    var avaliacaoText: String {
        return self.details.avaliacaoText
    }
    
    var precoText: String {
        return self.details.precoText
    }
    
    var buyButtonText: String {
        return self.details.buyButtonText
    }
}
