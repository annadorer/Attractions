//
//  AttractionViewModel.swift
//  Attractions
//
//  Created by Anna on 23.07.2024.
//


import Combine
import PhotosUI
import SwiftUI

// MARK: Observer

//Класс для отслеживания изменений в данных о достопримечательностях
class AttractionViewModel: ObservableObject {
    
    @Published var attractions: [AttractionModel] = AttractionDataManager.shared.attractions
    
    private var cancellable: AnyCancellable?
    
    init() {
        cancellable = NotificationCenter.default.publisher(for: .attractionsUpdated)
            .sink { [weak self] _ in
                self?.attractions = AttractionDataManager.shared.attractions
            }
    }
    
    func addAttraction(name: String, description: String, subDescription: String, image: PhotosPickerItem?) {
        AttractionDataManager.shared.addAttractions(name: name, description: description, subDescription: subDescription, image: "")
        NotificationCenter.default.post(name: .attractionsUpdated, object: nil)
        }
}

extension Notification.Name {
    static let attractionsUpdated = Notification.Name("attractionsUpdated")
}
