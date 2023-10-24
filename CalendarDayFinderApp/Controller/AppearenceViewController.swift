//
//  AppearenceViewController.swift
//  CalendarDayFinderApp
//
//  Created by Артур Олехно on 23/10/2023.
//

import UIKit

class AppearenceViewController: UIViewController {
    
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()
    }
    
    @IBAction func closeItemTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func openSettings(_ sender: Any) {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            UIApplication.shared.open(url)
        }
    }
    
    func setLabelText() {
        let labelText = "Unable to  spetify UI style"
        textLabel.text = labelText
    }
}

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        switch traitCollection.userInterfaceStyle {
        case .light:
            textLabel.text = "Light Mode is On"
        case .dark:
            textLabel.text = "Dark Mode is On"
        case .unspecified:
            setLabelText()
        @unknown default:
            break
        }
    }
}
