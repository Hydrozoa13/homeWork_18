//
//  SecondVC.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 6.09.23.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var preView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var opacityTF: UITextField!
    @IBOutlet weak var hexColorTF: UITextField!
    
    var delegate: ColorViewControllerDelegate?
    var viewColor: UIColor!
    var completionHandler: ((UIColor) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    @IBAction func rgbSliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider: setValue(for: redTextField)
        case greenSlider: setValue(for: greenTextField)
        case opacitySlider: setValue(for: opacityTF)
        default: setValue(for: blueTextField)
        }
        setColor()
        hexColorTF.text = preView.backgroundColor?.toHexString()
    }
    
    @IBAction func hexTFAction(_ sender: UITextField) {
        hexToRGB()
        setSliders()
        setValue(for: redTextField, greenTextField,
                 blueTextField, opacityTF)
    }
   
    @IBAction func saveWithDelegateBtnAction() {
        delegate?.setColor(preView.backgroundColor ?? .white)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func saveWithClosureBtnAction(_ sender: UIButton) {
        let updatedBG = preView.backgroundColor
        completionHandler?(updatedBG ?? .black)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        preView.layer.cornerRadius = 20
        preView.backgroundColor = viewColor
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        opacityTF.delegate = self
        hexColorTF.delegate = self
        setSliders()
        setValue(for: redTextField, greenTextField,
                 blueTextField, opacityTF, hexColorTF)
    }
}
