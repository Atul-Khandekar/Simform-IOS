//
//  UserListCellTableViewCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import UIKit
import SDWebImage

class UserListCellTableViewCell: UITableViewCell {
    
    //MARK: - Outlets
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
}

//MARK: - configureCell
extension UserListCellTableViewCell {
    func configureCell(list: UserListData?) {
        
        if let id = list?.id {
            lblId.text = String(id)
        }
        
        lblFirstName.text = list?.firstName
        lblLastName.text = list?.lastName
        lblEmail.text = list?.email
        
        guard let avatar = list?.avatar else {return}
        if let url = URL(string: avatar) {
            imgAvatar.sd_setImage(with: url)
        }
    }
}
