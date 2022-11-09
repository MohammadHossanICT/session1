//
//  RoomsCoordinator.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
import UIKit

class RoomsCoordinator: CoordinatorType {
    var navController: UINavigationController

    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }


    func start() {

        let sb = UIStoryboard(name: "Main", bundle:nil)

        let roomsVC = sb.instantiateViewController(withIdentifier:"RoomsViewer")

        navController.pushViewController(roomsVC, animated: false)

        let roomsTab = UITabBarItem(title: "Rooms", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))

        navController.tabBarItem = roomsTab

    }

}

