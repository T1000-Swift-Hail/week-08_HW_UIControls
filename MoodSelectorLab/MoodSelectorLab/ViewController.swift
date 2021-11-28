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
    @IBOutlet weak var moodView: MoodSelector!
    
    let arrMood = [MoodPage(description:"Live your life with contentment and satisfaction and you will be the happiest person", imageName: "happy1"), MoodPage(description: "However difficult life may seem, there is always something you can do and succeed at", imageName: "sad1") , MoodPage(description: "The more anger towards the past you carry in your heart, the less capable you are of lovung in the present",imageName: "angry1") ,
                   MoodPage(description: "No day id so bad it can’t be fixed with a nap", imageName: "sleepy1")]
                
                                                                                                                                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      }
    
    
         
    @IBAction func viewFace(_ sender: Any) {
        setupMood()


        
          func setupMood() {
            labelView.text = arrMood[moodView.selectedMoodIndex].description
            imageView.image = UIImage(named: arrMood[moodView.selectedMoodIndex].imageName)
          
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
            imageView.alpha = 0
            
            let Label = labelView.transform
            labelView.transform = labelView.transform.translatedBy(x: -view.frame.width, y: 0)
           
              let anim = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut){
              self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
              self.imageView.alpha = 1
              self.labelView.transform = Label
              self.imageView.transform = .identity
            }
            anim.startAnimation()
          }
       }
    
}
    
   
