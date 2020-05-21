//
//  SettingViewController.swift
//  skelton
//
//  Created by Masakazu Sano on 2020/05/21.
//  Copyright © 2020 kz56cd. All rights reserved.
//

import UIKit

final class SettingViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

extension SettingViewController {
    private func configureView() {
        parent?.title = "Setting"
    }
}

