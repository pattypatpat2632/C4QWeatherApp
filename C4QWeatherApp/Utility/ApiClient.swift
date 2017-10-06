//
//  ApiClient.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

final class ApiClient {
    
    static let sharedInstance = ApiClient()
    
    private init() {}
    
    func getForecast(completion: @escaping (ApiResponse) -> Void) {
        let urlString = "https://api.aerisapi.com/forecasts/11101?client_id=\(Client.id)&client_secret=\(Client.secret)"
        guard let url = URL(string: urlString) else {
            completion(.failure("Invalid URL String)"))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        var forecasts = [Forecast]()
        let task = session.dataTask(with: urlRequest) { (data, _, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] ?? [:] //TODO: refactor to failed completion
                    guard let responses = json["response"] as? [[String: Any]] else {
                        completion(.failure("response key not found in JSON"))
                        return
                    }
                    for response in responses {
                        guard let periods = response["periods"] as? [[String: Any]] else {
                            completion(.failure("periods key not found in JSON"))
                            return
                        }
                        for period in periods {
                            print("FOUND FORECAST PERIOD")
                            if let newForecast = Forecast(dictionary: period) {
                                forecasts.append(newForecast)
                                print("new forecast received from API: \(newForecast.date)")
                            }
                        }
                        completion(.forecastsRetrieved(forecasts))
                    }
                } catch {
                    completion(.failure(error.localizedDescription))
                }
            }
        }
        task.resume()
    }
    
    
    
    
    
}
