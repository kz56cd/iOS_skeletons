//
//  ListViewController.swift
//  skelton
//
//  Created by Masakazu Sano on 2020/05/21.
//  Copyright © 2020 kz56cd. All rights reserved.
//

import UIKit

final class ListViewController: ViewController {
    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
    }
}

// MARK: private
extension ListViewController {
    private enum CellIdentifier: String {
        case listCell
    }

    private enum Segue: String {
        case listDetail
    }

    private func configureView() {
        parent?.title = "List"
    }

    private func configureTableView() {
        tableView.register(
            UINib(nibName: CellIdentifier.listCell.rawValue, bundle: nil),
            forCellReuseIdentifier: CellIdentifier.listCell.rawValue
        )
    }

    private func generateCellTitle(_ indexPath: IndexPath) -> String {
        return "No. \(indexPath.row + 1)"
    }
}

// MARK: private (for segue)
extension ListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segue.listDetail.rawValue {
            guard let viewController = segue.destination as? ListDetailViewController,
                let sender = sender as? String else { return }
            viewController.configure(sender)
        }
    }
}

// MARK: UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ListCell = tableView.dequeueReusableCell(
                withIdentifier: CellIdentifier.listCell.rawValue,
                for: indexPath
            ) as? ListCell else {
            return UITableViewCell()
        }
        cell.configure(generateCellTitle(indexPath))
        return cell
    }
}

// MARK: UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected: \(indexPath.row)")
        performSegue(
            withIdentifier: Segue.listDetail.rawValue,
            sender: generateCellTitle(indexPath)
        )
    }
}
