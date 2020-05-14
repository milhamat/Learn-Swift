//
//  Lesson1Quiz2ViewController.swift
//  Learn Swift
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 12/04/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit
import AVFoundation

class Lesson1Quiz2ViewController: UIViewController {
    
    //---------------semua deklarasi---------------------
       
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var imagePopUp: UIImageView!
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
           imagePopUp.isHidden = true
           correctPopUp.isHidden = true
         
           labelAnswerOne.font = UIFont(name: "Arial", size: 14)
        
           labelAnswerTwo.font = UIFont(name: "Arial", size: 14)
        
       }
       
       //--------------saat check button di tekan-------------------------
       @objc func checkButtonAction(_ sender: UIButton){
           if btnCk1 == false && btnCk2 == true {
               //contButton()
               
               checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
               checkButton.setImage(UIImage(named: "ContinueButton.png"), for: .normal)
               
               checkButton.addTarget(self, action: #selector(nextPage(_:)), for: .touchUpInside)
               
               view.addSubview(checkButton)
               self.view = view
            
               correctPopUp.isHidden = false
            
               correctSound()
            
               moveLessThree = true
            
           }
           else{
           
               checkButton.frame = CGRect(x: 290, y: 760, width: 110, height: 40)
               checkButton.setImage(UIImage(named: "TryAgainButton.png"), for: .normal)
               
               checkButton.addTarget(self, action: #selector(changeButton(_:)), for: .touchUpInside)
               
               view.addSubview(checkButton)
               self.view = view
               
               backButton.isHidden = false
               imagePopUp.isHidden = false
               
               wrongSound()
            
           }
       }
       
       //---------------------saat continue button ditekan lari ke---------------------------
       @objc func nextPage(_ sender: UIButton){
           let vc = self.storyboard?.instantiateViewController(withIdentifier: "L1.3") as! Lesson1tigaViewController
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
           imagePopUp.isHidden = true
           correctPopUp.isHidden = true
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

    
    


