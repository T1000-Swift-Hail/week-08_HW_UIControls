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
    @IBOutlet weak var moodSelectorView: MoodSelector!
    
    let myMood:[MoodPage] = [MoodPage(description: "Stay safe , happy and well.", imageName: "1"),MoodPage(description: "Be strong becuse it will get BETTER.", imageName: "2"),MoodPage(description: "Keep your smail don't be angry nothing deserve.", imageName: "3"),MoodPage(description: "Sweet Dreams", imageName: "4")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theMoods()
        animationsMoods()
    }

   
    @IBAction func theMode(_ sender: Any) {
        theMoods()
        animationsMoods()
    }
    
    fileprivate func theMoods() {
        labelView.text = myMood[moodSelectorView.selectedMoodIndex].description
        imageView.image = UIImage(named:myMood[moodSelectorView.selectedMoodIndex].imageName)
    }
    
    func animationsMoods(){
        
        
        imageView.transform = imageView.transform.rotated(by: -200)
        imageView.transform.tx = -view.frame.width
        imageView.alpha = 0.5
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        
         
        let thelabelVieww = labelView.transform
        labelView.transform = CGAffineTransform.init(translationX: -view.frame.width, y: 0)
        

         let animated = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut) {
             self.imageView.transform = self.imageView.transform.rotated(by: 200)
             self.imageView.transform.tx = 0
             self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
             self.imageView.alpha = 1
             self.labelView.transform = thelabelVieww
          
         }
        
        animated.startAnimation()
        
          }

      }
