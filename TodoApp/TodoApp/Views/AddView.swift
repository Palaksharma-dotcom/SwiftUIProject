//
//  AddView.swift
//  TodoApp
//
//  Created by Rapipay on 10/04/23.
//
 
import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var listViewModel: ListViewModel
    @State var text: String = ""
    @State var showAlert: Bool = false
    @State var alertTitle: String = ""
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                TextField("add item", text: $text)
                    
                    .padding(.horizontal)
                    .frame(height:55)
                    
                    .background(Color(.gray)).opacity(0.2)
                    
                    .cornerRadius(10)
                CustomButton(btnAction:{
                    saveButtonData()},
                            btntitle: "Save")
//                Button(action:
//                   saveButtonData
//                , label: {
//                    Text("save")
//                        .foregroundColor(.white)
//                        .font(.headline)
//
//                        .frame(height: 45)
//                        .frame(maxWidth: .infinity)
//                        .background(Color.blue)
//                        //
//                        .cornerRadius(10)
//                })
//
            }.padding(10)
            
        }
        .navigationTitle(Text("Add Item"))
        .alert(isPresented: $showAlert, content: getAlert)

    }
    func saveButtonData(){
        if isValidContent() == true {
        
            listViewModel.addItems(title: text)
            presentationMode.wrappedValue.dismiss()
        }
//        to exit the addview after clicking on save button
    }
    func isValidContent() -> Bool{
        if text.count > 3{
            return true
        }
        else{
//            alertTitle = "content sholuld be more than 3 characters long"
//            showAlert.toggle()
            return false
        }
        
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView(listViewModel: ListViewModel())
        }.environmentObject(ListViewModel())
    }
}
