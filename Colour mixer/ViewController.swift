//
//  ViewController.swift
//  Colour mixer
//
//  Created by Nazar Lykashik on 25.04.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var mainLabel: UIView!
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // colour labeles
        
        redSlider.tintColor = .red
        greenSlider.tintColor = .green
        


        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
        redLabel.text = String(format:"%.1f",redSlider.value)
        greenLabel.text = String(format:"%.1f",greenSlider.value)
        blueLabel.text = String(format:"%.1f",greenSlider.value)
        
        

            }
    @IBAction func redSliderMove(_ sender: Any) {
        redLabel.text = String(format:"%.1f",redSlider.value)
        redTextField.text = String(format: "%.1f",redSlider.value)
        backGroundSliders(redSlider: redSlider.value,
                          greenSlider: greenSlider.value,
                          blueSlider: blueSlider.value)
    }

    @IBAction func greenSliderMove(_ sender: Any) {
        greenLabel.text = String(format:"%.1f",greenSlider.value)
        greenTextField.text = String(format:"%.1f",greenSlider.value)
        backGroundSliders(redSlider: redSlider.value,
                          greenSlider: greenSlider.value,
                          blueSlider: blueSlider.value)
    }
    @IBAction func blueSliderMove(_ sender: Any) {
        blueLabel.text = String(format:"%.1f",blueSlider.value)
        blueTextField.text = String(format:"%.1f",blueSlider.value)
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
extension ViewController: UITextFieldDelegate{
    //скрываем клавиатуру на done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    //скрытие клавиатуры по тапу на экран за пределами тест вью
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true) //скрывает клавиатуру, вызванную для любого объекта
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            backGroundSliders(redSlider: redSlider.value,
                              greenSlider: greenSlider.value,
                              blueSlider: blueSlider.value)
            redLabel.text = String(format:"%.1f",redSlider.value)
            greenLabel.text = String(format:"%.1f",greenSlider.value)
            blueLabel.text = String(format:"%.1f",blueSlider.value)
        }else{
            showAlert(title: "Wrong format!", message: "Please enter correct value")
        }
     }
}

extension ViewController {
    // отображаем кнопку готово в клавиатуре
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        self.view.endEditing(true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
