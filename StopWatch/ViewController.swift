//
//  ViewController.swift
//  StopWatch
//
//  Created by 山尾かな on 2022/08/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteiLabel: UILabel!
    var count: Float = 0.0
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        hanteiLabel.text = String("")
    }
    @IBAction func start(){
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.up), userInfo: nil, repeats: true)
        }
    }
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            self.hantei()
        }
    }
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    @IBAction func Reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.00
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = String("")
    }
    @objc func hantei(){
        if count <= 10.20 && count >= 9.80{
            hanteiLabel.text = String("PARFECT!")
        }else if count <= 10.30 && count >= 9.70{
            hanteiLabel.text = String("GRATE")
        }else if count <= 10.50 && count >= 9.50{
            hanteiLabel.text = String("GOOD")
        }else{
            hanteiLabel.text = String("BAD")
        }
    }
}

