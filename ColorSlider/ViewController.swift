//
//  ViewController.swift
//  ColorSlider
//
//  Created by  BoDim on 26.12.2021.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var countRedColor: UILabel!
    @IBOutlet weak var countGreenColor: UILabel!
    @IBOutlet weak var countBlueColor: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeViewColor()
    }
    
    private func changeViewColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1)
    }

    @IBAction func changerRedValue(_ sender: UISlider) {
        countRedColor.text = String(format:"%.2f", sender.value)
        changeViewColor()
    }
    
    @IBAction func changeGreenValue(_ sender: UISlider) {
        countGreenColor.text = String(format:"%.2f", sender.value)
        changeViewColor()
    }
    
    @IBAction func changeBlueValue(_ sender: UISlider) {
        countBlueColor.text = String(format:"%.2f", sender.value)
        changeViewColor()
    }
    
}

