//
//  CurrentTempModel.swift
//  WeatherApp
//
//  Created by yoon tae soo on 2020/03/10.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import Foundation

class CurrentTempModel{
    
    static let shared = CurrentTempModel()
    
    private init() {}
    var minmaxString : String?
    var ImageString : String?
    var TemperString : String?
    var staticString: String?
    
    
}
