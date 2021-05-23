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
    @State var snackbar: SnackBar? = nil

    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                
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
                            if success == true {
                                self.snackbar = SnackBar(popColor: .success, text: loginManager.loginMessage)
                            } else {
                                self.snackbar = SnackBar(popColor: .note, text: loginManager.loginMessage)
                            }
                            presentSnackBar(dissolveAfter: 2)
                        }
                    }
                }, label: {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.title2)
                    
                })
                .frame(width: UIScreen.main.bounds.size.width - 40, height: 72, alignment: .center )
                .background(Color("ThemeColor"))
                .cornerRadius(5.0)
                
                Spacer()
            }
            
            .background(Color("BackgroundColor"))
            .ignoresSafeArea()
        }
        .modifier(JaHoPop(isPresented: showAlert, alignment: .top, direction: .top, content: {
            snackbar
        }))
    }
    
    func presentSnackBar(dissolveAfter: Int){
    showAlert = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(dissolveAfter)) {
            showAlert = false
        }
    }
}




struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .preferredColorScheme(.dark)
    }
}

