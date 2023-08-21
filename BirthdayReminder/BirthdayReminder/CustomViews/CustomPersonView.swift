//
//  CustomPersonView.swift
//  BirthdayReminder
//
//  Created by Владимир Есаян on 21.08.2023.
//
import UIKit

class CustomPersonView: UIView {
    
    //создание элементов view
    var nameLabel: UILabel = {
        var nameLabel = UILabel()
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 17, weight: .heavy)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    var dateLabel: UILabel = {
        var dateLabel = UILabel()
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.systemFont(ofSize: 15)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    var daysLabel: UILabel = {
        var daysLabel = UILabel()
        daysLabel.textColor = .gray
        daysLabel.font = UIFont.systemFont(ofSize: 17)
        daysLabel.translatesAutoresizingMaskIntoConstraints = false
        return daysLabel
    }()
    var personImage: UIImageView = {
        var personImage = UIImageView()
        personImage.layer.cornerRadius = 35
        personImage.translatesAutoresizingMaskIntoConstraints = false
        personImage.backgroundColor = .systemGray
        personImage.image = UIImage(named: "person.crop.circle.fill")
        personImage.contentMode = .scaleAspectFit
        return personImage
    }()
    
    let spacing: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Setup
    private func setup(){
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(daysLabel)
        addSubview(personImage)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 30),
            nameLabel.leadingAnchor.constraint(equalTo: personImage.trailingAnchor,constant: 5),
            
            dateLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: spacing),
            dateLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            daysLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            daysLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -25),
            
            personImage.topAnchor.constraint(equalTo: nameLabel.topAnchor,constant: -5),
            personImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            
            personImage.widthAnchor.constraint(equalToConstant: 70),
            personImage.heightAnchor.constraint(equalToConstant: 70)
        ])
    }
}
