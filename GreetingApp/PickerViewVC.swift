//
//  PickerViewVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 22/05/23.
//

import UIKit

class PickerViewVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var colorTextField: UITextField!
    @IBOutlet weak private var dateOfBirthTextField: UITextField!
    @IBOutlet weak private var durationTextField: UITextField!
    
    //MARK: - Variables
    weak var coordinator: MainCoordinator?
    private let colors = Color.getColors()
    private let dateFormatter = DateFormatter()
    private let colorPicker: UIPickerView  = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    private let dateOfBirthPicker: UIDatePicker = {
    
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .inline
        datePicker.datePickerMode = .date
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    private let durationPicker: UIDatePicker = {
        let duration = UIDatePicker()
        duration.preferredDatePickerStyle = .wheels
        duration.translatesAutoresizingMaskIntoConstraints = false
        duration.datePickerMode = .time
        return duration
    }()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - setupView
extension PickerViewVC {
    private func setupView() {
        colorPicker.delegate = self
        colorPicker.dataSource = self
        colorTextField.inputView = colorPicker
        dateOfBirthTextField.inputView = dateOfBirthPicker
        durationTextField.inputView = durationPicker
        colorTextField.text = colors.first?.name
        dateOfBirthPicker.contentHorizontalAlignment = .center
        dateFormatter.dateFormat = AppConstants.dateFormat
        
        dateOfBirthPicker.setOnDateChangeListener {
            self.dateOfBirthTextField.text = self.dateFormatter.string(from: self.dateOfBirthPicker.date)
            self.dateOfBirthTextField.resignFirstResponder()
        }
        durationPicker.setOnDateChangeListener {
            self.durationTextField.text = self.durationPicker.date.formatted(date: .omitted, time: .standard)
            self.durationTextField.resignFirstResponder()
        }
    }
}

//MARK: - UIPickerViewDataSource
extension PickerViewVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return AppConstants.numberOfComponentsInPicker
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
}

//MARK: - UIPickerViewDelegate
extension PickerViewVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.backgroundColor = colors[row].colorName
        colorTextField.text = colors[row].name
        colorTextField.resignFirstResponder()
    }
}

//MARK: - setOnDateChangeListener
extension UIDatePicker {
    func setOnDateChangeListener(onDateChanged: @escaping () -> Void) {
        self.addAction(UIAction() { action in
            onDateChanged()
        }, for: .valueChanged)
    }
}
