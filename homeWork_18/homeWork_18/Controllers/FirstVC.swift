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
        navigationController?.pushViewController(vc, animated: true)
        vc.delegate = self
        vc.viewColor = view.backgroundColor
    }
}
