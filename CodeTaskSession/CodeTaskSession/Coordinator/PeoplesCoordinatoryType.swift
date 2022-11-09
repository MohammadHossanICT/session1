//
//  PeoplesCoordinatoryType.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//

import Foundation
import UIKit

protocol PeoplesCoordinatoryType: AnyObject {
    func navigatToPeopleDetails(people: People)
}

class PeoplesCoordinator: CoordinatorType, PeoplesCoordinatoryType {
    var navController: UINavigationController

    init(navBarController: UINavigationController) {
        self.navController = navBarController
    }

    func start() {

        let sb = UIStoryboard(name: "Main", bundle:nil)

        if  let peopleVC = sb.instantiateViewController(withIdentifier:"StaffViewer") as? PeoplesViewController {

            peopleVC.peopleViewModel  =     PeoplesViewModel( delegate:peopleVC)

            peopleVC.coordinator = self

            navController.pushViewController(peopleVC, animated: false)

            let peoplesTab = UITabBarItem(title: "People", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))

            navController.tabBarItem = peoplesTab
        }
    }

    func navigatToPeopleDetails(people: People) {

        let sb = UIStoryboard(name: "Main", bundle:nil)
        if  let peopleDetailsVC = sb.instantiateViewController(withIdentifier:"PeoplesDetailsViewController") as? PeopleDetailsViewController {

            peopleDetailsVC.viewModel  = PeopleDetailsViewModel(people: people)

            navController.pushViewController(peopleDetailsVC, animated: false)
        }
    }
}

