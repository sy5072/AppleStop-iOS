//
//  APICaller.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/12.
//

import Foundation


struct Constants {
    static let API_KEY = "e64db529059a477e8211"
    static let baseURL = "https://openapi.foodsafetykorea.go.kr/api"

}
enum APIError : Error{
    case failedTogetData
}


class APICaller {
    static let shared = APICaller()

    func getProductName(barcode : String,completion : @escaping (Result<Product,Error>) -> Void ){
        guard let url = URL(string: "\(Constants.baseURL)/\(Constants.API_KEY)/C005/json/1/100/BAR_CD=\(barcode)") else {return}
         let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            do {
                let result = try JSONDecoder().decode(ProductResponse.self, from: data)
                completion(.success(result.C005.row[0]))
                                	
            }catch{
                completion(.failure(APIError.failedTogetData))
            }
        }

        task.resume()
    }
}
