//
//  MyPageModelViewController.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/21/24.
//

import UIKit
import SnapKit

class MyPageModalViewController: UIViewController {

    var term: String = ""
    var receivedItem: Item = Item(word: "", pos: "", sense: [])
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .black
        button.addTarget(MyPageModalViewController.self, action: #selector(returnWord), for: .touchUpInside)
        return button
    }()
    
    @objc func returnWord() {
        self.dismiss(animated: true)
    }
    
    lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.text = term
        label.textColor = .white
        label.font = UIFont.pretendard(size: 32, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var pronunciationLabel: UILabel = {
        let label = UILabel()
        label.text = "미국식 [ wɜːrld ] 영국식 [ wɜːld ]"
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let stackview: UIStackView = {
        let stv = UIStackView()
        stv.axis = .vertical
        return stv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "mainBtn")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        NetworkManager().fetchAPIExactWord(query: term) { item in
            self.receivedItem = item
        }
        
        setupViews()
        setStackView(item: receivedItem)
    }
    
    func setupViews() {
        view.addSubview(closeButton)
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.left.equalTo(view).offset(16)
            
        }
        view.addSubview(wordLabel)
        wordLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(20)
        }
        view.addSubview(pronunciationLabel)
        pronunciationLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(120)
        }
        view.addSubview(stackview)
        stackview.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(127)
            make.leading.equalToSuperview().offset(20)
        }
    }

    func setStackView(item: Item) {
        item.sense.forEach { senseElement in
            let label = UILabel()
            label.numberOfLines = 0
            label.text = "\(senseElement.senseOrder). \(item.pos)  \(senseElement.transWord)"
            label.textAlignment = .center
            label.textColor = .white
            
            stackview.addArrangedSubview(label)
        }
    }
}

