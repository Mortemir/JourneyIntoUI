//
//  ViewController.swift
//  JourneyIntoUI
//
//  Created by Ян on 6/30/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var switchLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        setupMainLabel()
        setupSlider()
    }

    //MARK: - IB Actions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .blue
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .yellow
        }
    }
    
   
    @IBAction func sliderAction() {
        mainLabel.text = "\(slider.value)"
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }

    @IBAction func doneButtonPressed() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter your name")
            return
        }
        
        mainLabel.text = textField.text
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datePicker.isHidden = !sender.isOn
        switchLabel.text = sender.isOn ? "Hide Date Picker" : "Show Date Picker"
    }
    
    
    //MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = String(slider.value)
        mainLabel.font = UIFont.systemFont(ofSize: 35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.thumbTintColor = .blue
    }
}

//MARK: - UIAlertController
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okActian = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okActian)
        present(alert, animated: true)
    }
}
