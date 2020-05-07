//
//  MindBrain.swift
//  iKnow
//
//  Created by Harsimranjit Dhaliwal on 2020-02-06.
//  Copyright © 2020 Harsimranjit Dhaliwal. All rights reserved.

import Foundation

struct MindBrain {
    let labelPrompts = [
        Mind(labelText: "I can guess the number you will think.", additionValue: 0, choice1: "Let's See", choice2: "I don't care", choice1destination: 1, choice2destination: 9),
        Mind(labelText: "Okay, THINK!! of any number from 0 to 63.", additionValue: 0, choice1: "Thought it! What's next?", choice2: "Why only from 0 to 63 ??", choice1destination: 10, choice2destination: 9),
        //This is where game begins
        Mind(labelText: "Do you see it here??        1  3  5  7  9 11 13 15 17 19 21 23 25 27 29 31 33 35 37 39 41 43 45 47 49 51 53 55 57 59 61 63.", additionValue: 1, choice1: "Yes", choice2: "No", choice1destination: 3, choice2destination: 3),
        Mind(labelText: " How About Here??          2  3  6  7 10 11 14 15 18 19 22 23 26 27 30 31 34 35 38 39 42 43 46 47 50 51 54 55 58 59 62 63.", additionValue: 2, choice1: "Yes", choice2: "No", choice1destination: 4, choice2destination: 4),
        Mind(labelText: "And here??                     4 5 6 7 12 13 14 15 20 21 22 23 28 29 30 31 36 37 38 39 44 45 46 47 52 53 54 55 60 61 62 63.", additionValue: 4, choice1: "Yes", choice2: "No", choice1destination: 5, choice2destination: 5),
        Mind(labelText: "And here??                        8 9 10 11 12 13 14 15 24 25 26 27 28 29 30 31 40 41 42 43 44 45 46 47 56 57 58 59 60 61 62 63.", additionValue: 8, choice1: "Yes", choice2: "No", choice1destination: 6, choice2destination: 6),
        Mind(labelText: "Is it in here?                   16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63.", additionValue: 16, choice1: "Yes", choice2: "No", choice1destination: 7, choice2destination: 7),
        Mind(labelText: "Okay this is last time??                                   32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63.", additionValue: 32, choice1: "Yes", choice2: "No", choice1destination: 8, choice2destination: 8),
        Mind(labelText: "", additionValue: 0, choice1: "Play Again", choice2: "That's Unbelievable I wanna show it to a friend", choice1destination: 0, choice2destination: 1),
        //This is where it ends.
        //Following prompts are just for fun.
        Mind(labelText: "That's what i can do right now", additionValue: 0, choice1: "I think i can try it", choice2: "Start Over", choice1destination: 1, choice2destination: 0),
        Mind(labelText: "On the following screens press Yes if you see your number and no if not", additionValue: 1, choice1: "Okay, bring them on", choice2: "Forget it", choice1destination: 2, choice2destination: 9)
    ]
    var answer = 0
    mutating func startOver() {
        answer = 0
    }
    
    var stepNumber: Int = 0
    
    mutating func nextStep(_ userChoice : String) {
        if userChoice == labelPrompts[stepNumber].choice1 {
            stepNumber = labelPrompts[stepNumber].choice1destination
        } else{
            stepNumber = labelPrompts[stepNumber].choice2destination
        }
        
        
    }
    
    func stepLabelText() -> String{
        var displayText = labelPrompts[stepNumber].labelText
        if stepNumber == 8 {
            displayText = "\(answer)"
            mindBrain.startOver()
        }
        return displayText
    }
    
    func stepChoices(_ choice :Int) -> String{
        let choices = [labelPrompts[stepNumber].choice1,labelPrompts[stepNumber].choice2]
        return choices[choice]
    }
    
    mutating func calculate(_ userChoice: String){
        if  userChoice == "Yes"{
            answer = answer + labelPrompts[stepNumber].additionValue
        }
    }
}
