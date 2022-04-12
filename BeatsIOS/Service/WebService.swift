//
//  WebService.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 18/03/22.
//
import Foundation

protocol WebServiceProtocol {
    func getFones(completion: @escaping (Result<[FonesModel], NetworkErrors>) -> Void)
}

class WebService: WebServiceProtocol {
    
    private let session: NetworkSession
    private let decoder: JSONDecoder
    
    init(urlSession: NetworkSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder()) {
        self.session = urlSession
        self.decoder = decoder
    }
    
    func getFones(completion: @escaping (Result<[FonesModel], NetworkErrors>) -> Void) {
        guard let url = URL(string: "https://42edf8f6-0a48-4351-a67a-7d0f30a8cb68.mock.pstmn.io/") else {
            completion(.failure(.invalidURL))
            return
        }
        
        session.executeRequest(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            guard let jsonData = data else {
                completion(.failure(.emptyResponse))
                return
            }
            
            do {
                let decoded = try self.decoder.decode([FonesModel].self, from: jsonData)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(.jsonDecoding(message: error.localizedDescription)))
            }
        }
    }
}
    
    
    
    

    
