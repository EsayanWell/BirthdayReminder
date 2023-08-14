//
//  ViewController.swift
//  5. UIPicker Homework
//
//  Created by Владимир Есаян on 03.07.2023.
//

import UIKit

class RegistrationViewController: UIViewController {
    //MARK: - Создаем константы для основного экрана
    //добавляем картинку
    private let birthdayLabel = UILabel()
    //добавляем надпиcь Sign In
    private let signInLabel = UILabel()
    //добавляем emailLabel и passwordLabel
    private var emailLabel = UILabel()
    private let passwordLabel = UILabel()
    //добавляем faceIdLabel
    private let faceIdLabel = UILabel()
    //добавляем enterButton
    private let enterButton = UIButton()
    //добавляем emailTextField и passwordTextField
    private var emailTextField = UITextField()
    private var passwordTextField = UITextField()
    //добавляем faceIdSwitch
    private let faceIdSwitch = UISwitch()
    
    //MARK: - ViewDidLoad method
    override func viewDidLoad() {
        super.viewDidLoad()
        //цвет фона
        view.backgroundColor = .white
        
        //MARK: - Разместить логотип на первом экране
        
        createLabel(label: birthdayLabel,
                    text: "Birthday Reminder",
                    fontSize: 17,
                    fontWeight: .medium,
                    textColor: .systemBlue,
                    isCenterTextAlignment: true,
                    isTextSizeToFit: true,
                    translatesAutoresizingMaskIntoConstraints: false)
        //цвет рамки
        birthdayLabel.backgroundColor = .white
        //цвет рамки
        birthdayLabel.layer.borderColor = UIColor.gray.cgColor
        //толщина рамки
        birthdayLabel.layer.borderWidth = 1
        //добавление на view
        view.addSubview(birthdayLabel)
        //установить contstrait
        NSLayoutConstraint.activate([
            birthdayLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            birthdayLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            birthdayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            birthdayLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            birthdayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
        ])
        
        // настройка signInLabel
        createLabel(label: signInLabel,
                    text: "Sign In",
                    fontSize: 30,
                    fontWeight: .medium,
                    textColor: .black,
                    isCenterTextAlignment: false,
                    isTextSizeToFit: true,
                    translatesAutoresizingMaskIntoConstraints: false)
        //добавляем на view
        view.addSubview(signInLabel)
        //отключить автоматические constraits
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
        //установка constraits
        NSLayoutConstraint.activate([
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 55)
        ])
        
        // настройка emailLabel
        let emailPack = CustomTextFiled()
        //имя для label
        emailPack.label.text = "Email"
        //placeholder для textField
        emailPack.textField.placeholder = "example@mail.com"
        //добавляем на view
        view.addSubview(emailPack)
        //отключение автоматических constraits
        emailPack.translatesAutoresizingMaskIntoConstraints = false
        //назначаем constraits
        NSLayoutConstraint.activate([
            emailPack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            emailPack.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 30),
            emailPack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        // настройка passwordPack
        let passwordPack = CustomTextFiled()
        //имя для label
        passwordPack.label.text = "Password"
        //placeholder для textField
        passwordPack.textField.placeholder = "enter your password"
        //невидимый пароль
        passwordPack.textField.isSecureTextEntry = true
        //добавляем на view
        view.addSubview(passwordPack)
        //отключение автоматических constraits
        passwordPack.translatesAutoresizingMaskIntoConstraints = false
        //назначаем constraits
        NSLayoutConstraint.activate([
            passwordPack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordPack.topAnchor.constraint(equalTo: emailPack.bottomAnchor, constant: 10),
            passwordPack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
        
        //создание switch
        //добавить на view
        view.addSubview(faceIdSwitch)
        //отключение автоматических constraits
        faceIdSwitch.translatesAutoresizingMaskIntoConstraints = false
        //установка constrait
        NSLayoutConstraint.activate([
            faceIdSwitch.topAnchor.constraint(equalTo: passwordPack.bottomAnchor, constant: 20),
            faceIdSwitch.trailingAnchor.constraint(equalTo: passwordPack.trailingAnchor, constant: -10)
        ])
        
        //label вход по faceid
        createLabel(label: faceIdLabel,
                    text: "Вход по Face ID",
                    fontSize: 15,
                    fontWeight: .medium,
                    textColor: .black,
                    isCenterTextAlignment: false,
                    isTextSizeToFit: true,
                    translatesAutoresizingMaskIntoConstraints: false)
        //добавляем на view
        view.addSubview(faceIdLabel)
        //установка constrait
        NSLayoutConstraint.activate([
            faceIdLabel.centerYAnchor.constraint(equalTo: faceIdSwitch.centerYAnchor),
            faceIdLabel.trailingAnchor.constraint(equalTo: faceIdSwitch.leadingAnchor, constant: -15)
        ])
        
        //кнопка вход
        createButton(button: enterButton,
                     title: "Войти",
                     translatesAutoresizingMaskIntoConstraints: false)
        //добавляем кнопку на view
        view.addSubview(enterButton)
        //Добавление действия и обработчика действия к кнопке "enterButton"
        enterButton.addTarget(self, action: #selector(didTapEnterButton), for: .touchUpInside)
        //установка constraits (ограничения)
        NSLayoutConstraint.activate([
            enterButton.topAnchor.constraint(equalTo: faceIdLabel.bottomAnchor, constant: 90),
            enterButton.bottomAnchor.constraint(equalTo: faceIdLabel.bottomAnchor, constant: 140),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
    }
    //метод для перехода на второй экран после нажатия "войти"
    @objc private func didTapEnterButton() {
        let rootVC = ListViewController()
        let secondVC = UINavigationController(rootViewController: rootVC)
        //метод, который отображает второй экран полностью(не как карту)
        secondVC.modalPresentationStyle = .fullScreen
        present(secondVC, animated: true)
    }
}

