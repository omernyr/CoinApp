//
//  WebService.swift
//  CoinApp
//
//  Created by macbook pro on 25.01.2023.
//

import Foundation


class WebServiceforCoinInfo {
    
    func getData(url: URL, completion: @escaping ([Coins]) -> Void) {
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let coinsArray = try JSONDecoder().decode([Coins].self, from: data)
                    completion(coinsArray)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}

// MARK: for icon
class WebServiceforCoinIcon {
    
    func getData(url: URL, completion: @escaping ([CoinIcon]) -> Void) {
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            if let data = data {
                do {
                    let coinIconsArray = try JSONDecoder().decode([CoinIcon].self, from: data)
                    completion(coinIconsArray)
                } catch {
                    print(error)
                }
                
            }
        }.resume()

    }
}

class WebServiceforNewCoinInfo {
    
//    func getLastCoins() {
//        guard let url = URL(string: "https://rest.coinapi.io/v1/exchangerate/TRY?apikey=E361CADD-258E-4ACE-B955-5A1E6F6F7EC9") else { return }
//
//        let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                print(error)
//            }
//            guard let jsonData = data else { return }
//
//            let decoder = JSONDecoder()
//            do {
//                let decodedData = try decoder.decode(Coin.self, from: jsonData)
//                print(decodedData)
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
//        dataTask.resume()
//    }
    
    func getData(url: URL, completion: @escaping (Coin) -> Void) {

        let request = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, error in

            if let error = error {
                print("Error 1 : \(error.localizedDescription)")
                return
            }

            guard let jsonData = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(Coin.self, from: jsonData)
                completion(decodedData)
            } catch {
                print("Error 2 : \(error)")
            }
        }
        dataTask.resume()
   }
  
}
