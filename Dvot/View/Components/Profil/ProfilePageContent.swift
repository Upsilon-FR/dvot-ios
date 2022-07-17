//
//  ProfilePageContent.swift
//  Dvot
//
//  Created by Eduard Serban on 14/07/2022.
//

import SwiftUI
import ToastUI
import NavigationStack

struct ProfilePageContent: View {
    
    @State private var presentingToast: Bool = false
    @State private var toastMessage: String = ""
    
    @EnvironmentObject private var navigationStack: NavigationStack
    
    var body: some View {
        ZStack{
            Color(.white)
                .ignoresSafeArea()
            VStack(alignment: .leading, spacing: 30) {
                Text(ApiServices.USER!.lastName + " " + ApiServices.USER!.firstName)
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text("Mail: " + ApiServices.USER!.mail)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Nom: " + ApiServices.USER!.lastName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Prénom: " + ApiServices.USER!.firstName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Date de Naissance: " + ApiServices.USER!.birthDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Lieu de Naissance: " + ApiServices.USER!.birthPlace)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Genre: " + ApiServices.USER!.gender)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Spacer()
                Button {
                    AuthService.logout { response in
                        if response.error {
                            presentingToast = true
                            toastMessage = response.message
                            return
                        }
                        presentingToast = true
                        toastMessage = "Déconnexion réussie"
                        ApiServices.TOKEN = ""
                        ApiServices.USER = nil
                        sleep(3)
                        DispatchQueue.main.async {
                            self.navigationStack.pop(to: .root)
                        }
                    }
                } label: {
                    Text("Se Déconnecter")
                        .foregroundColor(.red)
                        .font(.title)
                        .fontWeight(.bold)
                }
                .toast(isPresented: $presentingToast, dismissAfter: 2.0) {
                  print("Toast dismissed")
                } content: {
                    ToastView(toastMessage)
                }
            }
            .padding(.vertical, 100)
        }
    }
}

struct ProfilePageContent_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageContent()
    }
}
