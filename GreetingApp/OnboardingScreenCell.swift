//
//  OnboardingScreenCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 26/05/23.
//

import UIKit

class OnboardingScreenCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var imgOnboard: UIImageView!
    @IBOutlet weak var lblTitleOnboard: UILabel!
    @IBOutlet weak var lblDescriptionOnboard: UILabel!
}

//MARK: - configureCell
extension OnboardingScreenCell {
    func configureCell(_ data: OnboardingScreenData) {
        imgOnboard.image = data.image
        lblTitleOnboard.text = data.title
        lblDescriptionOnboard.text = data.description
    }
}
