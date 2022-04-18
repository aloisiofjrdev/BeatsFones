//
//  BeatsCellTableViewCell.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 17/03/22.
//

import UIKit

class BeatsCellTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var viewTableCell: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var beatImage: UIImageView!
    @IBOutlet weak var nameFoneLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    @IBOutlet weak var reviewsLabel: UILabel!
    
    // MARK: - Methods
    
    var fone: FonesModel? {
        didSet {
            guard let fone = fone else { return }
            nameFoneLabel.text = fone.beatsModel
            rateLabel.text = "⭐ \(fone.rate)"
            reviewsLabel.text = fone.reviews
            priceLabel.text = fone.price
        }
    }
}
