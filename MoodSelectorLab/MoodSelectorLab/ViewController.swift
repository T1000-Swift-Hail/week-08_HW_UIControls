//
//  ViewController.swift
//  MoodSelectorLab
// }
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var moodStack: MoodSelector!
    @IBOutlet weak var pagesImages: UIImageView!
    

    let arrMood = [MoodPage(description:"You cannot protect yourself from sadness without protecting yourself from happiness", imageName: "happyImage"), MoodPage(description:"The walls we build around us to keep sadness out also keeps out the joy", imageName: "sadImage"), MoodPage(description:"Sometimes, you have to get angry to get things done", imageName: "angerImage"), MoodPage(description:"Early to rise, early to bed, makes a man healthy, wealthy, and dead", imageName: "sleepyImage")]
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMood()
    }
    
    @IBAction func viewFaceAction(_ sender: Any) {
        setupMood()
    }
    
        func setupMood(){
            
            lblDescription.text = arrMood[moodStack.selectedMoodIndex].description
            pagesImages.image = UIImage(named: arrMood[moodStack.selectedMoodIndex].imageName)
            
            pagesImages.transform = pagesImages.transform.scaledBy(x: 2, y: 2)
            pagesImages.alpha = 1
            
            lblDescription.translatesAutoresizingMaskIntoConstraints = false
//            let Label = lblDescription.transform
//            lblDescription.transform = lblDescription.transform.translatedBy(x: -view.frame.width, y: 0)
//
            let animate = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut){
                self.pagesImages.transform = self.pagesImages.transform.scaledBy(x: 0.5, y: 0.5)
                   
                //self.lblDescription.transform = Label
                self.pagesImages.transform = .identity
            
            }
            animate.startAnimation()
            
    }
   
}

