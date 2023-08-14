//
//  UIViews.swift
//  5. UIPicker Homework
//
//  Created by Владимир Есаян on 04.08.2023.
//

import UIKit

//MARK: - TextFields
func createTextField(textField: UITextField,
                     placeholder: String?,
                     borderStyle: UITextField.BorderStyle = .roundedRect,
                     backgroundColor: UIColor = .white,
                     translatesAutoresizingMaskIntoConstraints: Bool) {
    
    textField.placeholder = placeholder
    textField.borderStyle = borderStyle
    textField.backgroundColor = backgroundColor
    if !translatesAutoresizingMaskIntoConstraints{textField.translatesAutoresizingMaskIntoConstraints = false}
}

//MARK: -Labels
//функция для Label
func createLabel(label: UILabel,
                 text: String,
                 numberOfLines: Int = 1,
                 fontSize: CGFloat,
                 fontWeight: UIFont.Weight,
                 textColor: UIColor,
                 isCenterTextAlignment: Bool,
                 isTextSizeToFit: Bool,
                 translatesAutoresizingMaskIntoConstraints: Bool) {
    label.text = text
    if isCenterTextAlignment { label.textAlignment = .center }
    if isTextSizeToFit {label.sizeToFit()}
    if !translatesAutoresizingMaskIntoConstraints {label.translatesAutoresizingMaskIntoConstraints = false}
    label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    label.textColor = textColor
}

//MARK: - Buttons
//функции для Button
func createButton(button: UIButton,
                  title: String,
                  fontSize: CGFloat = 17,
                  fontWeight: UIFont.Weight = .heavy,
                  normalTitleColor: UIColor = .white,
                  highlightedTitleColor: UIColor = .systemGray5,
                  backgroundColor: UIColor = .systemBlue,
                  cornerRadius: CGFloat = 12,
                  translatesAutoresizingMaskIntoConstraints: Bool) {
    //текст заголовка кнопки
    button.setTitle(title, for: .normal)
    button.setTitleColor(normalTitleColor, for: .normal)
    button.setTitleColor(highlightedTitleColor, for: .highlighted)
    button.titleLabel?.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    //отключение автоматических constrait
    if !translatesAutoresizingMaskIntoConstraints {button.translatesAutoresizingMaskIntoConstraints = false}
    //фон кнопки
    button.backgroundColor = backgroundColor
    button.layer.cornerRadius = cornerRadius
}

