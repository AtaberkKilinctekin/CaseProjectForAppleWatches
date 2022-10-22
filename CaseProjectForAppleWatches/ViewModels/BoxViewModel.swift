//
//  BoxViewModel.swift
//  CaseProjectForAppleWatches
//
//  Created by Ataberk on 22.10.2022.
//

import Foundation
import SwiftUI

class BoxViewModel: ObservableObject {
    
    @Published var boxes = [BoxModel]()
    
    init() {
        if(!hasBoxes()){
            getBoxes()
        }
        
    }
    
    func getBoxes() {
        for _ in 0...299 {
            boxes.append(BoxModel(colorCode: Int.random(in: 1...3), number: 0))
        }
    }
    func hasBoxes() -> Bool {
        if(boxes.count != 0) {
            return true
        }
        return false
    }
    
}
