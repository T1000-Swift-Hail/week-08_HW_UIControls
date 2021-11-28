//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var imagViwe: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var moodSelector: MoodSelector!
    
    let arrayMood: [MoodPage] = [MoodPage(description: "Always be happy.. life will go on..!", imageName: "3"),
        MoodPage(description: "Don't worry and don't be sad..everything will be fine", imageName: "1"),
        MoodPage(description: "Anger is more useful than despair .. ", imageName: "2"),
        MoodPage(description: "Peace of mind is the greatest blessing..", imageName: "4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = arrayMood[moodSelector.selectedMoodIndex].description
        imagViwe.image = UIImage(named: arrayMood[moodSelector.selectedMoodIndex].imageName)
    }
    
    @IBAction func Changed(_ sender: Any) {
        
        label.text = arrayMood[moodSelector.selectedMoodIndex].description
        imagViwe.image = UIImage(named: arrayMood[moodSelector.selectedMoodIndex].imageName)
        
        imagViwe.transform = imagViwe.transform.scaledBy(x: 2, y: 2)
        label.alpha = 0
        label.center.y = view.frame.height
        
       UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
             self.imagViwe.transform = self.imagViwe.transform.scaledBy(x:0.5, y: 0.5)
             self.imagViwe.alpha = 1
       }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
           self.label?.transform = CGAffineTransform.init(translationX: 0, y: 0)
         self.label.alpha = 1

           } completion: { _ in

           }})

    }
    
}

