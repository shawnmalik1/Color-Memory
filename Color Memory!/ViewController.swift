//
//  ViewController.swift
//  Color Memory!
//
//  Created by Shawn on 1/3/20.
//  Copyright © 2020 Shawn Malik. All rights reserved.
//

import UIKit
extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

class ViewController: UIViewController {
    
    
    var arrOfSq = [1,2,3,4,5,6]
    @IBOutlet weak var scoreLabel: UITextField!

    
    @IBOutlet weak var highestScoreLabel: UITextField!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var skyBlueButton: UIButton!
    @IBOutlet weak var crimsonButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet var buttonAll: [UIButton]!
    var count = 0.0
    var highestCount = 0.0
    var averageTime = 0.0
    var currentItem = 0
    var randomNumber = Int(arc4random_uniform(6) + 1)
    var correct = false;
    var arrOfTags = [Int]()
    @IBOutlet weak var startGame: UIButton!
    @IBOutlet weak var gameOverLabel: UILabel!
    var buttonPressed = 0
    
    var colors = [Int]()
    
    var secondsRemaining = 20.0
    

    func startTimer() {
        self.secondsRemaining = 20
        self.TimerLabel.text = "\(self.secondsRemaining)"
        TimerLabel.isHidden = false
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ timer in
            if (self.gameOverLabel.isHidden == false || self.start == false) {
                timer.invalidate()
                self.secondsRemaining = 20
                self.TimerLabel.text = "\(self.secondsRemaining)"
            }
            else if self.secondsRemaining > 0 {
                self.TimerLabel.text = "\(self.secondsRemaining)"
                self.secondsRemaining -= 1
            }

            else {
                timer.invalidate()
                self.secondsRemaining = 20
                self.TimerLabel.text = "\(self.secondsRemaining)"
                self.endGame()
                
            }
        }
    }
    @IBAction func increaseBlue(_ sender: Any) {
        if(start){
            buttonPressed = 1
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: blueButton.tag) == false){
                TimerLabel.text = "0"
                endGame()
            }
        }
    }
    
    @IBAction func increaseYellow(_ sender: Any) {
        if(start){
            buttonPressed = 3
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: yellowButton.tag) == false){
                TimerLabel.text = "0"
                endGame()
            }
        }
    }
    @IBAction func increaseGreen(_ sender: Any) {
        if(start){
            buttonPressed = 5
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: greenButton.tag) == false){
                TimerLabel.text = "0"
                endGame();
            }
        }
    }
    @IBAction func increaseSkyBlue(_ sender: Any) {
        if(start){
            buttonPressed = 4
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: skyBlueButton.tag) == false){
                TimerLabel.text = "0"
                endGame();
            }
        }
    }
    @IBOutlet weak var color: UILabel!
    @IBAction func increaseCrimson(_ sender: Any) {
        if(start){
            buttonPressed = 2
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: crimsonButton.tag) == false){
                TimerLabel.text = "0"
                endGame();
            }
        }
    }
    @IBAction func increaseBlack(_ sender: Any) {
        if(start){
            buttonPressed = 6
            colors.append(buttonPressed)
            if(buttonPressed == randomNumber){
                count = count + 1
                scoreLabel.text = "Score: \(Int(count))"
            }
            if(checkIfCorrect(tag: blackButton.tag) == false){
                TimerLabel.text = "0"
                endGame();
            }
        }
    }
    
    var start = false
    //arrOfTags.append(contentsOf: randomNumber)
    @IBAction func startGame(_ sender: Any) {
        start = true
        highestScoreLabel.textColor = .black
        scoreLabel.textColor = .black
        highestScoreLabel.isUserInteractionEnabled = false
        scoreLabel.isUserInteractionEnabled = false
        gameOverLabel.isHidden = true
        AverageTimeLabel.isHidden = true
        randomNumber = Int(arc4random_uniform(6) + 1)
        calibrate()
        print(randomNumber)
        arrOfTags.append(randomNumber)
        startTimer()
        lightButtonUp(tag_number: randomNumber)
        startGame.isHidden = true
    }
    

    @IBOutlet weak var AverageTimeLabel: UILabel!
    func endGame(){
        deCalibrate()
        TimerLabel.isHidden = true
        gameOverLabel.isHidden = false
        start = false
        startGame.isHidden = false
        if(count > highestCount){
            highestScoreLabel.textColor = .black
            highestScoreLabel.text = "Highest Score: \(Int(count))"
            highestCount = count
        }
        if count > 1{
            if self.secondsRemaining == 20{
                averageTime = 20.0/count
            }
            else{
                averageTime = (20.0-self.secondsRemaining)/count
            }
        }
        AverageTimeLabel.text = "Average Time: \(averageTime.truncate(places: 2)) seconds"
        AverageTimeLabel.isHidden = false
        count = 0
        averageTime = 0 
        scoreLabel.text = "Score:  \(Int(count))"
        arrOfTags = []
        colors = []
    }
    func calibrate(){
            blueButton.isHidden = false
            blueButton.isEnabled = true
            blueButton.showsTouchWhenHighlighted = true
        
            crimsonButton.isHidden = false
            crimsonButton.isEnabled = true
            crimsonButton.showsTouchWhenHighlighted = true

        
            yellowButton.isHidden = false
            yellowButton.isEnabled = true
            yellowButton.showsTouchWhenHighlighted = true

            skyBlueButton.isHidden = false
            skyBlueButton.isEnabled = true
            skyBlueButton.showsTouchWhenHighlighted = true

            greenButton.isHidden = false
            greenButton.isEnabled = true
            greenButton.showsTouchWhenHighlighted = true

            blackButton.isHidden = false
            blackButton.isEnabled = true
            blackButton.showsTouchWhenHighlighted = true

            resetButtons()
    }
    
    func deCalibrate(){
        blueButton.isHidden = true
        blueButton.isEnabled = false
    
        crimsonButton.isHidden = true
        crimsonButton.isEnabled = false
    
        yellowButton.isHidden = true
        yellowButton.isEnabled = false
    
        skyBlueButton.isHidden = true
        skyBlueButton.isEnabled = false
    
        greenButton.isHidden = true
        greenButton.isEnabled = false
    
        blackButton.isHidden = true
        blackButton.isEnabled = false
    }
    
        
    func checkIfCorrect(tag:Int) -> Bool{
        correct = false;
        if(tag == randomNumber){
            correct = true;
        }
        randomNumber = Int(arc4random_uniform(6) + 1)
        print(randomNumber)
        arrOfTags.append(randomNumber)
        lightButtonUp(tag_number: randomNumber)
        print(arrOfTags)
        print(colors)
        return(correct)
    }
    func lightUpSequence(){
        for i in 0...colors.count{
            lightButtonUp(tag_number: arrOfTags[i])
        }
    }
    
    @IBOutlet weak var TimerLabel: UILabel!

        

