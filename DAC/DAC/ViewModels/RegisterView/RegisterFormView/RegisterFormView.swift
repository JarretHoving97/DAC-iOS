//
//  RegisterFormView.swift
//  DAC
//
//  Created by Jarret hoving on 16/03/2021.
//

import SwiftUI

struct RegisterFormView: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var passwordCheck: String
    
    
    var body: some View {
        VStack(){
            //users email input
            underLineTextField(text: $email, placeholder: "Email")
            underLineTextField(text: $password, placeholder: "Wachtwoord")
            underLineTextField(text: $passwordCheck, placeholder: "Herhaal wachtwoord")
        }
    }
}

//struct RegisterFormView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterFormView(email: <#Binding<String>#>, password: <#Binding<String>#>, passwordCheck: <#Binding<String>#>)
//    }
//}
