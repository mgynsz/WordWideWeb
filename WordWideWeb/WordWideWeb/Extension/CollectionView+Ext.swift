//
//  CollectionView+Ext.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/21/24.
//

import UIKit


// 단어장 데이터가 없을 때(0) 나타나는 메시지
extension UICollectionView {

    func setEmptyMsg(_ msg: String) {
        let msgLabel: UILabel = {
            let label = UILabel()
            label.text = "There is no wordbook created."
            label.textColor = .black
            label.numberOfLines = 0
            label.textAlignment = .center
            label.font = UIFont.pretendard(size: 18, weight: .regular)
            label.sizeToFit()
            return label
        }()
        self.backgroundView = msgLabel
    }

    func restore() {
        self.backgroundView = nil
    }
}
