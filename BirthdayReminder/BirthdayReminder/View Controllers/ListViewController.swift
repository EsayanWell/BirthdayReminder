//
//  SecondViewController.swift
//  5. UIPicker Homework
//
//  Created by Владимир Есаян on 18.07.2023.
//

import UIKit

//MARK: - создание второго SecondViewController
class ListViewController: UIViewController {
    
    //MARK: - Создаем константы для второго экрана
    //birthday label
    private let birthdayLabel = UILabel()
    
    //MARK: - ViewDidLoad method 2
    override func viewDidLoad() {
        super.viewDidLoad()
        //название экрана, которое отображается на втором экране
        title = "Birthday"
        //назначаем цвет фона SecondViewController
        view.backgroundColor = .white
        //создаем кнопку добавить(вызов функции)
        configureItems()
        //делаем переход со 2 экрана на 1
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(goBack))
        
    }
    
    //MARK: - кнопка + слева сверху
    private func configureItems() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapPlusButton))
    }
    
    //MARK: - обработчик нажатия на кнопку "Back"
    //устанавливаем связь для перехода на следуюший view после нажатия на "checkButton"
    @objc private func goBack() {
        dismiss(animated: true)
    }
    //функция перехода на следущий экран
    @objc func didTapPlusButton() {
        let rootVC = ProfileViewController()
        let thirdVC = UINavigationController(rootViewController: rootVC)
        //метод, который отображает второй экран полностью(не как карту)
        thirdVC.modalPresentationStyle = .formSheet
        present(thirdVC, animated: true)
    }
}



