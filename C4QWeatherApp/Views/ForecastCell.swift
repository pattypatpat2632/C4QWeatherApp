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

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var hiLabel: UILabel!
    @IBOutlet weak var loLabel: UILabel!
    @IBOutlet var iconView: UIImageView!
    @IBOutlet var convertButton: UIButton!
    
    
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
        let dateString = dateFormatter.string(from: forecast.date)
        self.dateLabel.text = dateString
    }
    @IBAction func convertButtonTapped(_ sender: Any) {
    }
    
}
