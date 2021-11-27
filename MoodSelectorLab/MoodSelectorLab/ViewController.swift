//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let moodSelctor : [MoodPage] = [
    
        MoodPage(description: "Happines Is Not A Goal..It's A By Broduct Of A Life Well Lived.", imageName: "happyImage") ,
        MoodPage(description: "Life Is Too Short To Spend It At War With Yourself..", imageName: "SadImage"), MoodPage(description: "Angry doesn't Solve anything it bulilds nothing,But it can destory everything..", imageName: "angryImage"),
        MoodPage(description: "Sleep Is The Best Meditation..", imageName: "sleepImage")
      
    
    ]

    @IBOutlet weak var Descriptionlabel: UILabel!
    
    
    @IBOutlet weak var ImageView: UIImageView!
    
    
    
    
    @IBOutlet weak var ViewSmiling:MoodSelector!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func MoodChang(_ sender: Any) {
    
    
    SetUpMood()
    
    
    func SetUpMood(){
        Descriptionlabel.text = moodSelctor[ViewSmiling.selectedMoodIndex].description
        ImageView.image = UIImage(named:moodSelctor [ViewSmiling.selectedMoodIndex].imageName)
        
        ImageView.transform = ImageView.transform.scaledBy(x: 2, y: 2)
        ImageView.alpha = 0
        
        let Label1 = Descriptionlabel.transform
        Descriptionlabel.transform = Descriptionlabel.transform.translatedBy(x:-view.frame.width, y: 0)
        let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeInOut){
            self .ImageView.transform = self.ImageView.transform.scaledBy(x: 0.5, y: 0.5)
            self.ImageView.alpha = 1
            self.Descriptionlabel.transform = Label1
            self.ImageView.transform = .identity
            
            
        }
        animator.startAnimation()
        
       }
    }
}

