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
    

    let moodArray = [ MoodPage(description: "Today I place a bubbles of happiness around me, and nothing negative can get around!", imageName: "happy1") , MoodPage(description: "Don't be sad! you are not alone.!", imageName: "sad1"),MoodPage(description: "Look to the sky!, and take a long breath!", imageName: "angry1"), MoodPage(description: "Want me to till you a story? close your eyes!", imageName: "sleepy1")]
    
    
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
