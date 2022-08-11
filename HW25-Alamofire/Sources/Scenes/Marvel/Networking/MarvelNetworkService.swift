//
//  MarvelNetworkService.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 08.08.2022.
//

import Foundation
import Alamofire

class MarvelNetworkService {

    private let defaultParameters: [String: String] = [
        "ts": NetworkConstants.timeStamp,
        "apikey": NetworkConstants.marvelPublicKey,
        "hash": NetworkConstants.hashValue
    ]

    func fetchComics(parameters: [String: String]?, completion: @escaping (MarvelResponse?, _ error: String?) -> Void) {

        var newParameters = defaultParameters

        if let parameters = parameters {
            for (key, value) in parameters {
                newParameters[key] = value
            }
        }

        AF.request(NetworkConstants.url, parameters: newParameters)
            .validate()
            .responseDecodable(of: MarvelResponse.self) { (response) in
                if let error = response.error {
                    completion(nil, error.localizedDescription)
                }

                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    print("Marvel Api Server status -  \(statusCode)")
                } else if let statusCode = response.response?.statusCode {
                    completion(nil, String(statusCode))
                    return
                }

                guard let data = response.value else {
                    completion(nil, "No data")
                    return
                }

                completion(data, nil)
            }
    }
}

//MARK: - NetworkConstants -

extension MarvelNetworkService {
    enum NetworkConstants {
        static let url = "https://gateway.marvel.com/v1/public/comics"
        static let timeStamp = "10"
        static let marvelPublicKey = "906046b905010b1bbace45bd564eb16f"
        static let marvelPrivateKey = "f61464d42bcf93c72fbee37931962574fefb2147"
        static let hashValue = (timeStamp +
                                marvelPrivateKey +
                                marvelPublicKey).getMdFive()
    }
}
