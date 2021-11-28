//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelView: UILabel!
    @IBOutlet weak var imageView: UIImageView!    
    @IBOutlet weak var moodSelector: MoodSelector!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelView.text = imageMood[moodSelector.selectedMoodIndex].description
        imageView.image = UIImage(named: imageMood[moodSelector.selectedMoodIndex].imageName)
    }
    
    


let imageMood = [MoodPage(description: "Be Happy like live is short", imageName: "happyMood"),

                MoodPage(description: "Nothing deserve to be sad look for positive side", imageName: "sadMood"),
                MoodPage(description:  "do not be angry, calm down", imageName: "angryMood"),
                MoodPage(description: "sleep well make you start a good day", imageName: "sleepyMood")
]
        

    
    @IBAction func moodChange(_ sender: Any) {
    
    
    
labelView.text = imageMood[moodSelector.selectedMoodIndex].description
imageView.image = UIImage(named: imageMood[moodSelector.selectedMoodIndex].imageName)
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
