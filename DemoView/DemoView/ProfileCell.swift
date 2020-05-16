//
// Created by Jonathan YEUNG on 16/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import UIKit
import Kingfisher

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var hobbiesLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: Entity) {
        self.firstNameLabel.text = data.firstName
        self.lastNameLabel.text = data.lastName
        self.hobbiesLabel.text = data.hobbies
        self.hometownLabel.text = data.hometown
        self.languageLabel.text = data.language
        self.nickNameLabel.text = data.nickName
        self.summaryLabel.text = data.summary
        
        if let url = URL(string: data.imageLink) {
            self.profileImage.kf.setImage(with: url)
        }
    }
    
}
