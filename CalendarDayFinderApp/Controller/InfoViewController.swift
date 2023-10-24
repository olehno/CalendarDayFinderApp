//
//  InfoViewController.swift
//  CalendarDayFinderApp
//
//  Created by Артур Олехно on 23/10/2023.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var appInfoLabel: UILabel!
    @IBOutlet weak var appDescLabel: UILabel!
    var desc: String?
    var info: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appInfoLabel.text = info
        appDescLabel.text = desc
    }
}
