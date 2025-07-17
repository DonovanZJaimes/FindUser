//
//  UtilsJson.swift
//  FindUser
//
//  Created by Donovan Z. Jaimes on 16/07/25.
//

import Foundation

//Protocol for JSON parser
protocol JsonParserProtocol {
    func parseJson<T: Decodable>(jsonName: String, model: T.Type) -> T?
}


//Concrete implementation of the JsonParserProtocol
class UtilsJson: JsonParserProtocol{
    
    func parseJson<T: Decodable>(jsonName : String, model: T.Type) -> T?{
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            return nil
        }
        do{
            let data = try Data(contentsOf: url)
            
            let jsonDecoder = JSONDecoder()
            do{
                let responseModel = try jsonDecoder.decode(T.self, from: data)
                return responseModel
            }catch{
                print("json mock error: \(error)")
                return nil
            }
        }catch{
            return nil
        }
    }
}





