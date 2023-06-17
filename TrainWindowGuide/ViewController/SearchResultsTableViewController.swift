//
//  SearchResultsTableViewController.swift
//  TrainWindowGuide
//
//  Created by Kana Fujitani on 2023/06/16.
//

import UIKit

class SearchResultsTableViewController: UIViewController {
    
    var pinDatas: [PinData] = []
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "SearchResultsTableViewCell", bundle: nil), forCellReuseIdentifier: "ResultsCell")
        tableView.dataSource = self
        // print(pinDatas)
        // Do any additional setup after loading the view.
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

extension SearchResultsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pinDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as! SearchResultsTableViewCell
                return cell
    }
    
    
}
