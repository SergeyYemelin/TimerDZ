//
//  ViewController.swift
//  TimerHW
//
//  Created by Сергей Емелин on 18.11.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker1: UIDatePicker!
    
    @IBOutlet weak var datePicker2: UIDatePicker!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {
                
                vc.date1 = datePicker1.date
                vc.date2 = datePicker2.date
            }
        }
    }

}

