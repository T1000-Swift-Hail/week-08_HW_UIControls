//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var labwlText: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var moodSelector: MoodSelector!

    
    
    let yourMood:[MoodPage] = [MoodPage(description: "you deserve to be happy", imageName: "happy1"),MoodPage(description: "Keep going, every thing will be fine", imageName: "sad1"), MoodPage(description: "Sometimes, you have to get angry to get things done.", imageName: "angry1"), MoodPage(description: "Your time is limited, so don't waste it living someone else's life.", imageName: "sleppy1")]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoods()
        animations()
        // Do any additional setup after loading the view.
    

    }


        func setupMoods() {
            labwlText.text = yourMood[moodSelector.selectedMoodIndex].description
            
        imageView.image = UIImage(named: yourMood[moodSelector.selectedMoodIndex].imageName)

        }

    func animations(){
             labwlText.translatesAutoresizingMaskIntoConstraints = false
             imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
             imageView.alpha = 0.5
            
             

             let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut) {
                 self.labwlText.frame.origin.x = -500
                 self.imageView.transform = CGAffineTransform(rotationAngle: 70)
                 self.imageView.transform = self.imageView.transform.scaledBy(x: 1, y: 1)
                 self.imageView.alpha = 1
                 self.imageView.transform = .identity
             }
             animator.startAnimation()
         }
    
       
    
    
    @IBAction func chnageMood(_ sender: Any) {
        setupMoods()
        animations()
    }
    
}

