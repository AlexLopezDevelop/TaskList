//
//  MyCell.swift
//  TaskList
//
//  Created by Alex Lopez on 31/1/18.
//  Copyright © 2018 alex.lopez. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var typeTask: UIImageView!
    @IBOutlet weak var done: UIImageView!
    @IBOutlet weak var tittle: UILabel!
    @IBOutlet weak var descrip: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
