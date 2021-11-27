//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var moodSelector: MoodSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelView.text = imageCr7[moodSelector.selectedMoodIndex].description
        imageView.image = UIImage(named: imageCr7[moodSelector.selectedMoodIndex].imageName)
        
    }
    // "When CR7 lose the match he is sad ", imageName: "crSad.jpeg")
    
    let imageCr7 = [MoodPage(description: "Be Happy like GOAT CR7", imageName: "crHappy.jpeg"),
    
                    MoodPage(description: "When CR7 lose the match he is sad ", imageName: "crSad.jpeg"),
                    MoodPage(description:  "When The Fans Talking bad To CR7 He angery and score Hatrick", imageName: "crAngry.jpeg"),
                    MoodPage(description: "be like GOAT sleep Well", imageName: "crSleep.jpeg")
    ]

    @IBAction func moodChange(_ sender: Any) {
        
        
        labelView.text = imageCr7[moodSelector.selectedMoodIndex].description
        imageView.image = UIImage(named: imageCr7[moodSelector.selectedMoodIndex].imageName)
        
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        labelView.alpha = 0
        labelView.center.y = view.frame.height
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            
            self.imageView.transform = self.imageView.transform.scaledBy(x:0.5, y: 0.5)
            self.imageView.alpha = 1
        }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.labelView?.transform = CGAffineTransform.init(translationX: 0, y: 0)
          self.labelView.alpha = 1

            } completion: { _ in

            }})
        
    }
    
}

