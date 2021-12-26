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
        // Do any additional setup after loading the view.
    }
    
    private func changeViewColor() {
        
    }

    @IBAction func changerRedValue(_ sender: UISlider) {
    }
    
    @IBAction func changeGreenValue(_ sender: UISlider) {
    }
    
    @IBAction func changeBlueValue(_ sender: UISlider) {
    }
    
}

