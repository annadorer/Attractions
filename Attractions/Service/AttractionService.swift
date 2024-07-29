//
//  AttractionService.swift
//  Attractions
//
//  Created by Anna on 28.07.2024.
//

import Foundation
import Swinject

// MARK: Dependency Injection

class AttractionService {
    
    static let shared = AttractionService()
    
    let container: Container
    
    private init() {
        
        container = Container()
        
        container.register(AttractionDataManager.self) { _ in
            AttractionDataManager.shared
        }
        
        container.register(AttractionViewModel.self) { _ in
            AttractionViewModel()
        }
    }
}
