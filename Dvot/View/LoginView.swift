//
//  LoginView.swift
//  Dvot
//
//  Created by Eduard Serban on 13/07/2022.
//

import SwiftUI
import ToastUI
import NavigationStack

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    @State private var presentingToast: Bool = false
    @State private var toastMessage: String = ""
    
    @EnvironmentObject private var navigationStack: NavigationStack

    
    var body: some View {
        ZStack {
            Color("primary")
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
            VStack(spacing: 20) {
                Text("Connexion")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                SecureField("Mot de passe", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                Button(action: {
                    if email != "" && password != "" {
                        AuthService.login(with: email, and: password) { response in
                            if response.error {
                                presentingToast = true
                                toastMessage = "Identifiants invalides"
                            } else {
                                guard let dataArray = response.data as? [[String: Any]],
                                      let token = dataArray[0]["token"] as? String else {
                                          return
                                      }
                                    ApiServices.TOKEN = token
                                    ApiServices.USER = User.fromDict(dataArray[1])
                                    DispatchQueue.main.async {
                                        if ApiServices.TOKEN == "" || ApiServices.USER == nil{
                                            presentingToast = true
                                            toastMessage = "Identifiants invalides"
                                            return
                                        }
                                        self.navigationStack.push(HomePageView())
                                    }
                            }
                        }
                    } else {
                        presentingToast = true
                        toastMessage = "Veuilleuez remplir tous les champs"
                    }
                 }) {
                   Text("Se Connecter")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        if #available(iOS 15.0, *) {
            LoginView()
                .previewInterfaceOrientation(.landscapeLeft)
        } else {
            // Fallback on earlier versions
        }
    }
}
