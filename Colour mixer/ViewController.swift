//
//  ViewController.swift
//  Colour mixer
//
//  Created by Nazar Lykashik on 25.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // red label
        redLabel.text = String(redSlider.value)
        
        
        // setup slider
        redSlider.minimumValue = 0
        redSlider.maximumValue = 255

            }
    @IBAction func redSliderMove(_ sender: Any) {
        redLabel.text = String(redSlider.value)
        let backGroundColour = mainLabel?.backgroundColor
        mainLabel?.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0.5)
    }

    @IBAction func greenSliderMove(_ sender: Any) {
        greenLabel.text = String(greenSlider.value)
        let backGroundColour = mainLabel?.backgroundColor
        mainLabel?.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0.5)
    }
    @IBAction func blueSliderMove(_ sender: Any) {
        greenLabel.text = String(greenSlider.value)
        let backGroundColour = mainLabel?.backgroundColor
        mainLabel?.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 0.5)
    }
}
        

        
        

 
    
      //      let mainLabelColour = mainLabel.backgroundColor
      //  mainLabel.backgroundColor = mainLabelColour?.getRed(CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat = 1)

    



