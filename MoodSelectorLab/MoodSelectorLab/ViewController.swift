//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imagePage: UIImageView!
    
    @IBOutlet weak var lablePage: UILabel!
    
    @IBOutlet weak var moodChange: MoodSelector!
    
    let pagesArry = [MoodPage(description: "If you are happy you will make those around you feel happy", imageName: "happy1"), MoodPage(description: "Every person has a sun within him, it must shine in the crises", imageName: "sad1"),MoodPage(description: "Don't make a change too complicated, just begin", imageName: "angry1"),MoodPage(description: "Everything will be fine", imageName: "sleepy1")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func changeP(_ sender: Any) {
        
        
        setupMood()
        
        
        func setupMood(){
            
            lablePage.text = pagesArry[moodChange.selectedMoodIndex].description
            imagePage.image = UIImage(named: pagesArry[moodChange.selectedMoodIndex].imageName)
            
            imagePage.transform = imagePage.transform.scaledBy(x: 2, y: 2)
            
            imagePage.alpha = 0
            
            let lable1 = lablePage.transform
            lablePage.transform = lablePage.transform.translatedBy(x: -view.frame.width, y: 0)
            
            
            
            
            let animtor = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut){
                self.imagePage.transform = self.imagePage.transform.scaledBy(x: 0.5, y: 0.5)
                self.imagePage.alpha = 1
                self.lablePage.transform = lable1
                self.imagePage.transform = .identity
            }
            
            animtor.startAnimation()
            
        }
        
    }
}


