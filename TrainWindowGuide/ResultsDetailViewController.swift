//
//  ResultsDetailViewController.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/05/24.
//

import UIKit

class ResultsDetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var railLabel: UILabel!
    @IBOutlet var stationLabel: UILabel!
    @IBOutlet var explanationLabel: UILabel!
    
    var pinData: PinData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = pinData.title
        railLabel.text = pinData.rail
        stationLabel.text = pinData.station
        explanationLabel.text = pinData.explanation
    }

}
