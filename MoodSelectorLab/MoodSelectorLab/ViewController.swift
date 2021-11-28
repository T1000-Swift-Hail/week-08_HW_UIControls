//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var labelView: UILabel!
    
    @IBOutlet weak var moodStack: MoodSelector!
    
    
    let pagesView = [MoodPage(description: "Be Happy Don't worry", imageName: "images-2"), MoodPage(description: "Life is Short Don't lose it ", imageName: "download-1"),   MoodPage(description: "Angry is Not Good For Your Healthy ", imageName:"images"), MoodPage(description: "Make Fone Goo With Yo", imageName: "images-1")]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func changeView(_ sender: Any) {
        
        setupMood()
        
        func setupMood() {
            labelView.text = pagesView[moodStack.selectedMoodIndex].description
            imageView.image = UIImage(named: pagesView[moodStack.selectedMoodIndex].imageName)
            
            imageView.transform = imageView.transform.scaledBy( x: 2, y: 2)
            
            imageView.alpha = 0
           
            let label = labelView.transform
            labelView.transform = labelView.transform.translatedBy(x: -view.frame.width, y: 0)
            
            let anim = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut){
                
                self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
                
                self.imageView.alpha = 1
                self .labelView.transform = label
                self.imageView.transform = .identity
                
            }
            anim.startAnimation()
        }
    
    }
    
}

