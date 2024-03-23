//
//  ViewController.swift
//  Project_1
//
//  Created by Shermukhammad Usmonov 2023-10-28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hangman_image: UIImageView!
    
    @IBOutlet weak var winsCount: UILabel!
    @IBOutlet weak var lossesCount: UILabel!
    
    @IBOutlet weak var letterOne: UILabel!
    @IBOutlet weak var letterTwo: UILabel!
    @IBOutlet weak var letterFour: UILabel!
    @IBOutlet weak var letterThree: UILabel!
    @IBOutlet weak var letterSeven: UILabel!
    @IBOutlet weak var letterSix: UILabel!
    @IBOutlet weak var letterFive: UILabel!

    @IBOutlet var keys: [UIButton]!
    
    var words: [String] = ["BALANCE", "BATTERY", "BEDROOM", "CABINET", "CAPTAIN", "CHICKEN"]
    var chosenWord: String = ""
    var letters = [Character]()
    var misses: Int = 0
    var hits: Int = 0
    var wins: Int = 0
    var losses: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newGame()
        
    }
    
    @IBAction func restartBtnTapped(_ sender: UIButton) {
        newGame()
    }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {

        if(letters.contains(sender.titleLabel!.text!)){
            let myLetter = sender.titleLabel!.text!
            
            for index in 0..<letters.count{
                if (letters[index] == Character(myLetter)){
                    displayLetter(letterIndex: index, letterToShow: myLetter)
                    sender.backgroundColor = .green
                    
                }
            }
        } else {
            sender.backgroundColor = .red
            
            wrongGuess()
            
        }
        
    }
    
    private func newGame(){
        hangman_image.image = .start
        
        winsCount.text = String(wins)
        lossesCount.text = String(losses)
        
        misses = 0
        hits = 0
        
        chosenWord = words.randomElement()!
        letters = Array(chosenWord)
        
        letterOne.text = "_"
        letterTwo.text = "_"
        letterThree.text = "_"
        letterFour.text = "_"
        letterFive.text = "_"
        letterSix.text = "_"
        letterSeven.text = "_"
        
        for key in keys{
            key.backgroundColor = .white
        }
    }
    
    private func displayLetter(letterIndex: Int, letterToShow: String){
        correctGuess()
        switch(letterIndex){
        case 0:
            letterOne.text = letterToShow
            break
        case 1:
            letterTwo.text = letterToShow
            break
        case 2:
            letterThree.text = letterToShow
            break
        case 3:
            letterFour.text = letterToShow
            break
        case 4:
            letterFive.text = letterToShow
            break
        case 5:
            letterSix.text = letterToShow
            break
        default:
            letterSeven.text = letterToShow
        }
    }
    
    private func showAlert(win: Bool){
        if win == true{
            wins += 1
            let alert = UIAlertController(title: "Woohoo!", message: "You saved me! Would you like to play again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.newGame()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default
            ))
            
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            }
        } else {
            losses += 1
            let alert = UIAlertController(title: "Uh oh...", message: "The correct word was <<\(chosenWord)>>. Would You like to try again?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.newGame()
            }))
            alert.addAction(UIAlertAction(title: "No", style: .default
            ))
            
            DispatchQueue.main.async {
                self.present(alert, animated: false, completion: nil)
            }
        }
    }
    
    private func wrongGuess(){
        misses = misses + 1

        switch (misses){
        case 1:
            hangman_image.image = .missOne
            break
        case 2:
            hangman_image.image = .missTwo
            break
        case 3:
            hangman_image.image = .missThree
            break
        case 4:
            hangman_image.image = .missFour
            break
        case 5:
            hangman_image.image = .missFive
            break
        case 6:
            hangman_image.image = .missSix
            break
        default:
            hangman_image.image = .lose
            showAlert(win: false)
        }
    }
    
    private func correctGuess(){
        hits = hits + 1
        if hits == 7{
            hangman_image.image = .win
            showAlert(win: true)
        }
    }
}

