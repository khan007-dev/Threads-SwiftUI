//
//  ProfileThreadFilter.swift
//  TwitterClone
//
//  Created by Khan on 02.03.2024.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    
    case threds
    case replies
    case likes
    
    var title: String {
        switch self {
        case .threds: return "Threads"
        case .replies: return "Replies"
        case .likes : return "Likes"
        }
    }
    var  id: Int { return self.rawValue}
}
