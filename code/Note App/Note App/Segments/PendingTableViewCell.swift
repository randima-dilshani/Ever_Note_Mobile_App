//
//  PendingTableViewCell.swift
//  Note App
//
//  Created by Randima Dilshani on 2023-04-22.
//

import UIKit

class PendingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var pendingimage: UIImageView!
    @IBOutlet weak var pendingsubjectname: UILabel!
    @IBOutlet weak var pendinglessontitle: UILabel!
    @IBOutlet weak var pendingduration: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
