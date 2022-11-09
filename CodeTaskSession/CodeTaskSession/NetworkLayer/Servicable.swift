//
//  Servicable.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
protocol Servicable {
    func get<T:Decodable>(_ baseUrl:String, path:String, type:T.Type, completionHandler:@escaping(Result<[T],   ServiceError>)->Void)
}
