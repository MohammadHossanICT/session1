//
//  PeoplesViewController.swift
//  CodeTaskSession
//
//  Created by M A Hossan on 09/11/2022.
//

import UIKit

protocol PeoplesViewable: AnyObject {
    func refreshUI()
    func showError()
}

class PeoplesViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!

    var peopleViewModel:PeopleViewModelType!
    weak var coordinator: PeoplesCoordinatoryType!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()

        peopleViewModel.fetchPeoples(baseUrl: EndPoint.baseUrl, path: Path.people)
    }
}

extension PeoplesViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleViewModel.peoplessCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PeopleTableViewCell else{return UITableViewCell()}

        if let people = peopleViewModel.getPeopleDetailFor(index: indexPath.row) {
            cell.setData(staff: people)
        }
        return cell
    }

}

extension PeoplesViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let staff = peopleViewModel.getPeopleDetailFor(index: indexPath.row) {
            coordinator.navigatToPeopleDetails(people: staff)
        }
    }
}



extension PeoplesViewController: PeoplesViewable {
    func refreshUI() {
        DispatchQueue.main.async {
            self.tableView.isHidden = false
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }

    func showError() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
    }
}


