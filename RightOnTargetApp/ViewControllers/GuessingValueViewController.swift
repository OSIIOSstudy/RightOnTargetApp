//
//  ViewController.swift
//  RightOnTargetApp
//
//  Created by OSIIOSdev on 15.03.2024.
//

import UIKit

final class GuessingValueViewController: UIViewController {
    // MARK: - @IBOutlets
    @IBOutlet var valueSlider: UISlider!
    @IBOutlet var valueLabel: UILabel!
    
    @IBOutlet var getResultButton: UIButton!
    
    // MARK: - Private properties
    private var value = 0
    private var round = 0
    private var points = 0
    private var result = 0
    
    // MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSettings()
    }
     
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        
        showAlertController(title: "New game", message: "Try to get less than 15 points. To start a game press START")
    }

    // MARK: - @IBAction Methods
    @IBAction func getResult() {
        switch round {
        case 0:
            value = Int.random(in: Int(valueSlider.minimumValue)...Int(valueSlider.maximumValue))
            valueLabel.text = value.formatted()
            
            getResultButton.setTitle("CHECK", for: .normal)
            round = 1
        case 1 ..< 5:
            points = abs(value - Int(valueSlider.value))
            result += points
        
            value = Int.random(in: Int(valueSlider.minimumValue)...Int(valueSlider.maximumValue))
            valueLabel.text = value.formatted()
        
            round += 1
        default:
            result <= 15 ? showAlertController(title: "Game over", message: "You win! Your final result is \(result)") :
                           showAlertController(title: "Game over", message: "You lose! Your final result is \(result)")
            round = 0
            result = 0
            valueLabel.text = 0.formatted()
            getResultButton.setTitle("START", for: .normal)
        }
    }
    
    // MARK: - Private Methods
    private func buttonSettings() {
        getResultButton.layer.cornerRadius = 10
        getResultButton.setTitle("START", for: .normal)
    }
    
    private func showAlertController(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let oKaction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(oKaction)
        present(alert, animated: true)
    }
}






