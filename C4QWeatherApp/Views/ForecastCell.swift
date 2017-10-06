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
    var tempFormat = TempFormat.farenheit

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var loLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var convertButton: UIButton!
    
    enum TempFormat {
        case celcius
        case farenheit
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(forecast: Forecast) {
        self.hiLabel.text = String(forecast.maxTempF)
        self.loLabel.text = String(forecast.minTempF)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: forecast.date)
        self.dateLabel.text = dateString
        
        self.iconView.image = UIImage(named: forecast.icon)
    }
    @IBAction func convertButtonTapped(_ sender: Any) {
        switch tempFormat {
        case .farenheit:
            tempFormat = .celcius
        case .celcius:
            tempFormat = .farenheit
        }
    }
    
    private func switchToCelcius() {
        guard let forecast = self.forecast else {return}
        hiLabel.text = String(forecast.maxTempC)
        loLabel.text = String(forecast.minTempC)
        convertButton.setTitle("C", for: .normal)
    }
    
    private func switchToFarenheit() {
        guard let forecast = self.forecast else {return}
        hiLabel.text = String(forecast.maxTempF)
        loLabel.text = String(forecast.minTempF)
        convertButton.setTitle("F", for: .normal)
    }
    
}
