//
//  ColorSliderViewController.swift
//  ColorSlider
//
//  Created by  BoDim on 26.12.2021.
//

import UIKit

class ColorSliderViewController: UIViewController {

    @IBOutlet weak var viewColor: UIView!
      
    @IBOutlet weak var countRedColor: UILabel!
    @IBOutlet weak var countGreenColor: UILabel!
    @IBOutlet weak var countBlueColor: UILabel!
    
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    
    @IBOutlet weak var textRed: UITextField!
    @IBOutlet weak var textGreen: UITextField!
    @IBOutlet weak var textBlue: UITextField!
    
    var delegate: ColorSliderViewControllerDelegate!
    var colorFromMain: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSliderColor()
        changeViewColor()
        forEachElementsSetValue()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }

    @IBAction func changeSliderValue(_ sender: UISlider) {
        changeViewColor()
        setElementValue(slider: sender)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        view.endEditing(true)
        delegate.setViewColor(viewColor.backgroundColor ?? .green)
        dismiss(animated: true)
    }
    
}

//MARK: - Provate Methods
extension ColorSliderViewController {
    
    
    private func setSliderColor() {
        let ciColor = CIColor(color: colorFromMain)
        
        sliderRed.value = Float(ciColor.red)
        sliderGreen.value = Float(ciColor.green)
        sliderBlue.value = Float(ciColor.blue)
    }
      
    private func changeViewColor() {
        viewColor.backgroundColor = UIColor(
            red: CGFloat(sliderRed.value),
            green: CGFloat(sliderGreen.value),
            blue: CGFloat(sliderBlue.value),
            alpha: 1
        )
    }
    
    private func forEachElementsSetValue() {
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            setElementValue(slider: slider)
        }
    }
    
    private func setElementValue(slider: UISlider!) {
        switch slider {
        case sliderRed:
            setValueLabel(for: countRedColor, with: sliderRed.value)
            setValueText(for: textRed, with: sliderRed.value)
        case sliderGreen:
            setValueLabel(for: countGreenColor, with: sliderGreen.value)
            setValueText(for: textGreen, with: sliderGreen.value)
        default:
            setValueLabel(for: countBlueColor, with: sliderBlue.value)
            setValueText(for: textBlue, with: sliderBlue.value)
        }
    }
    
    private func setValueLabel(for label: UILabel, with color: Float) {
        label.text = getColorTextFormat(color: color)
    }
    
    private func setValueText(for text: UITextField, with color: Float) {
        text.text = getColorTextFormat(color: color)
    }
    
    private func getColorTextFormat(color: Float) -> String {
        String(format:"%.2f", color)
    }
}

//MARK: - UITextFieldDelegate
extension ColorSliderViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let textValue = Float(text) {
            switch textField {
            case textRed:
                sliderRed.setValue(textValue, animated: true)
                setValueLabel(for: countRedColor, with: textValue)
            case textGreen:
                sliderGreen.setValue(textValue, animated: true)
                setValueLabel(for: countGreenColor, with: textValue)
            default:
                sliderBlue.setValue(textValue, animated: true)
                setValueLabel(for: countBlueColor, with: textValue)
            }
        }

        changeViewColor()
    }
    
}
