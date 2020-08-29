//
//  PokeFetch.swift
//  PokeAPI
//
//  Created by user179175 on 8/27/20.
//  Copyright © 2020 user179175. All rights reserved.
//

import Foundation

enum FetchBaseResult {
    case success([EntryPoint])
    case failure(Error)
}

enum FetchError: Error {
    case invalidJSON
}

enum FetchPoke{
    case success([PokeEntry])
    case failure(Error)
}

class PokeFetch {
    private static let baseUrlString = "https://pokeapi.co/api/v2/"
    
    private static let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static func fetchBaseUrl(_ dataToGet: String, completion: @escaping (FetchBaseResult) -> Void) {
        let url = URL(string: baseUrlString)!
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            
            if let jsonData = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    print(jsonObject)
                    var entryPoints = [EntryPoint]()
                    guard
                        let jsonDictionary = jsonObject as? [String: String] else {
                            return completion(.failure(FetchError.invalidJSON))
                    }
                    for (title, url) in jsonDictionary {
                        if (title == dataToGet) {
                            let newEntryPoint = EntryPoint(title: title, urlString: url)
                            entryPoints.append(newEntryPoint)
                        }
                        
                    }
                    completion(.success(entryPoints))
                    
                } catch let error {
                    print("Unable to convert into JSON: \(error)")
                }
            } else if let requestError = error {
                print("Error: \(requestError)")
            } else {
                print("error with request")
            }
        }
        task.resume()
    }
    
    static func fetchUrl(_ urlString: String, completion: @escaping (FetchPoke) -> Void) {
        if let url = URL(string: urlString+"?limit=1000") {
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
                
            if let jsonData = data {
                do{
                    let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
//                    print(jsonObject)
                    var pokeEntry = [PokeEntry]()
                    guard
                        let jsonDictionary = jsonObject as? [String: Any] else {
                            print("this place")
                            return completion(.failure(FetchError.invalidJSON))
                        }
                        
                    if let results = jsonDictionary["results"] as? [[String: String]]{
                        for (poks) in results {
                            let newPokeEntry = PokeEntry(name: poks["name"]!, urlString: poks["url"]!)
                            pokeEntry.append(newPokeEntry)
                        }
                    }
                        completion(.success(pokeEntry))
                        
                    } catch let error {
                        print("Unable to convert into JSON: \(error)")
                    }
                } else if let requestError = error {
                    print("Error: \(requestError)")
                } else {
                    print("error with request")
                }
            }
            task.resume()
        }
    }
    
        static func fetchDetail(_ urlString: String, completion: @escaping (FetchPoke) -> Void) {
            if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let task = session.dataTask(with: request) {
                (data, response, error) -> Void in
                    
                if let jsonData = data {
                    do{
                        let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
    //                    print(jsonObject)
                        var pokeEntry = [PokeEntry]()
                        guard
                            let jsonDictionary = jsonObject as? [String: Any] else {
                                print("this place")
                                return completion(.failure(FetchError.invalidJSON))
                            }
                            
                        if let results = jsonDictionary["results"] as? [[String: String]]{
                            for (poks) in results {
                                let newPokeEntry = PokeEntry(name: poks["name"]!, urlString: poks["url"]!)
                                pokeEntry.append(newPokeEntry)
                            }
                        }
                            completion(.success(pokeEntry))
                            
                        } catch let error {
                            print("Unable to convert into JSON: \(error)")
                        }
                    } else if let requestError = error {
                        print("Error: \(requestError)")
                    } else {
                        print("error with request")
                    }
                }
                task.resume()
            }
        }
    
}
