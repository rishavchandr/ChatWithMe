//
//  MessageCell.swift
//  chatWithMe
//
//  Created by Rishav chandra on 26/02/24.
//

import UIKit

class MessageCell: UITableViewCell {
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var msg: UILabel!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.layer.cornerRadius = cellView.frame.size.height / 5
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
