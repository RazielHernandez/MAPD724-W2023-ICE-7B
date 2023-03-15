//
//  ViewController.swift
//  MAPD724-W2023-ICE-7B
//
//  Created by Raziel Hernandez on 2023-03-15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 2.0) {
            self.myLabel.center.x += self.view.bounds.width
            self.textField.center.x += self.view.bounds.width
            self.imageView.center.x += self.view.bounds.width
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myLabel.center.x -= view.bounds.width
        textField.center.x -= view.bounds.width
        imageView.center.x -= view.bounds.width
    }


}

