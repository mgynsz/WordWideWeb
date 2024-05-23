//
//  InvitationData.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/21/24.
//

import Foundation


struct InvitationData {
    let id: String    // 흠.. 필요할까? 회의 때 물어보자..
    let ownerId: String    //
    let photoURL: String?
    let title: String
    let dueDate: String
    let createdAt: String
    let words: [String]
    var open = false
}

