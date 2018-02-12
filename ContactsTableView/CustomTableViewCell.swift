//
//  CustomTableViewCell.swift
//  ContactsTableView
//
//  Created by Eduardo Vital Alencar Cunha on 16/05/17.
//  Copyright © 2017 Vital. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
