//
//  URLSession.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 25/03/22.
//

import Foundation

extension URLSession: NetworkSession {
    
    func executeRequest(with url: URL, onComplete: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let task = dataTask(with: url) { data, response, error in
            onComplete(data, response, error)
        }
        task.resume()
    }
}
