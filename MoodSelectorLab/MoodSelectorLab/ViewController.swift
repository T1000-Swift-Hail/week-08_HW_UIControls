//
//  ViewController.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodImageView: UIImageView!
    @IBOutlet weak var moodDescLabel: UILabel!
    @IBOutlet weak var moodSwingsSelector: MoodSelector!
    
    
    let moodSwings:[MoodPage] = [MoodPage(description: "Be happy with what you have, be excited about what you want.", imageName: "happyImage"),
    MoodPage(description: "Hearts will never be practical until they are made unbreakable.", imageName: "sadImage"),
    MoodPage(description: "Anger doesn't solve anything, but it destroy everything.", imageName: "angryImage"),
    MoodPage(description: "Sleep is an investment in Energy you need, to be effective tomorrow, Good night!", imageName: "sleepyImage")]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMoods()
        animations()
    }

    @IBAction func showMoodSwings(_ sender: MoodSelector) {
        setupMoods()
        animations()
        
    }
    
    
    func setupMoods() {
        moodDescLabel.text = moodSwings[moodSwingsSelector.selectedMoodIndex].description
        moodImageView.image = UIImage(named: moodSwings[moodSwingsSelector.selectedMoodIndex].imageName)
    }
    
    func animations(){
        moodImageView.transform = moodImageView.transform.scaledBy(x: 2, y: 2)
        moodImageView.alpha = 0.5
        let originalLabel = moodDescLabel.transform
        moodDescLabel.transform = moodDescLabel.transform.translatedBy(x: -view.frame.width, y: 0)
        
        let animator = UIViewPropertyAnimator(duration: 0.4, curve: .easeOut) {
            self.moodImageView.transform = self.moodImageView.transform.scaledBy(x: 0.5, y: 0.5)
            self.moodImageView.alpha = 1
            self.moodDescLabel.transform = originalLabel
            self.moodImageView.transform = .identity
        }
        animator.startAnimation()
    }
    
}

