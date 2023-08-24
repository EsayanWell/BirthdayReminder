import UIKit

class CustomTextFiled: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let spacing: CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubview(label)
        addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: spacing),
            textField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -spacing),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
