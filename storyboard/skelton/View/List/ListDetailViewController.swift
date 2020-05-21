//
//  ListDetailViewController.swift
//  skelton
//
//  Created by Masakazu Sano on 2020/05/21.
//  Copyright © 2020 kz56cd. All rights reserved.
//

import UIKit

protocol ListDetailViewControllerInput {
    func configure(_ title: String)
}

final class ListDetailViewController: ViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    private var titleString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleString
    }
}

extension ListDetailViewController: ListDetailViewControllerInput {
    func configure(_ title: String) {
        titleString = title
    }
}
