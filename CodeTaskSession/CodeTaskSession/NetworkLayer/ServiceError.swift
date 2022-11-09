//
//  ServiceError.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
enum ServiceError: Error {
    case serviceNotAvailable
    case parsingFailed
    case requestNotFormatted
}
