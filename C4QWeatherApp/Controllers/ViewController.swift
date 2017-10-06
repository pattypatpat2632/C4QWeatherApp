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
    
    var farenheit: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiClient.sharedInstance.getForecast { (response) in
            print("API response received")
            switch response {
            case .failure(let failString):
                print(failString)
            case .forecastsRetrieved(let forecasts):
                forecasts.forEach{print($0.maxTempF)}
                self.forecasts = forecasts.sorted{$0.date < $1.date}
            }
        }
    }
}

extension ForecastController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count + 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row > forecasts.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "forecastCell", for: indexPath) as! ForecastCell
            if farenheit {
                cell.setFarenheit(forecast: forecasts[indexPath.row])
            } else {
                cell.setCelcius(forcast: forecasts[indexPath.row])
            }
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ForecastController: MenuCellDelegate {
    func toCelcius() {
        print("celcius")
        farenheit = false
        tableView.reloadData()
    }
    func toFarenheit() {
        print("farenheit")
        farenheit = true
        tableView.reloadData()
    }
}

