//
//  SecondViewController.swift
//  TimerHW
//
//  Created by Сергей Емелин on 18.11.2024.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelDate1: UILabel!
    @IBOutlet weak var labelDate2: UILabel!
    @IBOutlet weak var labelDateTimer: UILabel!
  
    var date1: Date?
    var date2: Date?
    
    var timer = Timer()
    
    var timerRunning = false
    
    var savedDate: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        savedDate = date1
        labelDate1.text = dateToString(date: date1!)
        labelDate2.text = dateToString(date: date2!)
        labelDateTimer.text = dateToString(date: date1!)
        // Do any additional setup after loading the view.
    }
  
    func dateToString( date: Date ) -> String {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy, EEE HH:mm"
        return formatter.string(from: date)
        
        }
    
    @objc func updateTimer() {
        
        let firstDate = date1!
        let secondDate = date2!
        
        if firstDate > secondDate {
            timer.invalidate()
        } else {
            if let updateDate = Calendar.current.date(byAdding: .hour, value: 1, to: date1!) {
                date1 = updateDate
                labelDateTimer.text = dateToString(date: updateDate)
                
            }
        }
    }
        
    
    @IBAction func starTimer(_ sender: Any) {
        if timerRunning {
            return
        } else {
            timerRunning = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stopTimer(_ sender: Any) {
        timer.invalidate()
        timerRunning = false
    }
    
    @IBAction func restartTimer(_ sender: Any) {
        timer.invalidate()
        timerRunning = false
        
        labelDateTimer.text = dateToString(date: savedDate!)
    }
    
}
