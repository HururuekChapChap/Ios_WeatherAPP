//
//  MainCellCtrollerTableViewCell.swift
//  WeatherApp
//
//  Created by yoon tae soo on 2020/03/10.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import UIKit

class MainCellCtrollerTableViewCell: UITableViewCell {

    let identi = "MainCellCtrollerTableViewCell"
    
    @IBOutlet weak var staticLabel: UILabel!
    
    @IBOutlet weak var WeatherImageView: UIImageView!
    
    @IBOutlet weak var minmaxLabel: UILabel!
    
    @IBOutlet weak var TemperatualLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
