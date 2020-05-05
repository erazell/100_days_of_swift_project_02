//
//  ViewController.swift
//  Project2
//
//  Created by Janusz  on 04/05/2020.
//  Copyright © 2020 Janusz . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var questionCounter = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   countries += ["estonia", "france", "germany", "ireland", "italy", "monaco",
                 "nigeria", "poland", "russia", "spain", "uk", "us"]
        

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
        
    }

    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "\(countries[correctAnswer].uppercased()) Score: \(score) [\(questionCounter + 1)]"
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        questionCounter += 1
        var title: String

        if questionCounter < 10 {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That’s the flag of \(countries[sender.tag].uppercased()) "
            score -= 1
        }
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        } else {
            title = "GAME OVER"
            let ac2 = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
           ac2.addAction(UIAlertAction(title: "Restart Game", style: .default, handler: askQuestion))
               score = 0
               questionCounter = 0
                correctAnswer = 0
            present(ac2, animated: true)
         
        }
       
    }
}

