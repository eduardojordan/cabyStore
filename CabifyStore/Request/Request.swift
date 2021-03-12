//
//  Request.swift
//  CabifyStore
//
//  Created by Eduardo Jordan on 12/3/21.
//

import Foundation


class Request {
    
    static let shared = Request()
    
    private let baseURL = "https://gist.githubusercontent.com/palcalde/6c19259bd32dd6aafa327fa557859c2f/raw/ba51779474a150ee4367cda4f4ffacdcca479887/Products.json"
    
    private var products: Products?
    
    func getRequest(completion: @escaping(Products) -> ()){
        
        let url = baseURL
        let session = URLSession.shared
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = "GET"
        
        session.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil, let  response = response as? HTTPURLResponse
            else{
                print("An error has occurred")
                return
            }
            if response.statusCode == 200{
                do {
                    let decoder = JSONDecoder()
                    self.products = try decoder.decode(Products.self, from: data)
                    completion(self.products!)
                } catch  {
                    print("Error. \(error)")
                }
            } else {
                print("Error in Server \(response.statusCode)")
            }
        }.resume()
    }
    
}
