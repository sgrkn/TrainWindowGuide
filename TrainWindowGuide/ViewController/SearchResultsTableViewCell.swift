//
//  SearchResultsTableViewCell.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/06/16.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
    @IBOutlet var img: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var rail: UILabel!
    @IBOutlet var station: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
