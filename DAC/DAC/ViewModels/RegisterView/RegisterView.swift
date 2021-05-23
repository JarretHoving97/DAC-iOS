//
//  RegisterView.swift
//  DAC
//
//  Created by Jarret hoving on 16/03/2021.
//

import SwiftUI

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    var authManager = FirebaseAuthManager()
    @State var isSnackBarPresented: Bool = false
    @State var snackbar: SnackBar? = nil

    var body: some View {
        NavigationView {
            VStack(){
                Spacer()
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(10)
                
                HStack {
                    Text("Registreer hier je DAC app account")
                        .font(.title)
                        .frame(maxWidth: UIScreen.main.bounds.size.width / 1.2)
                        .padding(.leading, 10)
                    Spacer()
                }
                RegisterFormView(email: $email, password: $password, passwordCheck: $passwordCheck)
                    .padding(20)
                
                Button(action: {
                    
                    authManager.registration(email: email, password: password, passRepeat: passwordCheck) { (success) in
                        if success {
                            
                            snackbar = SnackBar(popColor: .success, text: authManager.registrationMessage)
                        } else {
                            snackbar = SnackBar(popColor: .error, text: authManager.registrationMessage)
                        }
                    }
                        presentSnackBar(dissolveAfter: 2)
                        
                }, label: {
                    Text("Registreer")
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
        .modifier(JaHoPop(isPresented: isSnackBarPresented, alignment: .top, direction: .top, content: {
            snackbar
        }))
            
    }
    
    func presentSnackBar(dissolveAfter: Int){
    isSnackBarPresented = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(dissolveAfter)) {
            isSnackBarPresented = false
        }
    }
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
            .preferredColorScheme(.dark)
    }
}
