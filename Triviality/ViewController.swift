//
//  ViewController.swift
//  Triviality
//
//  Created by Lauren Small on 8/23/18.
//  Copyright © 2018 Lauren Small. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

/*
 Create a trivia game application consisting of at least 8 questions
 If the user guesses a question correctly, the background of the app should flash green, and the user should be taken to the next question
 If the user chooses an incorrect answer, the background of the app should flash red, and that answer should be disabled
 If the user gets more than 3 questions wrong, the user should lose the game
 At the end of the game, your app should show the user their score
 The user should be able to start over when the game ends
 */
    
    
    
    
    var questionBank = ["How many apprentices are in the current cohort at Detroit Labs?", "How many feet are in a yard?", "What is the name of the Vice President of the United States?", "What is the name of the Prime Minister of Canada?", "When is Jordan's birthday?", "How many pets does Erika have?", "How tall is the Renaissance Building?", "What is the capital of Michigan"]
    
    var questionAnswers = [["8", "7", "6", "5"], ["3", "2", "4", "5"], ["Michael Richard Pence", "Michael Dean Cohen", "Albert Arnold Gore Jr.", "Joseph Robinette Biden Jr."], ["Justin Pierre James Trudeau", "Donald Trump", "Michael Jordan", "Pamela Anderson"], ["February 16th", "February 17th", "March 16th", "March 17th"], ["3", "2", "1", "0"], ["727ft", "627ft", "747ft", "777ft"], ["Lansing", "Topeka", "Run for your Life City", "Whoville"]]
    
    
    //Variables
    var currentQuestion = 0   //keeps track of current question number
    var rightAnswerLocation:UInt32 = 0 //keeps track of which button has the correct answer to compare the user answer to
    var score = 0
    
    
    
    
    
    
    //label with question
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var winOrLose: UILabel!
    
    //could connect every button to the same function
    @IBAction func answerButton(_ sender: Any) {
        
        //check to see if the button the user clicks on has the correct answer
        if ((sender as AnyObject).tag == Int(rightAnswerLocation)) {
            print ("Correct!")
            view.backgroundColor = .green
            score += 1
//            view.backgroundColor = .white
        } else {
            view.backgroundColor = .red
            print("Incorrect :(")
//            view.backgroundColor = .white
        }
        //don't want to call on an element that doesn't exist
        if (currentQuestion != questionBank.count){
            newQuestion()
        } else {
        userScore.text = "Your score is \(score)"
            if score > 4{
                winOrLose.text = "You won the game!"
            } else {
                winOrLose.text = "You lost the game"
            }
            
            
        }
    }
    
    
    
    
    @IBAction func restartGameButton(_ sender: Any) {
       
//        self.dismiss(animated: false, completion: nil)
        self.presentingViewController?.dismiss(animated: false, completion: nil)
    }
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    
    
    //function to display new questions
    func newQuestion() {
        questionLabel.text = questionBank[currentQuestion]
        
        // + 1 because we don't want to include 0
        rightAnswerLocation = arc4random_uniform(4) + 1
        
        //Create a button
        var button:UIButton = UIButton()
        
        var x = 1
        
        //loops through and sets up each button
        for index in 1...4 {
           //create a button...gave each button a tag, need to convert it to a button
            button = view.viewWithTag(index) as! UIButton
            
            if (index == Int(rightAnswerLocation)) {
                button.setTitle(questionAnswers[currentQuestion][0], for: .normal)
            } else {
                //if the right answer is not supposed to be there
                button.setTitle(questionAnswers[currentQuestion][x], for: .normal)
                
                /*
                 x = 2
                 or
                 x + 1
                */
                
                x = 2
            }
//            currentQuestion += 1
            
        }
        
       currentQuestion += 1
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

