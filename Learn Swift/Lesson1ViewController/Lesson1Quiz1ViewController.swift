//
//  Lesson1Quiz1ViewController.swift
//  Learn Swift
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 12/04/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit
import AVFoundation

var moveLessTwo:Bool? = false
var moveLessThree:Bool? = false

class Lesson1Quiz1ViewController: UIViewController {
    //---------------semua deklarasi---------------------
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var ImagePopUp: UIImageView!
    @IBOutlet weak var correctPopUp: UIImageView!
    
    @IBOutlet weak var labelAnswerOne: UILabel!
    @IBOutlet weak var labelAnswerTwo: UILabel!
    
    let checkButton = UIButton(type: .custom)
    
    var btnCk1:Bool? = false
    var btnCk2:Bool? = false
    

    var player1: AVAudioPlayer?
    var player2: AVAudioPlayer?

  
 //-------------------tampilan di awal saat screen load up--------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
        checkButton.setImage(UIImage(named: "CheckButton.png"), for: .normal)
        
        checkButton.addTarget(self, action: #selector(checkButtonAction(_:)), for: .touchUpInside)
        
        view.addSubview(checkButton)
        self.view = view
        
        backButton.isHidden = true
        ImagePopUp.isHidden = true
        correctPopUp.isHidden = true//
        
        //let tapOne = UITapGestureRecognizer(terget: self, action: Selector()
        
        labelAnswerOne.font = UIFont(name: "Arial", size: 14)
        labelAnswerOne.text = "True"
        
        
        labelAnswerTwo.font = UIFont(name: "Arial", size: 14)
        labelAnswerTwo.text = "False"
        
        
    }
    
    //--------------saat check button di tekan-------------------------
    @objc func checkButtonAction(_ sender: UIButton){
        if btnCk1 == true && btnCk2 == false {
            //contButton()
            
            checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
            checkButton.setImage(UIImage(named: "ContinueButton.png"), for: .normal)
            
            checkButton.addTarget(self, action: #selector(nextPage(_:)), for: .touchUpInside)//NextPage
            
            view.addSubview(checkButton)
            self.view = view
            
            correctPopUp.isHidden = false//
            
            correctSound()
            
            moveLessTwo = true
        }
        else{
        
            checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
            checkButton.setImage(UIImage(named: "TryAgainButton.png"), for: .normal)
            
            checkButton.addTarget(self, action: #selector(changeButton(_:)), for: .touchUpInside)//ChangeImage
            
            view.addSubview(checkButton)
            self.view = view
            
            backButton.isHidden = false
            ImagePopUp.isHidden = false
            
            wrongSound()
        }
    }
    
    //---------------------saat continue button ditekan lari ke---------------------------
    @objc func nextPage(_ sender: UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "L1.2") as! Lesson1duaViewController
        self.present(vc, animated: true, completion: nil)
    }
    //---------------------saat try again button ditekan lari ke------------------------
    @objc func changeButton(_ sender: UIButton){
        
        checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
        checkButton.setImage(UIImage(named: "CheckButton.png"), for: .normal)
        
        checkButton.addTarget(self, action: #selector(checkButtonAction(_:)), for: .touchUpInside)
        
        view.addSubview(checkButton)
        self.view = view
        
        backButton.isHidden = true
        ImagePopUp.isHidden = true
        correctPopUp.isHidden = true//
    }
    //---------------------saat check1 di tekan-------------------------
    @IBAction func buttonCheck1(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            btnCk1 = false
        } else {
            sender.isSelected = true
            btnCk1 = true
        }
        print("btnCk1 : \(btnCk1!)")
    }
    //---------------------saat check1 di tekan-------------------------
    @IBAction func buttonCheck2(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            btnCk2 = false
        } else {
            sender.isSelected = true
            btnCk2 = true
        }
        print("btnCk2 : \(btnCk2!)")
    }
    
    func correctSound() {
        
        guard let url = Bundle.main.url(forResource: "Correctsnd", withExtension: "m4a") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player1 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player1 else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func wrongSound() {
        
        guard let url = Bundle.main.url(forResource: "Wrongsnd", withExtension: "m4a") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player2 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player2 else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    }


/*func backButton(){
    let bckButton = UIButton(type: .custom)
    bckButton.frame = CGRect(x: 104, y: 737, width: 50, height: 20)
    bckButton.setImage(UIImage(named: ""), for: .normal)
    
    bckButton.addTarget(self, action: #selector(backPage(_:)), for: .touchUpOutside)
    
    view.addSubview(bckButton)
    self.view = view
    
}*/
/*func contButton(){
    
    let continueButton = UIButton(type: .custom)
    continueButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
    continueButton.setImage(UIImage(named: "ContinueButton.png"), for: .normal)
    
    continueButton.addTarget(self, action: #selector(nextPage(_:)), for: .touchUpInside)
    
    view.addSubview(checkButton)
    self.view = view
}*/

/*checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
checkButton.setImage(UIImage(named: "TryAgainButton.png"), for: .normal)

view.addSubview(checkButton)
self.view = view*/

/*
 */

/*@objc func labelAnswerTwoPress(_ sender: UIButton){
    if sender.isSelected {
        sender.isSelected = false
        btnCk2 = false
    } else {
        sender.isSelected = true
        btnCk2 = true
    }
}*/
