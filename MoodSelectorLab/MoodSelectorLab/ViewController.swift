//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var pageDescLabel: UILabel!
    
    
    @IBOutlet weak var MoodSelector: MoodSelector!
    
    
    @IBOutlet weak var PageImageView: UIImageView!
    
  
        
    
    

    let moodText = [ MoodPage(description: "You are always right, don't be angry" , imageName: "angryPic" ) , MoodPage(description: "You have nice smile" , imageName: "happyPic" ) ,MoodPage(description: "don't be sad everything is fine" , imageName: "sadPic" ) ,MoodPage(description: "Have a nice dreams" , imageName: "sleepyPic" )]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func moodImg(_ sender: Any) {

    
        pageDescLabel.text = moodText[MoodSelector.selectedMoodIndex].description
        PageImageView.image = UIImage(named: moodText[MoodSelector.selectedMoodIndex].imageName)
        PageImageView.transform = PageImageView.transform.scaledBy(x: 2, y: 2)
        pageDescLabel.alpha = 0
        pageDescLabel.center.y = view.frame.height
        
        
        
        UIView.animate(withDuration: 0.4, delay: 0 , options: [.curveEaseOut], animations: {
            self.PageImageView.transform = self.PageImageView.transform.scaledBy(x: 0.5, y: 0.5)
            self.PageImageView.alpha = 1
        }, completion: { _ in UIView.animate(withDuration: 1, delay: 0 , options: .curveEaseIn ) {
            self.pageDescLabel?.transform = CGAffineTransform.init(translationX: 0, y: 0 )
            self.pageDescLabel.alpha = 1
        } completion: { _ in
            
            
        } })
    }

}
