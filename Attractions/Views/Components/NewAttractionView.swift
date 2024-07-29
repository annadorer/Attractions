//
//  NewAttractionView.swift
//  Attractions
//
//  Created by Anna on 24.07.2024.
//

import SwiftUI
import PhotosUI

struct NewAttractionView: View {
    
    @ObservedObject var viewModel: AttractionViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var name: String
    @State var description: String
    @State var subDescription: String
    @State var image: PhotosPickerItem?
    @State var shouldPresentPhotoPicker: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10) {
                TextField("Название", text: $name)
                    .frame(width: 327, height: 50)
                    .cornerRadius(4)
                    .textFieldStyle(.roundedBorder)
                TextField("Описание", text: $description)
                    .frame(width: 327, height: 50)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(4)
                TextField("Доп. описание", text: $subDescription)
                    .frame(width: 327, height: 50)
                    .textFieldStyle(.roundedBorder)
                    .cornerRadius(4)
                Button(action: {
                    shouldPresentPhotoPicker = true;
                }, label: {
                    Text("Выбрать фото")
                })
                .photosPicker(isPresented: $shouldPresentPhotoPicker, selection: $image)
                Spacer()
            }
            .padding(.all, 24)
            .navigationBarItems(trailing: Button("Сохранить") {
                viewModel.addAttraction(name: name, description: description, subDescription: subDescription, image: image)
                            presentationMode.wrappedValue.dismiss()
                        })
        }
    }
}

struct NewAttractionView_Previews: PreviewProvider {
    static var previews: some View {
        NewAttractionView(viewModel: AttractionViewModel(), name: "", description: "", subDescription: "", image: PhotosPickerItem(itemIdentifier: ""))
    }
}
