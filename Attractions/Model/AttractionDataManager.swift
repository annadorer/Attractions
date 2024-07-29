//
//  AttractionDataManager.swift
//  Attractions
//
//  Created by Anna on 23.07.2024.
//

import Foundation

// MARK: Singleton

class AttractionDataManager {
    
    //Единственный экземпляр класса, который доступен глобально
    static let shared = AttractionDataManager()
    
    //Приватный инициализатор необходим, чтобы другие экземпляры класса не создавались
    private init() {}
    
    private(set) var attractions: [AttractionModel] = [
        AttractionModel(name: "Река Енисей",
                        description: "Река Енисей — известная всему миру природная достопримечательность города. Самая полноводная река в России и седьмая в мире, Енисей поражает своей мощью многих приезжих.",
                        subDescription: "Настоящая река жизни, связывающая воедино земли Красноярского края, Тувы и Хакасии",
                        image: "Enisey"),
        AttractionModel(name: "Заповедник «Столбы»",
                        description: "Основной достопримечательностью заповедника «Столбы» являются большие скалы причудливой формы, многие из которых имеют собственные названия, такие как Львиные ворота, Перья, Гриф, Беркут, Дед. Пешие прогулки по тропинкам заповедника — популярный способ отдыха среди красноярцев и гостей города.",
                        subDescription: "Старейший и самый посещаемый национальный парк со скалами причудливых форм и уникальных названий",
                        image: "Stolby"),
        AttractionModel(name: "Часовня Параскевы Пятницы",
                        description: "Часовня построена в 1855 г. на месте деревянной сторожевой вышки, на которой несли караул казаки — первые поселенцы Красноярска. В память об этом десять лет назад здесь была установлена пушка, которая сигнальным выстрелом ежедневно оповещает красноярцев о наступление полудня.",
                        subDescription: "Всеми известная часовня, ведь она изображена на 10-рублевой банкноте",
                        image: "Chasovnya")]
    
    func addAttractions(name: String, description: String, subDescription: String, image: String) {
        let newAttraction = AttractionModel(name: name, description: description, subDescription: subDescription, image: image)
        attractions.append(newAttraction)
    }
}
