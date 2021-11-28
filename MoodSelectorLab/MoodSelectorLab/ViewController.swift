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
    @IBOutlet weak var textView: MoodSelector!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        labelView.text = reactionMood[textView.selectedMoodIndex].description
            imageView.image = UIImage(named: reactionMood[textView.selectedMoodIndex].imageName)
          }
          // “When CR7 lose the match he is sad “, imageName: “crSad.jpeg”)
          let reactionMood = [MoodPage(description: "Keep Smilling you have great day", imageName: "smile1"),
                  MoodPage(description: "Dont be sad you have beauiful face with smile", imageName: "sad1"),
                  MoodPage(description: "Calma Calma Calma the life is easy", imageName: "angry1"),
                  MoodPage(description: "have a nice dream", imageName: "sleep1")
          ]
          @IBAction func moodChange(_ sender: Any) {
            labelView.text = reactionMood[textView.selectedMoodIndex].description
            imageView.image = UIImage(named: reactionMood[textView.selectedMoodIndex].imageName)
            imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
            labelView.alpha = 0
            labelView.center.y = view.frame.height
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
              self.imageView.transform = self.imageView.transform.scaledBy(x:0.5, y: 0.5)
              self.imageView.alpha = 1
            }, completion: { _ in  UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
              self.labelView?.transform = CGAffineTransform.init(translationX: 0, y: 0)
             self.labelView.alpha = 1
              } completion: { _ in
              }})
          }
        }
