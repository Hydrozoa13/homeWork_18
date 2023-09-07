//
//  MainVCExt.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 7.09.23.
//

import UIKit

extension MainViewController: ColorViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
