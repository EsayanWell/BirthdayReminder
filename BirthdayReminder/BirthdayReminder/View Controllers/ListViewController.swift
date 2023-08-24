//
//  SecondViewController.swift
//  5. UIPicker Homework
//
//  Created by Владимир Есаян on 18.07.2023.
//

import UIKit

//MARK: - создание второго SecondViewController
class ListViewController: UIViewController {
    
    //MARK: - Views
    //birthday label
    private let birthdayLabel = UILabel()
    //создаем scrollView
    private let listScrollView = UIScrollView()
    //создаем contentView
    private let listStackView = UIStackView()
    //создаем label
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //функция настроек
        setupLayout()
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
        //MARK: -создаем экземпляры анкет
        let firstPerson = CustomPersonView()
        firstPerson.nameLabel.text = "Jeremy"
        firstPerson.daysLabel.text = "18 дней"
        firstPerson.dateLabel.text = "10 марта, в среду исполнится 25 лет"
        listStackView.addArrangedSubview(firstPerson)
        
        let secondPerson = CustomPersonView()
        secondPerson.nameLabel.text = "Maria Lui"
        secondPerson.daysLabel.text = "28 дней"
        secondPerson.dateLabel.text = "30 марта, в четверг исполнится 20 лет"
        listStackView.addArrangedSubview(secondPerson)
        
        let thirdPerson = CustomPersonView()
        thirdPerson.nameLabel.text = "Jony Stark"
        thirdPerson.daysLabel.text = "53 дня"
        thirdPerson.dateLabel.text = "20 апреля, в субботу исполнится 25 лет"
        listStackView.addArrangedSubview(thirdPerson)
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
//расширение для ListViewController
private extension ListViewController {
    //функция с функциями
    func setupLayout() {
        configureScrollView()
        configureStackView()
        prepareScrollView()
    }
    //настройка scrollView
    func configureScrollView() {
        listScrollView.translatesAutoresizingMaskIntoConstraints = false
        //вертикальный индикатор прокрутки будет отображаться, когда содержимое `listScrollView` превысит размер просмотра
        listScrollView.showsVerticalScrollIndicator = true
        //позволяет всегда иметь возможность вертикальной прокрутки, даже если его содержимое не превышает размеры просмотра.
        listScrollView.alwaysBounceVertical = true
    }
    //настройка stackView
    func configureStackView() {
        listStackView.translatesAutoresizingMaskIntoConstraints = false
        //отображение элементов
        listStackView.axis = .vertical
        //расстояние между элементами
        listStackView.spacing = 100
        
    }
    //подготовка scrollView
    func prepareScrollView() {
        //добавляем scrollView на view
        view.addSubview(listScrollView)
        //добавляем контейнер на scrollView
        listScrollView.addSubview(listStackView)
        //устанавливаем constraits
        NSLayoutConstraint.activate([
            listScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listScrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            listScrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            listScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            listStackView.topAnchor.constraint(equalTo: listScrollView.topAnchor),
            listStackView.leadingAnchor.constraint(equalTo: listScrollView.leadingAnchor),
            listStackView.trailingAnchor.constraint(equalTo: listScrollView.trailingAnchor),
            listStackView.bottomAnchor.constraint(equalTo: listScrollView.bottomAnchor),
            listStackView.widthAnchor.constraint(equalTo: listScrollView.widthAnchor)
        ])
    }
}
