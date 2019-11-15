//
//  LabelCell.swift
//  WaterfallLayout
//
//  Created by yuxiao on 2019/11/15.
//  Copyright © 2019 yuxiao. All rights reserved.
//

import UIKit

class LabelCell: UICollectionViewCell {
    private let label: UILabel
    
    override init(frame: CGRect) {
        label = UILabel(frame: .zero)
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        label.font = .systemFont(ofSize: 24)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    func configWith(string: String) {
        label.text = string
    }
}
