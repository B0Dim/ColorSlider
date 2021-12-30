//
//  MainViewController.swift
//  ColorSlider
//
//  Created by  BoDim on 30.12.2021.
//

import UIKit

protocol ColorSliderViewControllerDelegate {
    func setViewColor(_ color: UIColor)
}

class MainViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.40, green: 0.70, blue: 0.56, alpha: 1)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sliderVC = segue.destination as? ColorSliderViewController else { return }
        sliderVC.delegate = self
        sliderVC.colorFromMain = view.backgroundColor!
    }

}

//MARK: - ColorSliderViewControllerDelegate
extension MainViewController: ColorSliderViewControllerDelegate {
    
    func setViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
}