/*
    @IBAction func buttonPressed(_ sender: Any) {
        let button = sender as! UIButton
        
        switch button.tag {
        case 1:
            if(correct){
                highlightButtonWithTag(tag: 1)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 1)
            }
            break
        case 2:
            if(correct){
                highlightButtonWithTag(tag: 2)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 2)
            }
            break
        case 3:
            if(correct){
                highlightButtonWithTag(tag: 3)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 3)
            }
            break
        case 4:
            if(correct){
                highlightButtonWithTag(tag: 4)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 4)
            }
            break
        case 5:
            if(correct){
                highlightButtonWithTag(tag: 5)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 5)
            }
            break
        case 6:
            if(correct){
                highlightButtonWithTag(tag: 6)
                count = count + 1
                scoreLabel.text = "Score: \(count)"
                resetButtonHighlight(tag: 6)
            }
            break
        default:
           break
        }

    }
*/

    @objc func lightButtonUp(tag_number: Int){
        let tmpButton = view.viewWithTag(tag_number) as? UIButton
        let a = tmpButton?.backgroundColor
        tmpButton?.backgroundColor = .white
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            tmpButton?.backgroundColor = a
        }
    }
    
    
    @objc func resetButtons(){
        blueButton.backgroundColor = .systemBlue
        greenButton.backgroundColor = .systemGreen
        crimsonButton.backgroundColor = .systemPink
        yellowButton.backgroundColor = .systemYellow
        blackButton.backgroundColor = .black
        skyBlueButton.backgroundColor = .systemTeal
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        calibrate()
        // Do any additional setup after loading the view.
    }


}

