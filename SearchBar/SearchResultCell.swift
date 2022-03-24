//
//  SearchResultCell.swift
//  SearchBar
//
//  Created by User on 24/03/2022.
//

import UIKit

class SearchResultCell: UITableViewCell {

    @IBOutlet weak var musicName: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var artisteImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
