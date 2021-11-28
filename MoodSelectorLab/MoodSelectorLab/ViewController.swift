//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BackGroundImege: UIImageView!
    
    @IBOutlet weak var LabelText: UILabel!
    
    @IBOutlet weak var SelectMode: MoodSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LabelText.text = modeImeg[SelectMode.selectedMoodIndex].description
        BackGroundImege.image = UIImage(named: modeImeg[SelectMode.selectedMoodIndex].imageName)
        
    }
    // "When CR7 lose the match he is sad ", imageName: "crSad.jpeg")
    
    let modeImeg = [MoodPage(description: "Always be happy you are lucky", imageName: "happyImege"),
    
                    MoodPage(description: "Smille it is not the end of the world", imageName: "sadImege"),
                    MoodPage(description:  "Take abreath don't lose control", imageName: "angryImege"),
                    MoodPage(description: "Sweet dreams", imageName: "sleepyImege")
    ]

    @IBAction func moodChange(_ sender: Any) {
        
        
        LabelText.text = modeImeg[SelectMode.selectedMoodIndex].description
                BackGroundImege.image = UIImage(named: modeImeg[SelectMode.selectedMoodIndex].imageName)
        
                BackGroundImege.transform =         BackGroundImege.transform.scaledBy(x: 2, y: 2)
        LabelText.alpha = 0
        LabelText.center.y = view.frame.height
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            
            self.BackGroundImege.transform = self.BackGroundImege.transform.scaledBy(x:0.5, y: 0.5)
            self.BackGroundImege.alpha = 1
        }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.LabelText?.transform = CGAffineTransform.init(translationX: 0, y: 0)
          self.LabelText.alpha = 1

            } completion: { _ in

            }})
        
    }
    
}

