//
//  SecondViewController.swift
//  iKnow
//
//  Created by Harsimranjit Dhaliwal on 2020-03-06.
//  Copyright © 2020 Harsimranjit Dhaliwal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var result: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = result
    }

    @IBAction func playAgainPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
