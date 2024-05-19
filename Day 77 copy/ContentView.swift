//
//  ContentView.swift
//  NameKeeper
//
//  Created by Brian Vo on 5/18/24.
//
import PhotosUI
import SwiftUI

struct ContentView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    @State private var editViewState = false
    
    @State private var people = [Person]()
    
    
    var body: some View {
        VStack {
//            PhotosPicker("Select a picture", selection: $pickerItem, matching: .images)
//            selectedImage?
//                .resizable()
//                .scaledToFit()
            
            PhotosPicker(selection: $pickerItem){
                if let selectedImage{
                    
                    selectedImage
                        .resizable()
                        .scaledToFit()
                    
                    
                }else{
                    ContentUnavailableView("No pictures", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                }
            }
            
            
            
        }
        .onChange(of: pickerItem){
            Task{
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
                editViewState = true
                
            }
        }
        .sheet(isPresented: $editViewState){
            if let pic = selectedImage {
                EditView(photo: pic, people: people)
            }else{
                ContentUnavailableView("No image available", systemImage: "photo", description: Text("No image to edit"))
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}

