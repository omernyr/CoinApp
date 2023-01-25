//
//  CoinViewCell.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import UIKit

class CoinViewCell: UITableViewCell {
    
    
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var coinValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
