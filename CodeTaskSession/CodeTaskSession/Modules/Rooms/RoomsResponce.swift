//
//  RoomsResponce.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
struct RoomsResponce: Decodable {
    var createdAt: String
    var isOccupied: Bool
    var maxOccupancy: Int
    var id: String
}

