//
//  CompletedTableViewCell.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit

class CompletedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var completedimage: UIImageView!
    @IBOutlet weak var completedsubjectname: UILabel!
    @IBOutlet weak var completedlessontitle: UILabel!
    @IBOutlet weak var completedduration: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
