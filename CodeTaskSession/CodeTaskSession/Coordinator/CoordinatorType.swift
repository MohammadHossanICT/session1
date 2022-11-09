//
//  CoordinatorType.swift
//  CodePratice
//
//  Created by M A Hossan on 09/11/2022.
//
import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
