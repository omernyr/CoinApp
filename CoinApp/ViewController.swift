//
//  ViewController.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var coinArray : [Coin] = []
    var coinRates : [Rate]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getCoins()
    }
    
    func getCoins() {
        guard let newURL = URL(string: "https://rest.coinapi.io/v1/exchangerate/TRY?apikey=CED82CB3-FFFA-4C38-90B2-F8AD0F5858FD") else { return }

        WebServiceforNewCoinInfo().getData(url: newURL) { mycoins in
            
            self.coinArray.append(mycoins)
            self.coinRates = mycoins.rates
            
            print(mycoins.asset_id_base)
            print(mycoins.rates)
            
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinRates?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CoinViewCell
        if coinRates?[indexPath.row] != nil {
        
            let rate = coinRates?[indexPath.row]
            
            cell.coinNameLabel.text = rate?.asset_id_quote
            cell.coinValueLabel.text = "\(Double(round((rate?.rate)! * 1000) / 1000))"
            
        }
        
        return cell
    }
}
