//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodPosation: UILabel!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var moodSelect: MoodSelector!
    
    
    var moodStatus : [MoodPage] = [MoodPage(description: "Have a good vibes", imageName: "happyy"), MoodPage(description: "This time will pass", imageName: "sadness"), MoodPage(description: "Keep calm and drink coffee ", imageName: "calma"), MoodPage(description: "Time to bed", imageName: "bed")]
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodPosation.text = moodStatus[moodSelect.selectedMoodIndex].description
        imageView.image = UIImage(named: moodStatus[moodSelect.selectedMoodIndex].imageName)
        animation()
    }
    
    
    
    @IBAction func showMood(_ sender: Any) {
        moodPosation.text = moodStatus[moodSelect.selectedMoodIndex].description
        imageView.image = UIImage(named: moodStatus[moodSelect.selectedMoodIndex].imageName)
        animation()
    }
    
    
    func animation() {
        
//        let moods = [moodStatus]
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        imageView.alpha = 0
        self.moodPosation.transform =
        CGAffineTransform(translationX: -300, y: -400)
        
        UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseOut) {
            self.moodPosation.transform =
            CGAffineTransform(translationX: 0, y: 0)
            self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
            self.imageView.alpha = 1
        }
    }
    
}

