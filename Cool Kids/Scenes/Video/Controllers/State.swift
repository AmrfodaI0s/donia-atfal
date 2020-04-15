//
//  State.swift
//  Cool Kids
//
//  Created by Eslam on 4/15/20.
//  Copyright © 2020 ioslam. All rights reserved.
//


enum State {
    case closed
    case opened
}

extension State {
    var opposite : State {
        switch self {
        case .opened : return .closed
        case .closed : return .opened
        }
    }
}
