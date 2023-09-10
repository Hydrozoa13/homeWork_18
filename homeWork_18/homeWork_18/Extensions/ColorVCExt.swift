//
//  ColorVCExt.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 7.09.23.
//

import UIKit

extension ColorViewController: UITextFieldDelegate  {
    
    func setColor() {
        preView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value / 255.0),
            green: CGFloat(greenSlider.value / 255.0),
            blue: CGFloat(blueSlider.value / 255.0),
            alpha: CGFloat(opacitySlider.value / 100)
        )
    }
    
    func hexToRGB() {
        preView.backgroundColor = UIColor(hex: hexColorTF.text ?? "000000")
    }
    
   func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                redTextField.text = String(Int(redSlider.value))
            case greenTextField:
                greenTextField.text = String(Int(greenSlider.value))
            case opacityTF:
                opacityTF.text = String(Int(opacitySlider.value))
            case hexColorTF:
                hexColorTF.text = viewColor.toHexString()
            default:
                blueTextField.text = String(Int(blueSlider.value))
            }
        }
    }
    
    func setSliders() {
        let ciColor = CIColor(color: preView.backgroundColor ?? .black)
        redSlider.value = Float(ciColor.red * 255)
        greenSlider.value = Float(ciColor.green * 255)
        blueSlider.value = Float(ciColor.blue * 255)
        opacitySlider.value = Float(ciColor.alpha * 100)
    }
}

extension ColorViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text,
              let currentValue = Float(text)
        else { return }
        switch textField {
        case redTextField: redSlider.setValue(currentValue, animated: true)
        case greenTextField: greenSlider.setValue(currentValue, animated: true)
        case opacityTF: opacitySlider.setValue(currentValue, animated: true)
        default: blueSlider.setValue(currentValue, animated: true)
        }
        setColor()
        hexColorTF.text = preView.backgroundColor?.toHexString()
    }
}

