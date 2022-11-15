//
//  NetworkApi.swift
//  lesson4412
//
//  Created by ake11a on 2022-11-09.
//

import Foundation

class NetworkApi {
    func getBeerList(completion: @escaping ([Beer]) -> ())  {
        let url = URL(string: "https://api.punkapi.com/v2/beers")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            DispatchQueue.main.async{
                guard let data = data,
                      let response = try? JSONDecoder().decode([Beer].self, from: data) else {
                    completion([])
                    return
                }
                completion(response)
            }
        }
        task.resume()
    }
}
