//
//  ViewController.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class ForecastController: UITableViewController {
    
    var forecasts = [Forecast]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient.sharedInstance.getForecast { (response) in
            print("API response received")
            switch response {
            case .failure(let failString):
                print(failString)
            case .forecastsRetrieved(let forecasts):
                forecasts.forEach{print($0.maxTempF)}
                self.forecasts = forecasts
            }
        }
    }
}

extension ForecastController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return forecasts.count
    }
    
   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! ForecastCell
        cell.set(forecast: forecasts[indexPath.row])
        return cell
    }
}

