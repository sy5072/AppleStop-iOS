//
//  ViewRouter.swift
//  AppleStop
//
//  Created by Seungyun Kim on 2022/04/11.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .home
}

enum Page {
    case home
    case camera
    case guide
}
