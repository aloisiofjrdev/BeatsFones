//
//   NetworkErrors.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 25/03/22.
//

import Foundation

enum NetworkErrors: Error {
    case invalidURL
    case emptyResponse
    case jsonDecoding(message: String)
}
