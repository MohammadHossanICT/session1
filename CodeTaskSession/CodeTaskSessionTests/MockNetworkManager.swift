//
//  MockNetworkManager.swift
//  CodeTaskSessionTests
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
@testable import CodeTaskSession

class MockNetworkManager: Servicable {
    func get<T>(_ baseUrl: String, path: String, type: T.Type, completionHandler: @escaping (Result<[T], ServiceError>) -> Void) where T : Decodable {


        let bundle = Bundle(for:MockNetworkManager.self)

        guard let url = bundle.url(forResource:path, withExtension:"json"),
              let data = try? Data(contentsOf: url) else {
                  completionHandler(.failure(ServiceError.serviceNotAvailable))

                  return
              }

        do {
            let decodedResopnce = try JSONDecoder().decode([T].self, from: data)
            completionHandler(.success(decodedResopnce))

        }catch {
            completionHandler(.failure(ServiceError.parsingFailed))
        }

    }
}


