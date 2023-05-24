//
//  HeaderCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 15/05/23.
//

import UIKit

class HeaderCell: UICollectionReusableView {

    //MARK: - Outlets
    @IBOutlet weak var lblHeader: UILabel!
    
}

//MARK: - configureCell
extension HeaderCell {
    func configureCell() {
        lblHeader.text = AppConstants.headerText
        lblHeader.backgroundColor = .blue 
    }
}

