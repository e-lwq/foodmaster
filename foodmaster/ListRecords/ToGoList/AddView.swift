//
//  AddView.swift
//  foodmaster
//
//  Created by Elizabeth Lam on 26/9/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: TGLViewModel
    @State var res: String = ""
    @State var add: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("bg_color")
                    .resizable()
                    .ignoresSafeArea()
                
                ScrollView{
                    VStack{
                        HStack{
                            Button{
                                cancelButton()
                            }label:{
                                Text("Cancel")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.leading, 30)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Button{
                                saveButton()
                            }label:{
                                Text("Save")
                                    .foregroundColor(checkText() ? .blue : .gray)
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .padding(.trailing, 30)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        Text("Add an item")
                            .foregroundColor(.black)
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.vertical)
                        
                        
                        TextField("Enter restaurant name", text: $res)
                            .frame(width: 350, height: 100)
                            .background(Color.init(red: 0.984, green: 0.988, blue: 0.996))
                            .cornerRadius(20)
                            .modifier(shadow_modifier())
                            .padding(.vertical)
                        if res.count==0{
                            Text("Please enter at least 1 character.")
                                .foregroundColor(.red)
                        }
                        
                        TextField("Enter address of restaurant", text: $add)
                            .frame(width: 350, height: 100)
                            .background(Color.init(red: 0.984, green: 0.988, blue: 0.996))
                            .cornerRadius(20)
                            .modifier(shadow_modifier())
                            .padding(.top, 70)
                        
                        if add.count==0{
                            Text("Please enter at least 1 character.")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
        }
        .navigationBarHidden(true)

    }
    
    func saveButton(){
        if checkText(){
            listViewModel.addItem(title: res, address: add)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func cancelButton(){
        presentationMode.wrappedValue.dismiss()
    }
    
    func checkText() -> Bool{
        return res.count>0 && add.count>0
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }.environmentObject(TGLViewModel())
    }
}
