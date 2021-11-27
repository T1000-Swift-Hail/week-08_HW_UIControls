//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lableView: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var viewSmile: MoodSelector!
    

    let moodIcon:[MoodPage] = [MoodPage(description: "Every person has a sun within him, it must shine in the crises", imageName: "happyy"),
       MoodPage(description: "Do not let the behavior of other destroy tour inner peace", imageName: "saad"),
       MoodPage(description: "You have to stop doing everything that bothers you, you just have to breathe and calm down", imageName: "Angryy"),
       MoodPage(description: "Sleep is an investment in Energy you need, to be effective tomorrow, Good night!", imageName: "Sleep")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoods()
        animations()
    }

    @IBAction func moodChanged(_ sender: Any) {
        setupMoods()
        animations()
        
    }
    func setupMoods() {
        lableView.text = moodIcon[viewSmile.selectedMoodIndex].description
        imageView.image = UIImage(named: moodIcon[viewSmile.selectedMoodIndex].imageName)
      }
      
      func animations(){
          imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
          imageView.alpha = 0.5
          let originalLabel = lableView.transform
          lableView.transform = lableView.transform.translatedBy(x: -view.frame.width, y: 0)
          
          let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut) {
              self.imageView.transform = self.imageView.transform.scaledBy(x: 0.5, y: 0.5)
              self.imageView.alpha = 1
              self.lableView.transform = originalLabel
              self.imageView.transform = .identity
          }
          animator.startAnimation()
      }
      
  }


