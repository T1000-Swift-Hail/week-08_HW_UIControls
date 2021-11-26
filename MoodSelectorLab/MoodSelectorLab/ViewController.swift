//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodImageView: UIImageView!
    
    @IBOutlet weak var moodLabel: UILabel!
    
    @IBOutlet weak var moodSelector: MoodSelector!
    

    let moodArray = [ MoodPage(description: "Autumn is one of the most beautiful seasons, but hunger is a must in this season..!", imageName: "3") , MoodPage(description: "Spring is the season of happiness..", imageName: "1"),MoodPage(description: "The summer season is very hot, a season that is not popular with many people..!", imageName: "2"), MoodPage(description: "Winter is long and long nights, and there are many hibernation and long hours of sleep..", imageName: "4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        

        moodLabel.text = moodArray[moodSelector.selectedMoodIndex].description
        moodImageView.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)

}

    @IBAction func moodChanged(_ sender: Any) {
         
        moodLabel.text = moodArray[moodSelector.selectedMoodIndex].description
        moodImageView.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)
        
        moodImageView.transform = moodImageView.transform.scaledBy(x: 2, y: 2)
        moodLabel.alpha = 0
        moodLabel.center.y = view.frame.height
        
       UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
             self.moodImageView.transform = self.moodImageView.transform.scaledBy(x:0.5, y: 0.5)
             self.moodImageView.alpha = 1
       }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
             self.moodLabel?.transform = CGAffineTransform.init(translationX: 0, y: 0)
           self.moodLabel.alpha = 1

             } completion: { _ in

             }})
        
    

    }
    
    
    
}
