//
//  UserListCellTableViewCell.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 04/07/23.
//

import UIKit

class UserListCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgAvatar: UIImageView!
    @IBOutlet weak var lblId: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    
    func configureCell(list: UserListData?) {
        guard let id = list?.id else {return}
        guard let firstName = list?.firstName else {return}
        guard let lastName = list?.lastName else {return}
        guard let email = list?.email else {return}
        guard let avatar = list?.avatar else {return}
        lblId.text = String(id)
        lblFirstName.text = firstName
        lblLastName.text = lastName
        lblEmail.text = email
        if let url = URL(string: avatar) {
            imgAvatar.load(url: url)
        }
    }
    
}
