//
//  SecondVC.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 6.09.23.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet var RGBView: UIView!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: ColorViewControllerDelegate?
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RGBView.layer.cornerRadius = 20
        RGBView.backgroundColor = viewColor
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        setSliders()
        setValue(for: redTextField, greenTextField, blueTextField)
    }

    @IBAction func rgbSliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider: setValue(for: redTextField)
        case greenSlider: setValue(for: greenTextField)
        default: setValue(for: blueTextField)
        }
        setColor()
    }
    
    @IBAction func doneButtonTapped() {
        delegate?.setColor(RGBView.backgroundColor ?? .white)
        navigationController?.popViewController(animated: true)
    }
}
