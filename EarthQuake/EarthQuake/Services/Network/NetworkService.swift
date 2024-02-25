//
//  Network.swift
//  EarthQuake
//
//  Created by Шермат Эшеров on 9/2/24.
//

import Foundation


final class NetworkService<Endpoint: EndpointProtocol> {
    
    
    // MARK: Request
    func request<Response>(enpoint: Endpoint,
                           completion: @escaping(NetworkResult<Response>) -> Void) where Response: Decodable {
        
        let url = URLComponents(string: enpoint.baseURL + enpoint.path)
        guard let resultURL = url?.url else { return }
        let request = URLRequest(url: resultURL)
        
        URLSession.shared.dataTask(with: request) { data, response , error in
            
            let result: NetworkResult<Response>
            
            guard response != nil else {
                result = NetworkResult.failure(APIError.noNetwork)
                return
            }
            
            guard let data = data else { 
                print("error data")
                return }
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            do {
                let object = try JSONDecoder().decode(Response.self, from: data)
                result = NetworkResult.success(object)
            } catch let error {
                result = NetworkResult.failure(.decodingError)
            }
        }.resume()
    }
}
