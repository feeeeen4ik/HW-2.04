//
//  ViewController.swift
//  HW 2.04
//
//  Created by Феликс Антонович on 30.10.2024.
//

import UIKit

final class SettingsViewController: UIViewController {

    @IBOutlet var viewOutlet: UIView!
    
    @IBOutlet var redSliderOutlet: UISlider!
    @IBOutlet var greenSliderOutlet: UISlider!
    @IBOutlet var blueSliderOutlet: UISlider!
    
    @IBOutlet var redLabelOutlet: UILabel!
    @IBOutlet var greenLabelOutlet: UILabel!
    @IBOutlet var blueLabelOutlet: UILabel!
    
    @IBOutlet var redTextFieldOutlet: UITextField!
    @IBOutlet var greenTextFieldOutlet: UITextField!
    @IBOutlet var blueTextFieldOutlet: UITextField!
    
    
    var backgroundColor: UIColor!
    
    weak var delegate: SettingsViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOutlet.layer.cornerRadius = 10
        viewOutlet.backgroundColor = backgroundColor
        setupSliders()
        changeColorOnView()
    }
    
    @IBAction func redSliderAction () {
        redLabelOutlet.text = String(format: "%5.2f", redSliderOutlet.value)
        changeColorOnView()
    }

    @IBAction func greenSliderAction () {
        greenLabelOutlet.text = String(format: "%5.2f", greenSliderOutlet.value)
        changeColorOnView()
    }
    
    @IBAction func blueSliderAction () {
        blueLabelOutlet.text = String(format: "%5.2f", blueSliderOutlet.value)
        changeColorOnView()
    }
    
    @IBAction func doneButtonAction() {
        
        delegate?.applyBackgroundColor(
            with: UIColor(
                red: CGFloat(redSliderOutlet.value),
                green: CGFloat(greenSliderOutlet.value),
                blue: CGFloat(blueSliderOutlet.value),
                alpha: 1
            )
        )
        
        dismiss(animated: true)
    }
    
    @IBAction func redTextFieldAction() {
        redSliderOutlet.setValue(Float(redTextFieldOutlet.text ?? "") ?? 0.0, animated: true)
        changeColorOnView()
    }
    @IBAction func greenTextFieldAction() {
        greenSliderOutlet.setValue(Float(greenTextFieldOutlet.text ?? "") ?? 0.0, animated: true)
        changeColorOnView()
    }
    @IBAction func blueTextFieldAction() {
        blueSliderOutlet.setValue(Float(blueTextFieldOutlet.text ?? "") ?? 0.0, animated: true)
        changeColorOnView()
    }
    
    
    
    private func setupSliders() {
        let colorComponents = viewOutlet.backgroundColor?.cgColor.components
        let redColor = colorComponents?[0] ?? 0.0
        let greenColor = colorComponents?[1] ?? 0.0
        let blueColor = colorComponents?[2] ?? 0.0
        
        redSliderOutlet.minimumValue = 0
        redSliderOutlet.maximumValue = 1
        redSliderOutlet.value = Float(redColor)
        redSliderOutlet.minimumTrackTintColor = .red
        
        greenSliderOutlet.minimumValue = 0
        greenSliderOutlet.maximumValue = 1
        greenSliderOutlet.value = Float(greenColor)
        greenSliderOutlet.minimumTrackTintColor = .green
        
        blueSliderOutlet.minimumValue = 0
        blueSliderOutlet.maximumValue = 1
        blueSliderOutlet.value = Float(blueColor)
        blueSliderOutlet.minimumTrackTintColor = .blue
        
    }
    
    private func changeColorOnView() {
        viewOutlet.backgroundColor = UIColor(
            red: CGFloat(redSliderOutlet.value),
            green: CGFloat(greenSliderOutlet.value),
            blue: CGFloat(blueSliderOutlet.value),
            alpha: 1
        )
        
        redLabelOutlet.text = String(format: "%5.2f", redSliderOutlet.value)
        greenLabelOutlet.text = String(format: "%5.2f", greenSliderOutlet.value)
        blueLabelOutlet.text = String(format: "%5.2f", blueSliderOutlet.value)
        
        redTextFieldOutlet.text = String(format: "%5.2f", redSliderOutlet.value)
        greenTextFieldOutlet.text = String(format: "%5.2f", greenSliderOutlet.value)
        blueTextFieldOutlet.text = String(format: "%5.2f", blueSliderOutlet.value)
        
        
    }
}

