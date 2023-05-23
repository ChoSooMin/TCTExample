//
//  MainTableViewCell.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell, UITableViewCreatable {

    static let identifier = "MainTableViewCell"
    

    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var groupLb: UILabel!

    
    @IBOutlet weak var groupBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(item: Group) {
        groupLb.text = item.group_name
        
        item.member.forEach { _ in
            let memberView = MemberView()
            stackView.addArrangedSubview(memberView)
            
            memberView.snp.makeConstraints {
                $0.edges.equalToSuperview()
                $0.height.equalTo(100)
            }
        }
        
    }
}


class MemberView: UIView {
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
      let label = UILabel()
      label.textColor = .black
      label.font = .systemFont(ofSize: 24)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
    
    init() {
        super.init(frame: .zero)
//        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        self.addSubview(imageView)
        self.addSubview(titleLabel)

        imageView.snp.makeConstraints {
            $0.width.height.equalTo(50)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
            $0.centerY.equalToSuperview()
        }
    }
}
