//
//  SearchBarCellTableViewCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 12/05/23.
//

import UIKit

class SearchBarCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var lblFruitName: UILabel!
}

//MARK: - configureCell
extension SearchBarCell {
    func configureCell(data: String) {
        lblFruitName.text = data
    }
}
