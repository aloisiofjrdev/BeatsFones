//
//  NetworkSession.swift
//  BeatsIOS
//
//  Created by Aloisio Formento Junior on 25/03/22.
//

import Foundation

protocol NetworkSession {
    func executeRequest(with url: URL, onComplete: @escaping(Data?, URLResponse?, Error?) -> Void)
}
