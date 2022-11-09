//
//  RoomsTableViewCell.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import UIKit

class RoomsTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var occupiedLabel: UILabel!
    @IBOutlet weak var maxOccupancyLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!

    override func prepareForReuse() {
        idLabel.text = ""
        occupiedLabel.text = ""
        maxOccupancyLabel.text = ""
        createdAtLabel.text = ""
    }

    func setData(room: Room) {
        idLabel.text = room.id
        occupiedLabel.text = room.occupiedMessage
        maxOccupancyLabel.text = "\(room.maxOccupancy)"
        createdAtLabel.text = room.createdAt
    }
}

