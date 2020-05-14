//
//  Lesson1MainViewController.swift
//  Learn Swift
//
//  Created by Muhammad Ilham Ashiddiq Tresnawan on 12/04/20.
//  Copyright © 2020 Muhammad Ilham Ashiddiq Tresnawan. All rights reserved.
//

import UIKit

class Lesson1MainViewController: UIViewController {


    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //buttonOne.titleLabel?.font = UIFont(name: "Arial", size: 14)
        //buttonTwo.titleLabel?.font = UIFont(name: "Arial", size: 14)
        //buttonThree.titleLabel?.font = UIFont(name: "Arial", size: 14)
    }
    
    @IBAction func moveToLessTwo(_ sender: UIButton) {
        if moveLessTwo == true {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "L1.2") as! Lesson1duaViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func moveToLessThree(_ sender: UIButton) {
        if moveLessThree == true {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "L1.3") as! Lesson1tigaViewController
            self.present(vc, animated: true, completion: nil)
        }
    }
    

}
