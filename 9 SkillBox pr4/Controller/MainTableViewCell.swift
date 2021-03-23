//
//  MainTableViewCell.swift
//  9 SkillBox pr4
//
//  Created by Kirill Drozdov on 24.03.2021.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    @IBOutlet weak var day_weather: UILabel!
    @IBOutlet weak var description_weather: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
