//
//  ViewController.swift
//  iKnow
//
//  Created by Harsimranjit Dhaliwal on 2019-12-17.
//  Copyright © 2019 Harsimranjit Dhaliwal. All rights reserved.

import UIKit

var mindBrain = MindBrain()


class FirstViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userChoice = sender.titleLabel!.text!
        mindBrain.calculate(userChoice)
        mindBrain.nextStep(userChoice)
        if mindBrain.stepNumber == 8 {
            self.performSegue(withIdentifier: "goToResult", sender: self)
            mindBrain.nextStep("Play Again")
            updateUI()
        }else{
            updateUI()
        }
    }
    
    func updateUI() {
        questionLabel.text = mindBrain.stepLabelText()
        choice1Button.setTitle(mindBrain.stepChoices(0), for: .normal)
        choice2Button.setTitle(mindBrain.stepChoices(1), for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! SecondViewController
            destinationVC.result = mindBrain.stepLabelText()
        }
    }
}
