//
//  CustomTableViewCell.swift
//  ToDoFinalWithoutStoryboard
//
//  Created by Yogesh Tekwani on 3/29/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    var horizontalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    var label: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    var checkBoxImageView: UIImageView = {
       let imgView = UIImageView()
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        horizontalStackView.addArrangedSubview(checkBoxImageView)
        horizontalStackView.addArrangedSubview(label)
        
        checkBoxImageView.image = UIImage(systemName: "circle")
        
        self.addSubview(horizontalStackView)
        
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        checkBoxImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10 ),
            horizontalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10 ),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor ),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor ),
            checkBoxImageView.widthAnchor.constraint(equalToConstant:25)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
