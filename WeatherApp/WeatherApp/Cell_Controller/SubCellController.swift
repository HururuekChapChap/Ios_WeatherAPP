//
//  SubCellController.swift
//  WeatherApp
//
//  Created by yoon tae soo on 2020/03/10.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import UIKit

class SubCellController: UITableViewCell {

    let identify = "SubCellController"
    
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var MinLabel: UILabel!
    
    @IBOutlet weak var WeatherImageView: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var temperator: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
