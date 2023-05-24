//
//  FooterCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 15/05/23.
//

import UIKit

class FooterCell: UICollectionReusableView {

    //MARK: - Outlets
    @IBOutlet weak var lblFooter: UILabel!
    
}

//MARK: - configureCell
extension FooterCell {
    func configureCell() {
        lblFooter.text = AppConstants.footerText
        lblFooter.backgroundColor = .green
    }
}
