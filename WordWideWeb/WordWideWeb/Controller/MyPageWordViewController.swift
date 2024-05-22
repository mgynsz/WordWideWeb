//
//  MyPageWordViewController.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/21/24.
//

import UIKit
import SnapKit

// 단어카드 다음페이지 : 단어 리스트 페이지
class MyPageWordViewController: UIViewController, UIViewControllerTransitioningDelegate {

    var wordBook: Wordbook?
    
    private let wordViewFlowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        return layout
    }()
    
    lazy var wordsCollecView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: wordViewFlowLayout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "bgColor")
        
        setCollectionView()
        getWords()
    }
    
    private func setCollectionView() {
        wordsCollecView.register(BlockCell.self, forCellWithReuseIdentifier: "BlockCell")
        
        self.view.addSubview(wordsCollecView)
        wordsCollecView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.horizontalEdges.equalToSuperview().inset(25)
            make.bottom.equalToSuperview()
        }
    }
    
    
    private func pullUpDfn() {
        let myPageModalVC = MyPageModalViewController()
        myPageModalVC.modalPresentationStyle = .formSheet
        if let sheet = myPageModalVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(myPageModalVC, animated: true)
    }
 
    // 단어장 데이터 가져오기
    private func getWords() {
        let senderVC = MyPageVC()
        senderVC.addWordbookClosure = { data in
            self.wordBook = data
            print("received wordbook: \(String(describing: self.wordBook))")
        }
    }
}


extension MyPageWordViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let wordCount = wordBook?.wordCount else { return 1 }
        return wordCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlockCell", for: indexPath) as! BlockCell
        
        guard let term = wordBook?.words[indexPath.item].term else { return BlockCell() }
        cell.bind(text: term)   // 내가 클릭한 단어장의 단어 불러와야
        cell.term.font = UIFont.pretendard(size: 14, weight: .semibold)
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 5
        
//        let tapped = UITapGestureRecognizer(target: self, action: #selector(wordBlockTapped))
//        cell.addGestureRecognizer(tapped)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let text = wordBook?.words[indexPath.item].term else {
                    return CGSize(width: 50, height: 28) // 기본 사이즈, 텍스트가 없을 경우
                }
        let font = UIFont.systemFont(ofSize: 14)
        let textWidth = (text as NSString).size(withAttributes: [NSAttributedString.Key.font: font]).width
        let cellWidth = textWidth + 20
        return CGSize(width: cellWidth, height: 28)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let term = wordBook?.words[indexPath.item].term else { return }
        MyPageModalViewController().term = term
        
        pullUpDfn()
    }
    
}
                
