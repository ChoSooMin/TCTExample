//
//  DeliveryListTableViewCell.swift
//  Exercise2
//
//  Created by 조수민 on 2023/05/23.
//

import UIKit

class DeliveryListTableViewCell: UITableViewCell, UITableViewCreatable {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var shopImageView: UIImageView!
    
    @IBOutlet weak var shopNameLabel: UILabel!
    
    @IBOutlet weak var adImageView: UIImageView!
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    @IBOutlet weak var reviewNumberLabel: UILabel!
    
    // MARK: - property
    
    static let identifier = "DeliveryListTableViewCell"
    
    // MARK: - life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func setData(_ shop: Shop) {
        shopImageView.image = UIImage(named: shop.imageFile)
        shopNameLabel.text = shop.name
        gradeLabel.text = "\(shop.point)"
        reviewNumberLabel.text = "\(shop.review)"
    }

}
