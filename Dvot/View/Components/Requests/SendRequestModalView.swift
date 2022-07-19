//
//  SendRequestModalView.swift
//  Dvot
//
//  Created by Eduard Serban on 19/07/2022.
//

import SwiftUI
import ToastUI

struct SendRequestModalView: View {
    var title: String
    
    @State private var type = ""
    @State private var description = ""
    
    @State private var presentingToast: Bool = false
    @State private var toastMessage: String = ""
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack(alignment: .leading, spacing: 20) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Sujet", text: $type)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.default)
                Text("Description")
                    .font(.body)
                    .bold()
                TextEditor(text: $description)
                    .lineLimit(100)
                    .padding()
                    .frame(height: 400)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.default)
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        if type != "" && description != "" {
                            let dateFormatter = DateFormatter()
                            dateFormatter.dateFormat = "dd/MM/yyyy"
                            
                            let request: PersonalRequest = PersonalRequest(id: nil, type: type, description: description, date: dateFormatter.string(from: Date.now), userId: ApiServices.USER!.id!, status: false, accepted: nil, treatedBy: nil, teatedDate: nil)
                            
                            RequestService.send(adminRequest: request) { response in
                                if response.error {
                                    presentingToast.toggle()
                                    toastMessage = response.message
                                    return
                                }
                                DispatchQueue.main.async {
                                    presentationMode.wrappedValue.dismiss()
                                    presentingToast.toggle()
                                    toastMessage = "Envoyé"
                                }                                
                            }
                        } else {
                            presentingToast.toggle()
                            toastMessage = "Veuillez remplir tous les champs"
                        }
                    } label: {
                        Text("Envoyer")
                             .font(.headline)
                             .fontWeight(.bold)
                             .foregroundColor(.white)
                             .padding()
                             .background(Color("primary"))
                             .cornerRadius(10)
                    }
                    .toast(isPresented: $presentingToast, dismissAfter: 2.0) {
                          print("Toast dismissed")
                        } content: {
                          ToastView(toastMessage)
                        }
                }
            }
            .padding(15)
        }
    }
}
