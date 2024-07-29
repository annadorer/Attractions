//
//  AttractionDetailView.swift
//  Attractions
//
//  Created by Anna on 23.07.2024.
//

import SwiftUI

struct AttractionDetailView: View {
    
    @State var attraction: AttractionModel
    
    var body: some View {
        VStack {
            Image(attraction.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(attraction.name)
                .font(.system(size: 35))
                .font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center)
                .padding(.bottom, 8)
            Text(attraction.description)
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .padding(.all, 24)
    }
}

struct AttractionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionDetailView(attraction: AttractionModel(name: "Река Енисей", description: "Река Енисей — известная всему миру природная достопримечательность города. Самая полноводная река в России и седьмая в мире, Енисей поражает своей мощью многих приезжих.", subDescription: "qwe", image: "Enisey"))
    }
}
