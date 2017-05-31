//
//  EventTableViewCell.swift
//  Brocante
//
//  Created by Hadrien Lepoutre on 29/05/2017.
//  Copyright © 2017 Hadrien Lepoutre. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var EventCellImage: UIImageView!
    @IBOutlet weak var EventCellTitle: UILabel!
    @IBOutlet weak var EventCellUserImage: UIImageView!
    @IBOutlet weak var EventCellLocation: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
