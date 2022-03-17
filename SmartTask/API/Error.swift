//
//  Error.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 17.03.2022.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
