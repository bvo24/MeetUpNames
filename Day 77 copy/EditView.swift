//
//  EditView.swift
//  Day 77 copy
//
//  Created by Brian Vo on 5/18/24.
//

import SwiftUI

struct EditView: View {
    
    @State var name = ""
    @State var photo : Image
    @State var people : [Person]
    @Environment(\.dismiss) var dismiss
    let savePath = URL.documentsDirectory.appending(path: "peoplelist")
    
    var body: some View {
        NavigationStack{
            Form{
//                Image(uiImage: photo)
//                    .resizable()
//                    .scaledToFit()
                photo
                    .resizable()
                    .scaledToFit()
                
                TextField("Who is this?", text: $name)
                
                
            }
            .toolbar{
                ToolbarItem(placement: .confirmationAction){
                    Button("Save"){
//                        let data = try JSONEncoder().encode(locations)
//                        try data.write(to:savePath, options: [.atomic, .completeFileProtection])
//
                        do{
                            let data = try JSONEncoder().encode(people)
                            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
                            //let url = URL.documentsDirectory.appending(path: "list.txt")
                        }catch{
                            print("Unable to save person")
                        }
                        
                        
//                        let person = Person(name: name, picute: photo)
                        
                        
//                        let item = Expense(name: name, type: type, amount: amount)
//                        modelContext.insert(item)
//
//                        //expenses.items.append(item)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction){
                    Button("Cancel"){
                        dismiss()
                    }
                }
                
            }
            
            
        }
        
        
        
        
    }
    
    
    
    }


#Preview {
    
    let list = [Person]()
    return EditView( photo: Image("borf"), people: list)
}
