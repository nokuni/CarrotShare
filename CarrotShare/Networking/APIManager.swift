//
//  APIManager.swift
//  CarrotShare
//
//  Created by Jonathan Duong on 02/12/2022.
//

import Foundation

class APIManager {
    
    enum APIError: String {
        case badURL = "The URL for the request is wrong"
        case badResponse = "Server ERROR"
        case noData = "No DATA"
    }
    
    func getRequest<M: Codable>(url: String, cachePolicy: URLRequest.CachePolicy, model: M.Type) async throws -> M {
        guard let url = URL(string: url)
        else {
            throw APIError.badURL.rawValue
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
        urlRequest.httpMethod = "GET"
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard (response as? HTTPURLResponse)?.statusCode == 200
            else {
                throw APIError.badResponse.rawValue
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let result = try decoder.decode(M.self, from: data)
            print(result)
            return result
        } catch {
            throw APIError.noData.rawValue
        }
    }
    
    func postRequest<M: Codable>(url: String, cachePolicy: URLRequest.CachePolicy, model: M.Type, body: [String: Any]) async throws -> M {
        guard let url = URL(string: url)
        else {
            throw APIError.badURL.rawValue
        }
        
        var urlRequest = URLRequest(url: url, cachePolicy: cachePolicy)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let result = try decoder.decode(M.self, from: data)
        print(result)
        return result
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
