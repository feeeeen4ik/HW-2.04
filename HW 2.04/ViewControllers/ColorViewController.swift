//
//  ColorViewController.swift
//  HW 2.04
//
//  Created by Феликс Антонович on 15.11.2024.
//

import UIKit

protocol SettingsViewDelegate: AnyObject {
    func applyBackgroundColor(with color: UIColor)
}

final class ColorViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        
        settingsVC?.delegate = self
        settingsVC?.backgroundColor = view.backgroundColor
    }
    
}

// MARK: - Setting View Controller
extension ColorViewController: SettingsViewDelegate {
    func applyBackgroundColor(with color: UIColor) {
        view.backgroundColor = color
    }
}


