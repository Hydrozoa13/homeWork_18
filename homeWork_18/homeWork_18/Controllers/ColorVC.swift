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
    @IBOutlet weak var errorLbl: UILabel!
    
    var delegate: ColorViewControllerDelegate?
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        delegate?.setColor(preView.backgroundColor ?? .white)
        navigationController?.popViewController(animated: true)
    }
    
    private func setupUI() {
        preView.layer.cornerRadius = 20
        preView.backgroundColor = viewColor
        errorLbl.isHidden = true
        navigationItem.hidesBackButton = true
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        setSliders()
        setValue(for: redTextField, greenTextField, blueTextField)
    }
}