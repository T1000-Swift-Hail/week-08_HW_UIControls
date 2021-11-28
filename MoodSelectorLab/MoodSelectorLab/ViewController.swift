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
    @IBOutlet weak var Views: MoodSelector!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lableView.text = imageHilal[Views.selectedMoodIndex].description
        imageView.image = UIImage(named: imageHilal[Views.selectedMoodIndex].imageName)
   
    }
    
    let imageHilal = [MoodPage(description: "Berara", imageName: "BERERA"),
    MoodPage(description: "CAREIO", imageName: "CAREIO"),MoodPage(description: "GOMEZ", imageName: "GOMEZ"), MoodPage(description: "SALEEM", imageName: "SALEEM")
            
    
    ]
    
    @IBAction func ViewsAction(_ sender: Any) {
        
        
        lableView.text = imageHilal[Views.selectedMoodIndex].description
        imageView.image = UIImage(named: imageHilal[Views.selectedMoodIndex].imageName)
        
        imageView.transform = imageView.transform.scaledBy(x: 2, y: 2)
        lableView.alpha = 1
        lableView.center.y = view.frame.height
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            
            self.imageView.transform = self.imageView.transform.scaledBy(x:0.5, y: 0.5)
            self.imageView.alpha = 1
        }, completion: { _ in    UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.lableView?.transform = CGAffineTransform.init(translationX: 0, y: 0)
          self.lableView.alpha = 1

            } completion: { _ in

            }})
    }
    

    
}

