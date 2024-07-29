//
//  AttractionsView.swift
//  Attractions
//
//  Created by Anna on 24.07.2024.
//

import SwiftUI

struct AttractionsView: View {
    
    @StateObject private var viewModel: AttractionViewModel = AttractionService.shared.container.resolve(AttractionViewModel.self)!
    
    @State private var showingNewAttractionView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.attractions, id: \.self) { attraction in
                    NavigationLink(destination: AttractionDetailView(attraction: attraction)) {
                        HStack {
                            Image(attraction.image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                            VStack(alignment: .leading, spacing: 4) {
                                Text(attraction.name)
                                    .font(.headline)
                                Text(attraction.subDescription)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .onDelete { indexSet in
                    viewModel.attractions.remove(atOffsets: indexSet)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Места")
            .navigationBarItems(trailing: Button(action: {
                showingNewAttractionView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingNewAttractionView) {
                NewAttractionView(viewModel: AttractionViewModel(), name: "", description: "", subDescription: "")
            }
        }
    }
}

struct AttractionsView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionsView()
    }
}
