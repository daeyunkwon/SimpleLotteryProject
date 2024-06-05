//
//  ViewController.swift
//  SimpleLotteryProject
//
//  Created by 권대윤 on 6/5/24.
//

import UIKit

import Alamofire
import SnapKit

final class ViewController: UIViewController {
    
    //MARK: - Properties
    
    var rounds: [Int] = Array(1...1122)
    
    
    //MARK: - UI Components
    
    private let roundNumberTextField: UITextField = {
        let tf = UITextField()
        tf.textColor = .label
        tf.backgroundColor = .systemBackground
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.systemGray5.cgColor
        tf.layer.cornerRadius = 5
        tf.textAlignment = .center
        return tf
    }()
    
    private let infoTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .label
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textColor = .gray
        return label
    }()
    
    private let winningNumbersInfoLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let firstNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customYellow()
        label.clipsToBounds = true
        return label
    }()
    
    private let secondNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customBlue()
        label.clipsToBounds = true
        return label
    }()
    
    private let thirdNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customBlue()
        label.clipsToBounds = true
        return label
    }()
    
    private let fourthNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customRed()
        label.clipsToBounds = true
        return label
    }()
    
    private let fifthNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customRed()
        label.clipsToBounds = true
        return label
    }()
    
    private let sixthNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customGray()
        label.clipsToBounds = true
        return label
    }()
    
    private let plusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.clipsToBounds = true
        return label
    }()
    
    private let bonusNumberLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = UIColor.customGray()
        label.clipsToBounds = true
        return label
    }()
    
    private let bonusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeCircularNumberLabel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureUI()
        configureTextField()
    }
    
    private func configureLayout() {
        view.addSubview(roundNumberTextField)
        roundNumberTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        let titleStackView = UIStackView(arrangedSubviews: [infoTitleLabel, dateLabel])
        titleStackView.axis = .horizontal
        titleStackView.distribution = .fillEqually
        titleStackView.spacing = 157
        titleStackView.alignment = .fill
        view.addSubview(titleStackView)
        titleStackView.snp.makeConstraints { make in
            make.top.equalTo(roundNumberTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(50)
        }
        
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints { make in
            make.top.equalTo(titleStackView.snp.bottom).offset(0)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(0.2)
        }
        
        view.addSubview(winningNumbersInfoLabel)
        winningNumbersInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(separatorView.snp.bottom).offset(25)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        
        let numberStackView = UIStackView(arrangedSubviews: [firstNumberLabel, secondNumberLabel, thirdNumberLabel, fourthNumberLabel, fifthNumberLabel, sixthNumberLabel, plusLabel, bonusNumberLabel])
        numberStackView.axis = .horizontal
        numberStackView.spacing = 5
        numberStackView.distribution = .fillEqually
        view.addSubview(numberStackView)
        numberStackView.snp.makeConstraints { make in
            make.top.equalTo(winningNumbersInfoLabel.snp.bottom).offset(15)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(15)
            make.height.equalTo(41)
        }
        
        view.addSubview(bonusLabel)
        bonusLabel.snp.makeConstraints { make in
            make.top.equalTo(numberStackView.snp.bottom).offset(5)
            make.width.equalTo(41)
            make.trailing.equalTo(numberStackView.snp.trailing).offset(0)
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .systemBackground
        
        infoTitleLabel.text = "당첨번호 안내"
        dateLabel.text = "2020-05-30 추첨"
        winningNumbersInfoLabel.text = "913회 당첨결과"
        firstNumberLabel.text = "6"
        plusLabel.text = "+"
        bonusNumberLabel.text = "40"
        bonusLabel.text = "보너스"
    }
    
    private func configureTextField() {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        roundNumberTextField.inputView = picker
        
        picker.selectRow(rounds.count-1, inComponent: 0, animated: true)
    }
    
    private func makeCircularNumberLabel() {
        [firstNumberLabel, secondNumberLabel, thirdNumberLabel, fourthNumberLabel, fifthNumberLabel, sixthNumberLabel, plusLabel, bonusNumberLabel].forEach { label in
            label.layer.cornerRadius = label.frame.width / 2
            print(label.frame.size)
        }
    }
    
    
    //MARK: - Functions
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    private func updateUIWithData(data: Lotto, round: Int) {
        guard let date = data.date,
              let firstNumber = data.drwtNo1,
              let secondNumber = data.drwtNo2,
              let thirdNumber = data.drwtNo3,
              let fourthNumber = data.drwtNo4,
              let fifthNumber = data.drwtNo5,
              let sixthNumber = data.drwtNo6,
              let bonusNumber = data.bnusNo else {return}
        
        dateLabel.text = date + "추첨"
        
        let attributed = NSMutableAttributedString(string: "\(round)회 당첨결과", attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.customYellow()])
        let text = "\(round)회 당첨결과"
        let range = NSString(string: text).range(of: "당첨결과")
        attributed.addAttributes([.foregroundColor: UIColor.label, .font: UIFont.systemFont(ofSize: 20, weight: .medium)], range: range)
        winningNumbersInfoLabel.attributedText = attributed
        
        firstNumberLabel.text = "\(firstNumber)"
        secondNumberLabel.text = "\(secondNumber)"
        thirdNumberLabel.text = "\(thirdNumber)"
        fourthNumberLabel.text = "\(fourthNumber)"
        fifthNumberLabel.text = "\(fifthNumber)"
        sixthNumberLabel.text = "\(sixthNumber)"
        bonusNumberLabel.text = "\(bonusNumber)"
    }
    
    private func callRequest(round: Int) {
        let url = APIURL.lottoURL + "\(round)"
        AF.request(url).responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let value):
                self.updateUIWithData(data: value, round: round)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

//MARK: - UIPickerViewDataSource, UIPickerViewDelegate

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return rounds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(rounds[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        callRequest(round: rounds[row])
    }
}

