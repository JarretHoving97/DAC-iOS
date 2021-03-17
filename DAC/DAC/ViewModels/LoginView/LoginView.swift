//
//  ContentView.swift
//  DAC
//
//  Created by Jarret hoving on 12/03/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth



struct LoginView: View {
    @State var userEmail: String = ""
    @State var userPass: String = ""
    @State var showAlert = false
    @State var alert = Alert(title: Text(""))
    var loginManager = FirebaseAuthManager()

    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Image("logo")

                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.size.width, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("Welkom bij de app van volleybal Dedemsvaart! Vul hier uw inloggegevens in")
                    .padding(.bottom, 20)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                
              LoginForm(userName: $userEmail, password: $userPass)
                    .padding(.trailing, 20)
                    .padding(.leading, 20)
                HStack {
                    Spacer()
                    NavigationLink(destination: RegisterView()) {
                        Text("Nog geen account?")
                            .foregroundColor(Color("SecondairyColor"))
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 20)
                    .animation(.easeIn)
                }
                
                Button(action: {
                    if !userEmail.isEmpty && !userPass.isEmpty {
                        loginManager.signIn(email: userEmail, pass: userPass) { (success) in
                            print("creds: Email: \(userEmail), pass: \(userPass)")
                            var message : String = ""
                            if success {
                                message = "Success!"
                            } else {
                                message = "Credentials invalid"
                            }
                            alert = Alert(title: Text(""), message: Text(message), dismissButton: .default(Text("Ok")))
                            showAlert = true
                        }
                    }
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title2)
                    
                })
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 72, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ )
                .background(Color("ThemeColor"))
                .cornerRadius(5.0)
              
                Spacer()
            }
            .padding(.top, 60)
          
            .ignoresSafeArea(edges: .top)
            .alert(isPresented: $showAlert, content: {
                alert
            })
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

