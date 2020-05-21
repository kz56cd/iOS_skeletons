//
//  CountViewController.swift
//  skelton
//
//  Created by Masakazu Sano on 2020/05/21.
//  Copyright © 2020 kz56cd. All rights reserved.
//

import UIKit

final class CountViewController: ViewController {
    @IBOutlet private weak var countLabel: UILabel!
    @IBOutlet private weak var statusLabel: UILabel!
    
    private var count: Int = 0 {
        didSet {
            updateCounter()
        }
    }
    
    private var status: CounterStatus = .none {
        didSet {
            updateStatus()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}

// MARK: action
extension CountViewController {
    @IBAction func tapAddButton(_ sender: UIButton) {
        count += 1
        status = .add
    }
    
    @IBAction func tapSubButton(_ sender: Any) {
        guard count - 1 >= 0 else {
            status = .cannot
            return
        }
        count -= 1
        status = .sub
    }
    
    @IBAction func tapClearButton(_ sender: Any) {
        count = 0
        status = .clear
    }
}

// MARK: private
extension CountViewController {
    private enum CounterStatus: String {
        case add = "add 1."
        case sub = "sub 1."
        case clear = "clear counter."
        case cannot = "cannot action."
        case none = "(none)"
        
        var string: String {
            return self.rawValue
        }
        
        var color: UIColor {
            switch self {
            case .cannot:
                return .red
            default:
                return .darkGray
            }
        }
    }
    
    private func configureView() {
        parent?.title = "Count"
        updateCounter()
        updateStatus()
    }
    
    private func updateCounter() {
        countLabel.text = "\(count)"
    }
    
    private func updateStatus() {
        statusLabel.text = status.string
        statusLabel.textColor = status.color
    }
}
