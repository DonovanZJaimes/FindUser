//
//  NetworkError.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

enum NetworkError: String, Error{
    case generic
    case jsonDecoder
}


extension NetworkError : LocalizedError{
    public var errorDescription: String?{
        switch self{
        case .generic:
            return NSLocalizedString("La app falló por un error desconocido", comment: "")
        case .jsonDecoder:
            return NSLocalizedString("Falló cuando leyó el JSON y no pudo decodificar.", comment: "")
        }
    }
}
