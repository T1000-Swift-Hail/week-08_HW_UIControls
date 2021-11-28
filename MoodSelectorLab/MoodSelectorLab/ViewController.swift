//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var viewLabel: UILabel!
    
    @IBOutlet var viewImage: UIImageView!
    
    @IBOutlet var controlImageLabel: MoodSelector!
    
    var moodsDescritionImage : [MoodPage] = [MoodPage(description: "Happy day make every one happy", imageName: "happy1"),MoodPage(description: "dont worry be happy for days", imageName: "sad1"),MoodPage(description: "Drink some water, and change your mood ", imageName: "angry1"),MoodPage(description: " have a good dream", imageName: "sleepy1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodSet()
        
    }
    
    @IBAction func uicontrolView(_ sender: Any) {
        viewImage.image = UIImage(named: moodsDescritionImage[controlImageLabel.selectedMoodIndex].imageName)
        viewLabel.text = moodsDescritionImage[controlImageLabel.selectedMoodIndex].description
        
    }
    
    func moodSet(){
        viewImage.image = UIImage(named: moodsDescritionImage[controlImageLabel.selectedMoodIndex].imageName)
        viewLabel.text = moodsDescritionImage[controlImageLabel.selectedMoodIndex].description
    }
    
}

