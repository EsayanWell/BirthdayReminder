//
//  ThirdViewController.swift
//  5. UIPicker Homework
//
//  Created by Владимир Есаян on 19.07.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Создаем константы для второго экрана
    let namePack = CustomTextFiled()
    let datePack = CustomTextFiled()
    let agePack = CustomTextFiled()
    let sexPack = CustomTextFiled()
    let instPack = CustomTextFiled()
    //picker
    private var datePicker = UIDatePicker()
    private var agePicker = UIPickerView()
    private var sexPicker = UIPickerView()
    //array for picker
    private let sexPickerArray = ["парень", "девушка" ]
    //кнопка для добавления фотографии
    private let addPhotoButton = UIButton()
    //картинка пользователя
    private let photoImageView = UIImageView()
    
    //MARK: - ViewDidLoad method 2
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        //подписка на delegate и dataSourse
        agePicker.delegate = self
        agePicker.dataSource = self
        sexPicker.delegate = self
        sexPicker.dataSource = self
        
        //вставка картинки
        //толщина линий рамки
        photoImageView.backgroundColor = .systemGray
        photoImageView.layer.borderWidth = 1
        //цвет рамки
        photoImageView.layer.borderColor = .init(red: 0.3, green: 0.1, blue: 0.32, alpha: 0.1)
        //радиус рамки
        photoImageView.layer.cornerRadius = 80
        //обрезка фото
        photoImageView.clipsToBounds = true
        //добавляем на view
        view.addSubview(photoImageView)
        //отключаем автоматические constrait
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        //задаем constait
        NSLayoutConstraint.activate([
            photoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 90),
            photoImageView.widthAnchor.constraint(equalToConstant: 160),
            photoImageView.heightAnchor.constraint(equalToConstant: 160)
        ])
        photoImageView.image = UIImage(named:"person.circle")
        photoImageView.contentMode = .scaleAspectFill
        
        //настройка кнопки добавления фото
        //название кнопки
        createButton(button: addPhotoButton,
                     title: "Изменить фото",
                     fontWeight: .medium,
                     normalTitleColor: .systemBlue,
                     backgroundColor: .white,
                     translatesAutoresizingMaskIntoConstraints: false)
        //добавлние на view
        view.addSubview(addPhotoButton)
        //установить contstrait для addPhotoButton
        NSLayoutConstraint.activate([
            addPhotoButton.centerXAnchor.constraint(equalTo: photoImageView.centerXAnchor),
            addPhotoButton.centerYAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 20)
        ])
        
        //создаем экземпляр класса
        let namePack = CustomTextFiled()
        //имя для label
        namePack.label.text = "Имя"
        //placeholder для textField
        namePack.textField.placeholder = "Введите имя"
        //добавляем на view
        view.addSubview(namePack)
        //отключение автоматических constraits
        namePack.translatesAutoresizingMaskIntoConstraints = false
        //назначаем constraits
        NSLayoutConstraint.activate([
            namePack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            namePack.centerYAnchor.constraint(equalTo: addPhotoButton.centerYAnchor, constant: 70),
            namePack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        //создаем экземпляр класса
        let datePack = CustomTextFiled()
        //имя для label
        datePack.label.text = "Дата"
        //placeholder для textField
        datePack.textField.placeholder = "Введите дату"
        //добавляем на view
        view.addSubview(datePack)
        //отключение автоматических constraits
        datePack.translatesAutoresizingMaskIntoConstraints = false
        //установить contstrait для datePack
        NSLayoutConstraint.activate([
            datePack.topAnchor.constraint(equalTo: namePack.bottomAnchor, constant: 5),
            datePack.leadingAnchor.constraint(equalTo: namePack.leadingAnchor),
            datePack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        //создаем экземпляр класса
        let agePack = CustomTextFiled()
        //имя для label
        agePack.label.text = "Возраст"
        //placeholder для textField
        agePack.textField.placeholder = "Добавить"
        //добавляем на view
        view.addSubview(agePack)
        //отключение автоматических constraits
        agePack.translatesAutoresizingMaskIntoConstraints = false
        //установить contstrait для agePack
        NSLayoutConstraint.activate([
            agePack.topAnchor.constraint(equalTo: datePack.bottomAnchor, constant: 5),
            agePack.leadingAnchor.constraint(equalTo: datePack.leadingAnchor),
            agePack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        //создаем экземпляр класса
        let sexPack = CustomTextFiled()
        //имя для label
        sexPack.label.text = "Пол"
        //placeholder для textField
        sexPack.textField.placeholder = "Добавить"
        //добавляем на view
        view.addSubview(sexPack)
        //отключение автоматических constraits
        sexPack.translatesAutoresizingMaskIntoConstraints = false
        //установить contstrait для agePack
        NSLayoutConstraint.activate([
            sexPack.topAnchor.constraint(equalTo: agePack.bottomAnchor, constant: 5),
            sexPack.leadingAnchor.constraint(equalTo: agePack.leadingAnchor),
            sexPack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        //создаем экземпляр класса
        let instPack = CustomTextFiled()
        //имя для label
        instPack.label.text = "Instagram"
        //placeholder для textField
        instPack.textField.placeholder = "Добавить"
        //добавляем на view
        view.addSubview(instPack)
        //отключение автоматических constraits
        instPack.translatesAutoresizingMaskIntoConstraints = false
        //
        instPack.textField.addTarget(self, action: #selector(didTapInstTextField), for: .editingDidBegin)
        //установить contstrait для agePack
        NSLayoutConstraint.activate([
            instPack.topAnchor.constraint(equalTo: sexPack.bottomAnchor, constant: 5),
            instPack.leadingAnchor.constraint(equalTo: sexPack.leadingAnchor),
            instPack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        //делаем переход с 3 экрана на 2
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Отмена",
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(cancel))
        
        //MARK: - Настройка "Date Picker" для текстового поля "Дата рождения"
        //привязка picker к dateTextField
        //выбор режима даты
        datePicker.datePickerMode = .date
        //добавить действие к работе Picker
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        //стиль picker
        datePicker.preferredDatePickerStyle = .wheels
        //создание распознавателя жестов
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        //добавление метода
        view.addGestureRecognizer(tapGesture)
        //появляется picker вместо клавиатуры
        datePack.textField.inputView = datePicker
        //datePack.textField.inputView = datePicker
        
        //MARK: - Настройка "Date Picker" для текстового поля "Возраст"
        agePack.textField.inputView = agePicker
        sexPack.textField.inputView = sexPicker
        agePicker.tag = 1
        sexPicker.tag = 2
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        //формат даты
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        datePack.textField.text = dateFormatter.string(from: datePicker.date)
    }
    
    //метод для срабатывания касания вне поля для выхода из Picker
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    //MARK: - обработчик нажатия на кнопку "Back"
    //устанавливаем связь для перехода на следуюший view после нажатия на "checkButton"
    @objc private func cancel() {
        dismiss(animated: true)
    }
}

//расширения для ThirdViewController (agePicker)
extension ProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    //количество столбцов
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //значения в UIPicker - заданные
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return 100
        case 2:
            return sexPickerArray.count
        default:
            return 1
        }
    }
    
    //значения в UIPicker - отображаемые
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return "\(row)"
        case 2:
            return sexPickerArray [row]
        default:
            return " "
        }
    }
    
    //метод для сохранения выбранных данных в UIPicker и их независимой работы
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            agePack.textField.text = "\(row)"
            agePack.textField.resignFirstResponder()
        case 2:
            sexPack.textField.text = sexPickerArray [row]
            sexPack.textField.resignFirstResponder()
        default:
            return
        }
    }
    
    // MARK: - Настройка "alertForInst" для текстового поля "instagram"
    @objc func didTapInstTextField() {
        //создаем Alert для Instagram
        let alertForInst = UIAlertController(title: "Введите username Instagram",message: "", preferredStyle: .alert)
        //создаем кнопку "OK"
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if self.agePack.textField.text == ""{
                self.agePack.textField.text = alertForInst.textFields?.first?.text
            }
        }
        //создаем кнопку "Cancel"
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        //добавляем текстовое поле в alert
        alertForInst.addTextField(configurationHandler: nil)
        //добавляем кнопки на alert
        alertForInst.addAction(cancelAction)
        alertForInst.addAction(okAction)
        //метод вызова сообщения
        present(alertForInst,animated: true, completion: nil)
    }
}


