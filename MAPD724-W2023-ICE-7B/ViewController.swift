//
//  ViewController.swift
//  MAPD724-W2023-ICE-7B
//
//  Created by Raziel Hernandez on 2023-03-15.
//

import UIKit
import GLKit

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    private var labelPosition: CGFloat!
    private var textPosition: CGFloat!
    private var imagePosition: CGFloat!
    
    private var labelTransform: CGAffineTransform!
    private var textTransform: CGAffineTransform!
    private var imageTransform: CGAffineTransform!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        labelPosition = myLabel.center.x
        textPosition = textField.center.x
        imagePosition = imageView.center.x
        
        labelTransform = myLabel.transform
        textTransform = textField.transform
        imageTransform = imageView.transform
    }
    
    func resetOutlets() {
        myLabel.center.x -= view.bounds.width
        textField.center.x -= view.bounds.width
        imageView.center.x -= view.bounds.width
    }
    
    

    @IBAction func animation1_pressed(_ sender: UIButton) {
        resetOutlets()
        UIView.animate(withDuration: 2.0) {
            self.myLabel.center.x += self.view.bounds.width
            self.textField.center.x += self.view.bounds.width
            self.imageView.center.x += self.view.bounds.width
        }
    }
    
    @IBAction func animation2_pressed(_ sender: UIButton) {
        resetOutlets()
        UIView.animate(withDuration: 3.4, delay: 1.3, options:
        [.repeat, .autoreverse], animations: {
            print(self.labelPosition ?? "0")
            self.myLabel.center.x += self.view.bounds.width
            self.textField.center.x += self.view.bounds.width
            self.imageView.center.x += self.view.bounds.width
        }, completion: nil)
    }
    
    @IBAction func animation3_pressed(_ sender: UIButton) {
        
        resetOutlets()
        UIView.animate(withDuration: 2.0, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: [.repeat, .autoreverse], animations: {
            self.myLabel.center.x += self.view.bounds.width
            self.textField.center.x += self.view.bounds.width
            self.imageView.center.x += self.view.bounds.width
        }, completion: nil)
    }
    
    
    @IBAction func animation4_pressed(_ sender: UIButton) {
        let rotateMe = GLKMathDegreesToRadians(45)
          
          UIView.animate(withDuration: 3.4, delay: 2.3,
          options: [.repeat, .autoreverse], animations: {
           self.myLabel.transform = CGAffineTransform(rotationAngle: CGFloat(rotateMe))
          }, completion: nil)
          
          UIView.animate(withDuration: 3.5, delay: 0.45,
          options: [.repeat, .autoreverse], animations: {
           self.textField.transform = CGAffineTransform(rotationAngle: CGFloat(-rotateMe))
          }, completion: nil)
            
          UIView.animate(withDuration: 2.5, delay: 1.5,
          options: [.repeat, .autoreverse], animations: {
           self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat(rotateMe))
          }, completion: nil)
    }
    
    
    @IBAction func animation5_pressed(_ sender: UIButton) {
        UIView.animate(withDuration: 2.0, delay: 0.0,
         options: [.repeat, .autoreverse], animations: {
                self.myLabel.alpha = 0.0
                self.myLabel.backgroundColor = UIColor.lightGray
         }, completion: nil)
    }
    
    
    @IBAction func cancelAnimations_pressed(_ sender: UIButton) {
        print(labelPosition ?? "0")
        self.myLabel.layer.removeAllAnimations()
        self.textField.layer.removeAllAnimations()
        self.imageView.layer.removeAllAnimations()
        
        self.myLabel.center.x = labelPosition
        self.textField.center.x = textPosition
        self.imageView.center.x = imagePosition
        
        self.myLabel.alpha = 1
        self.myLabel.backgroundColor = nil
        
        self.myLabel.transform = labelTransform
        self.textField.transform = textTransform
        self.imageView.transform = imageTransform
    }
}

