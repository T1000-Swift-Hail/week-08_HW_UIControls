//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelMood: UILabel!
    @IBOutlet weak var imageMood: UIImageView!
    @IBOutlet weak var selectorMood: MoodSelector!
    
    
    let moodSelect: [MoodPage] = [
        MoodPage(description: "The only thing that will make you happy is being happy with who you are", imageName: "1"),
        MoodPage(description: "The key to BEING HAPPY is knowing you have the power to choose what to accept and what to let go", imageName: "2"),
        MoodPage(description: "When you are angry be silent", imageName: "3"),
        MoodPage(description: "There is no place as beautiful as a bed.. GOOD NIGHT !! ", imageName: "4"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelMood.text = moodSelect[selectorMood.selectedMoodIndex].description
        imageMood.image = UIImage(named: moodSelect[selectorMood.selectedMoodIndex].imageName)
    }
    
    @IBAction func moodSelector(_ sender: Any) {
        
        labelMood.text = moodSelect[selectorMood.selectedMoodIndex].description
        imageMood.image = UIImage(named: moodSelect[selectorMood.selectedMoodIndex].imageName)
        
        imageMood.transform = imageMood.transform.scaledBy(x: 2, y: 2)
        labelMood.alpha = 0
        labelMood.center.y = view.frame.height
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.imageMood.transform = self.imageMood.transform.scaledBy(x:0.5, y: 0.5)
            self.imageMood.alpha = 1
        }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.labelMood?.transform = CGAffineTransform.init(translationX: 0, y: 0)
            self.labelMood.alpha = 1
            
        } completion: { _ in
            
        }})
    }
    
}


