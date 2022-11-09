//
//  ServiceManager.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
class ServiceManager: Servicable {
    func get<T>(_ baseUrl: String, path: String, type: T.Type, completionHandler: @escaping (Result<[T], ServiceError>) -> Void) where T : Decodable {

        // URLSessonDataTask
        let urlSession = URLSession.shared
        guard let url = URL(string:baseUrl.appending(path)) else {
            completionHandler(.failure(ServiceError.requestNotFormatted))
            return
        }
        let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in

            guard let _data = data else {
                completionHandler(.failure(ServiceError.serviceNotAvailable))
                return
            }
            do {
                let users =  try JSONDecoder().decode([T].self, from: _data)
                completionHandler(.success(users))
            }catch {
                completionHandler(.failure(ServiceError.parsingFailed))
            }
        }
        dataTask.resume()
    }

}
