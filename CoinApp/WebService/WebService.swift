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
