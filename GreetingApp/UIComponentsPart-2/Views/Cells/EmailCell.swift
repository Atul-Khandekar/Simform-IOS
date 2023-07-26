//
//  EmailCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 15/05/23.
//

import UIKit

class EmailCell: UICollectionViewCell {

    //MARK: - Outlets
    @IBOutlet weak var lblEmail: UILabel!

}

//MARK: - configureCell
extension EmailCell {
    func configureCell(data: Any) {
        guard let data = data as? String else {
            return
        }
        lblEmail.text = data
        lblEmail.textAlignment = .left
    }
}
