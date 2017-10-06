//
//  ForecastCell.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ForecastCell: UITableViewCell {
    
    var forecast: Forecast?
    var farenheit = true

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var loLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    
    func setFarenheit(forecast: Forecast) {
        self.forecast = forecast
        displayDateFor(forecast)
        self.iconView.image = UIImage(named: forecast.icon)
        switchToFarenheit()
    }
    
    func setCelcius(forecast: Forecast) {
        self.forecast = forecast
        displayDateFor(forecast)
        self.iconView.image = UIImage(named: forecast.icon)
        switchToCelcius()
    }
    
    private func displayDateFor(_ forecast: Forecast) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: forecast.date)
        self.dateLabel.text = dateString
        
    }
    
    private func switchToCelcius() {
        guard let forecast = self.forecast else {return}
        hiLabel.text = String("\(forecast.maxTempC)°")
        loLabel.text = String("\(forecast.minTempC)°")
    }
    
    private func switchToFarenheit() {
        guard let forecast = self.forecast else {return}
        hiLabel.text = String("\(forecast.maxTempF)°")
        loLabel.text = String("\(forecast.minTempF)°")
    }
    
}
