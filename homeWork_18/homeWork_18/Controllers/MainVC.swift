//
//  FirstVC.swift
//  homeWork_18
//
//  Created by Евгений Лойко on 6.09.23.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func changeBGAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ColorViewController") as? ColorViewController else {return}
        vc.viewColor = view.backgroundColor
        vc.delegate = self
        vc.completionHandler = { [weak self] color in
            self?.view.backgroundColor = color
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
