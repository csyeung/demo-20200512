//
// Created by Jonathan YEUNG on 17/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import UIKit
import FoldingCell

class ProfileFoldingCell: FoldingCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type: FoldingCell.AnimationType) -> TimeInterval {
        // durations count equal it itemCount
        let durations = [0.33, 0.26, 0.26, 0.35, 0.33, 0.75] // timing animation for each view
        return durations[itemIndex]
    }

    func setData(data: Entity) {
        self.firstNameLabel.text = data.firstName
        self.lastNameLabel.text = data.lastName
//        self.hobbiesLabel.text = data.hobbies
//        self.hometownLabel.text = data.hometown
//        self.languageLabel.text = data.language
//        self.nickNameLabel.text = data.nickName
        self.summaryLabel.text = data.summary
        
        if let url = URL(string: data.imageLink) {
            self.profileImage.kf.indicatorType = .activity
            DispatchQueue.main.async {
                self.profileImage.kf.setImage(with: url)
            }
        }
    }

}
