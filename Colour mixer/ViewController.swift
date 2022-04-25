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
        // colour labeles
        redLabel.text = String(redSlider.value)
        greenLabel.text = String(greenSlider.value)
        blueLabel.text = String(greenSlider.value)
        

            }
    @IBAction func redSliderMove(_ sender: Any) {
        //redSlider. = Int(redTextField)
        redLabel.text = String(redSlider.value)
        backGroundSliders(redSlider: redSlider.value,
                          greenSlider: greenSlider.value,
                          blueSlider: blueSlider.value)
    }

    @IBAction func greenSliderMove(_ sender: Any) {
        greenLabel.text = String(greenSlider.value)
        backGroundSliders(redSlider: redSlider.value,
                          greenSlider: greenSlider.value,
                          blueSlider: blueSlider.value)
    }
    @IBAction func blueSliderMove(_ sender: Any) {
        blueLabel.text = String(blueSlider.value)
        backGroundSliders(redSlider: redSlider.value,
                          greenSlider: greenSlider.value,
                          blueSlider: blueSlider.value)
    }
    
    func backGroundSliders(redSlider: Float,
                           greenSlider:Float,
                           blueSlider:Float){
        mainLabel?.backgroundColor = UIColor(red: CGFloat(redSlider),
                                             green: CGFloat(greenSlider),
                                             blue: CGFloat(blueSlider),
                                             alpha: 1)
    }
}


    



