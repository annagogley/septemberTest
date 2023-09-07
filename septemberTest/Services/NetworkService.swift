//
//  FactManager.swift
//  septemberTest
//
//  Created by Аня Воронцова on 06.09.2023.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchFact(completion: @escaping (String) -> Void)
    func parseJSON(_ factData: Data) -> String?
    func didFailWithError(error: TestError)
}

class NetworkService: NetworkServiceProtocol {
    
    let ninjaURL = "https://api.api-ninjas.com/v1/facts?limit=1"
    
    func fetchFact(completion: @escaping (String) -> Void) {
        if let url = URL(string: ninjaURL) {
            let session = URLSession(configuration: .default)
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("4f1diDSDQoW69vyBSZwxsA==lwdDHM2tvO6l6OMk", forHTTPHeaderField: "X-Api-Key")
            let task = session.dataTask(with: request) { (data, response, error) in
                guard let data = data, error == nil else {
                    self.didFailWithError(error: .networkError)
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    print("Invalid response")
                    return
                }
                let statusCode = httpResponse.statusCode
                if 200 ... 299 ~= statusCode {
                    if let fact = self.parseJSON(data) {
                        UserDefaults.standard.set(fact, forKey: "lastFact")
                        DispatchQueue.main.async {
                            completion(fact)
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        completion("Oops! Internal server error. Please try again")
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ factData: Data) -> String? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([FactModel].self, from: factData)
            let fact = decodedData[0].fact
            return fact
        }
        catch {
            didFailWithError(error: .generalError)
            return nil
        }
    }
    
    func didFailWithError(error: TestError) {
        switch error {
        case .generalError:
            print("general error: \(error.localizedDescription)")
        case .networkError:
            print("check your internet connection")
        }
    }
}

