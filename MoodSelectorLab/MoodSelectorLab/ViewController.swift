//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pagesImages: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var moodStack: MoodSelector!
    
    let arrMood = [MoodPage(description: "Live your life with contentment and satisfaction and you will be the happiest person", imageName: "happyImg"), MoodPage(description: "However difficult life may seem, there is always something you can do and succeed at", imageName: "sadImg") , MoodPage(description: "The more anger towards the past you carry in your heart, the less capable you are of lovung in the present", imageName: "angryImg") ,
        MoodPage(description: "No day id so bad it can't be fixed with a nap", imageName: "sleepImg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func viewFaceAction(_ sender: Any) {
        setupMood()
            
            
            func setupMood() {
                lblDescription.text = arrMood[moodStack.selectedMoodIndex].description
                pagesImages.image = UIImage(named: arrMood[moodStack.selectedMoodIndex].imageName)
            


                pagesImages.transform = pagesImages.transform.scaledBy(x: 2, y: 2)
                pagesImages.alpha = 0
//                lblDescription.center.y = view.frame.height
                let Label = lblDescription.transform
                lblDescription.transform = lblDescription.transform.translatedBy(x: -view.frame.width, y: 0)
                
                let anim = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut){
                    self.pagesImages.transform = self.pagesImages.transform.scaledBy(x: 0.5, y: 0.5)
                    self.pagesImages.alpha = 1
                    self.lblDescription.transform = Label
                    self.pagesImages.transform = .identity
                }
                anim.startAnimation()
            }
     }
    
}
    


