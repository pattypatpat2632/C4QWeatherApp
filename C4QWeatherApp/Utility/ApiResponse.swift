//
//  ApiResponse.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import Foundation

enum ApiResponse {
    case failure(String)
    case forecastsRetrieved([Forecast])
}
