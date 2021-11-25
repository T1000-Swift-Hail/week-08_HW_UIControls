//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pageImageShow: UIImageView!
    
    @IBOutlet weak var pageDescriptionLbl: UILabel!
    
    @IBOutlet weak var moodSelector: MoodSelector!
    
    
    let moodArray = [ MoodPage(description: "🌼 A beautiful feeling that makes everything around me amazing 🌼", imageName: "happy1") , MoodPage(description: "🍃 What you feel, will pass it's just a matter of time 🍃", imageName: "sad1"),MoodPage(description: "🚨 Pay attention to what you are going to do and sey it , otherwise you will regret it.", imageName: "angry1"), MoodPage(description: "🌘 All you will see in your dreams are either wishes or fears. 🌒", imageName: "sleepy1")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageDescriptionLbl.text = moodArray[moodSelector.selectedMoodIndex].description
        pageImageShow.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)
        
    }
    
    @IBAction func moodsChanged(_ sender: Any) {
        
        pageDescriptionLbl.text = moodArray[moodSelector.selectedMoodIndex].description
        pageImageShow.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)
        
        pageImageShow.transform = pageImageShow.transform.scaledBy(x: 2, y: 2)
        pageDescriptionLbl.alpha = 0
        pageDescriptionLbl.center.y = view.frame.height
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseIn], animations: {
            self.pageImageShow.transform = self.pageImageShow.transform.scaledBy(x:0.5, y: 0.5)
            self.pageImageShow.alpha = 1
        }, completion: { _ in    UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
            self.pageDescriptionLbl?.transform = CGAffineTransform.init(translationX: 0, y: 0)
            self.pageDescriptionLbl.alpha = 1
            
        } completion: { _ in
            
        }})
    }
}
