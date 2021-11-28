//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {


    


    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var moodImageView: UIImageView!
    
    @IBOutlet weak var moodSelector: MoodSelector!


let moodArray = [ MoodPage(description: "i hope you be happy.", imageName: "happy1") , MoodPage(description: "Smile even if you are sad.", imageName: "sad1"),MoodPage(description: "Drink coffee and paper.", imageName: "angry1"), MoodPage(description: " Close your and sleep . ", imageName: "sleepy1")]

    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    


    
        moodLabel.text = moodArray[moodSelector.selectedMoodIndex].description
        moodImageView.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)
    
}
    
    
@IBAction func moodsChanged(_ sender: Any) {
    
    moodLabel.text = moodArray[moodSelector.selectedMoodIndex].description
    moodImageView.image = UIImage(named: moodArray[moodSelector.selectedMoodIndex].imageName)
    
    moodImageView.transform = moodImageView.transform.scaledBy(x: 2, y: 2)
    moodLabel.alpha = 0
    moodLabel.center.y = view.frame.height
    
    UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn], animations: {
        self.moodImageView.transform = self.moodImageView.transform.scaledBy(x:0.5, y: 0.5)
        self.moodImageView.alpha = 1
    }, completion: { _ in    UIView.animate(withDuration: 2, delay: 0, options: .autoreverse) {
        self.moodLabel?.transform = CGAffineTransform.init(translationX: 0, y: 0)
        self.moodLabel.alpha = 1
        
    } completion: { _ in
        
    }})
}

}












