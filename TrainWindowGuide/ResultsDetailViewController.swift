//
//  ResultsDetailViewController.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/05/24.
//

import UIKit

class ResultsDetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var railsLabel: UILabel!
    @IBOutlet var stationLabel: UILabel!
    @IBOutlet var explanationLabel: UILabel!
    
//    var pinTitle: String = ""
//    var pinRails: String = ""
//    var pinStation: String = ""
//    var pinExplanation: String = ""
    var pinData: PinData!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = pinData.title
        railsLabel.text = pinData.rail
//
//        stationLabel.text = pinStation
//        explanationLabel.text = pinExplanation
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
