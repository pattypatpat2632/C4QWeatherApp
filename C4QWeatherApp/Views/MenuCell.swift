//
//  MenuCell.swift
//  C4QWeatherApp
//
//  Created by Patrick O'Leary on 10/6/17.
//  Copyright © 2017 Patrick O'Leary. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    weak var delegate: MenuCellDelegate?

    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            delegate?.toFarenheit()
        } else {
            delegate?.toCelcius()
        }
    }
    

}

protocol MenuCellDelegate: class {
    func toCelcius()
    func toFarenheit()
}
