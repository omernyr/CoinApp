//
//  ViewController.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var coinArray : [Coins] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        getCoins()
    }
    
    func getCoins() {
        let urlforCoins = URL(string: "https://rest-sandbox.coinapi.io/v1/assets?apikey=E361CADD-258E-4ACE-B955-5A1E6F6F7EC9&invert=true")!
        let urlforIcons = URL(string: "https://rest.coinapi.io/v1/assets/icons/32?apikey=E361CADD-258E-4ACE-B955-5A1E6F6F7EC9")!
        
        WebServiceforCoinInfo().getData(url: urlforCoins) { coins in
            
            self.coinArray = coins
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(coins)
        }
        
//        MARK: for coinLabel Double
//        let five = 5.435324039
//        let siz = Double(round(1000 * five) / 1000)
//        print(siz)
        
//        WebServiceforCoinIcon().getData(url: urlforIcons) { coinIcon in
//            print(coinIcon)
//        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinArray.count == nil ? 0 : self.coinArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CoinViewCell
        cell.coinNameLabel.text = coinArray[indexPath.row].asset_id
        
        if coinArray[indexPath.row].price_usd != nil {

            if let value = coinArray[indexPath.row].price_usd {
            
                cell.coinValueLabel.text = "\(Double(round(1000 * value) / 1000))"
                
            }
            
        }
        
        
//        coinArrayi bir değişkene atayıp if let kullanabilirsin.
//        Örnegin:
//        var coin = gelen veri
//        İf let coin = coin{
//          cell.coinValueLabel.text = coin
//        }
        
        
        return cell
    }
}
