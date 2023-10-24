//
//  ViewController.swift
//  CalendarDayFinderApp
//
//  Created by Артур Олехно on 23/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dayTextfield: UITextField!
    @IBOutlet weak var monthTextfield: UITextField!
    @IBOutlet weak var yearTextfield: UITextField!
    @IBOutlet weak var resultTextLabel: UILabel!
    @IBOutlet weak var findButton: UIButton!
    @IBOutlet var textfieldCollection: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func findWeekDay(){
        if let day = Int(dayTextfield.text!), let month = Int(monthTextfield.text!), let year = Int(yearTextfield.text!) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            guard let date = dateFormatter.date(from: "\(day)/\(month)/\(year)") else {
                return resultTextLabel.text = "Wrong input"
            }
            let calendar = Calendar.current
            let dayOfWeek = calendar.dateComponents([.weekday], from: date).weekday
            switch dayOfWeek {
            case 1: resultTextLabel.text = "Sunday"
            case 2: resultTextLabel.text = "Monday"
            case 3: resultTextLabel.text = "Tuesday"
            case 4: resultTextLabel.text = "Wednesday"
            case 5: resultTextLabel.text = "Thursday"
            case 6: resultTextLabel.text = "Friday"
            case 7: resultTextLabel.text = "Saturday"
            case .none:
                resultTextLabel.text = "Wrong input"
            case .some(_):
                resultTextLabel.text = "Wrong input"
            }
            textfieldCollection.forEach { textfield in
                textfield.text = ""
            }
        } else {
            resultTextLabel.text = "Wrong input"
        }
    }
    
    @IBAction func findButtonTapped(_ sender: Any) {
        findWeekDay()
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "info" {
            guard let vc = segue.destination as? InfoViewController else {return}
            if let info = resultTextLabel.text {
                vc.info = "Day of the week is:"
                vc.desc = info
            }
        }
    }
    
    
}

