//
//  ViewController.swift
//  HW 2.04
//
//  Created by Феликс Антонович on 30.10.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet var viewOutlet: UIView!
    @IBOutlet var redSliderOutlet: UISlider!
    @IBOutlet var greenSliderOutlet: UISlider!
    @IBOutlet var blueSliderOutlet: UISlider!
    @IBOutlet var redLabelOutlet: UILabel!
    @IBOutlet var greenLabelOutlet: UILabel!
    @IBOutlet var blueLabelOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewOutlet.layer.cornerRadius = 10
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
    
    private func setupSliders() {
        redSliderOutlet.minimumValue = 0
        redSliderOutlet.maximumValue = 1
        redSliderOutlet.value = Float.random(in: 0...1.0)
        redSliderOutlet.minimumTrackTintColor = .red
        
        greenSliderOutlet.minimumValue = 0
        greenSliderOutlet.maximumValue = 1
        greenSliderOutlet.value = Float.random(in: 0...1.0)
        greenSliderOutlet.minimumTrackTintColor = .green
        
        blueSliderOutlet.minimumValue = 0
        blueSliderOutlet.maximumValue = 1
        blueSliderOutlet.value = Float.random(in: 0...1.0)
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
    }


}

