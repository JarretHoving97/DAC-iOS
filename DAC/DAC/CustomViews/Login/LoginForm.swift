//
//  LoginView.swift
//  DAC
//
//  Created by Jarret hoving on 15/03/2021.
//

import SwiftUI

struct LoginForm: View {
    //@Binding lets us declare that one value actually comes from elsewhere, and should be shared
    //in both places.
    @Binding var userName: String
    @Binding var password: String
    
    var body: some View {
            VStack(alignment: .leading){
                underLineTextField(text: $userName, placeholder: "Email")
                underLineSecureField(text: $password, placeholder: "Wachtwoord")
            }
    }
}
