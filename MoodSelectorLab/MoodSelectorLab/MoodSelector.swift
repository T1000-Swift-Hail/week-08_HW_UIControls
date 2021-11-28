//
//  MoodSelector.swift
//  MoodSelectorLab
//
//  Created by Akeel Al-Ead on 25/11/2021.
//

import UIKit


enum Mood : String {
    case happy
    case sad
    case angry
    case sleepy
}



class MoodSelector: UIControl {

    @IBAction func ViewImoje(_ sender: Any) {
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    private let moods : [Mood] = [.happy, .sad, .angry, .sleepy]
    
    var selectedMoodIndex = 0 {
        didSet {
            animateBackView()
        }
    }
    
    private let moodStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        return stackView
    }()
    
    
    private let backView : UIView = {
        
        let newView = UIView()
        newView.backgroundColor = UIColor(named: "happy")
        
        return newView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureViews()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.cornerRadius = backView.bounds.width / 2
        //print(backView.bounds.width)
       
    }
    
 
    
    
    private func configureViews(){
        
        self.addSubview(backView)
        self.addSubview(moodStackView)
        moodStackView.translatesAutoresizingMaskIntoConstraints = false
        moodStackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        moodStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        moodStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        moodStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //moodStackView.backgroundColor  = UIColor.blue
        configureButtons()
        
        
    }
    
    
    private func configureButtons(){
        
        for mood in moods {
            
            let smileyButton = UIButton()
            smileyButton.translatesAutoresizingMaskIntoConstraints = false
            smileyButton.setImage(UIImage(named: mood.rawValue), for: .normal)
            smileyButton.imageView?.contentMode = .scaleAspectFit
            smileyButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            
            moodStackView.addArrangedSubview(smileyButton)
            
            smileyButton.heightAnchor.constraint(equalTo: moodStackView.heightAnchor, constant: -50).isActive = true
            smileyButton.widthAnchor.constraint(equalTo: moodStackView.heightAnchor, constant: -50).isActive = true
            smileyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        }
        
        
        backView.widthAnchor.constraint(equalTo: moodStackView.subviews.first!.widthAnchor, constant: 10).isActive = true
        backView.heightAnchor.constraint(equalTo: moodStackView.subviews.first!.heightAnchor, constant: 10).isActive = true
        backView.centerYAnchor.constraint(equalTo: moodStackView.subviews.first!.centerYAnchor).isActive = true
        backView.centerXAnchor.constraint(equalTo: moodStackView.subviews.first!.centerXAnchor).isActive = true

        
    }
    
    
    private func animateBackView(){
        
        UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
            self.backView.transform.tx = self.moodStackView.subviews[self.selectedMoodIndex].frame.origin.x
            self.backView.backgroundColor = UIColor(named:self.moods[self.selectedMoodIndex].rawValue)
        }, completion: nil)
        
    }
    
    @objc func buttonTapped(_ sender : UIButton){
        
        selectedMoodIndex = moodStackView.subviews.firstIndex(of: sender) ?? 0
        
        sendActions(for: .valueChanged)
    }

}
