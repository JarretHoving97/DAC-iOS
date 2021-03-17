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
    
    var body: some View {
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
            }, label: {
                Text("Registreer")
                    .foregroundColor(.white)
                    .font(.title2)
                
            })
            .frame(width: UIScreen.main.bounds.size.width - 40, height: 72, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/ )
            .background(Color("ThemeColor"))
            .cornerRadius(5.0)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
