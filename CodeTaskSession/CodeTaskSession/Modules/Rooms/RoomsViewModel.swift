//
//  RoomsViewModel.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation

protocol RoomsViewModelType {
    var roomsCount: Int {get}
    func fetchRooms(baseUrl: String, path: String)
    func getRoomFor(index: Int)-> Room?
}

class RoomsViewModel: RoomsViewModelType {

    private var rooms:[RoomsResponce] = []
    var roomsCount:Int {
        return rooms.count
    }

    private let serviceManager: Servicable
    private weak var delegate: RoomsViewControllerType?

    init(serviceManager: Servicable = ServiceManager(), delegate:RoomsViewControllerType) {
        self.serviceManager = serviceManager
        self.delegate = delegate
    }


    func fetchRooms(baseUrl: String, path: String) {

        serviceManager.get(baseUrl, path: path, type: RoomsResponce.self) {[weak self] result in

            switch result {
            case .success(let rooms) :
                self?.rooms = rooms
                self?.delegate?.refreshUI()
            case .failure(_) :
                self?.rooms = []
                self?.delegate?.showError()
            }
        }
    }

    func getRoomFor(index: Int) -> Room? {
        guard index < roomsCount && index >= 0 else {
            return nil
        }
        let roomModel = rooms[index]

        return Room(createdAt: roomModel.createdAt, occupiedMessage: roomModel.isOccupied ? "Occupied" : "Not Occupied", maxOccupancy: roomModel.maxOccupancy, id: roomModel.id)
    }
}
