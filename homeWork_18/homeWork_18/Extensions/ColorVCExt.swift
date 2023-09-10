//
//  ColorVCExt.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 7.09.23.
//

import UIKit

extension ColorViewController: UITextFieldDelegate  {
    
    func setColor() {
        RGBView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value / 255.0),
            green: CGFloat(greenSlider.value / 255.0),
            blue: CGFloat(blueSlider.value / 255.0),
            alpha: 1
        )
    }
    
   func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = String(Int(redSlider.value))
            case greenTextField:
                greenTextField.text = String(Int(greenSlider.value))
            default:
                blueTextField.text = String(Int(blueSlider.value))
            }
        }
    }
    
    func setSliders() {
        let ciColor = CIColor(color: viewColor)
        redSlider.value = Float(ciColor.red * 255.0)
        greenSlider.value = Float(ciColor.green * 255.0)
        blueSlider.value = Float(ciColor.blue * 255.0)
    }
}

extension ColorViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if let currentValue = Float(text) {
            switch textField {
            case redTextField:
                redSlider.setValue(currentValue, animated: true)
            case greenTextField:
                greenSlider.setValue(currentValue, animated: true)
            default:
                blueSlider.setValue(currentValue, animated: true)
            }
        setColor()
        return
        }
    }
}

