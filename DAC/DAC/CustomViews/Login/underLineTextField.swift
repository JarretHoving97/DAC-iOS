//
//  LoginTextFieldView.swift
//  DAC
//
//  Created by Jarret hoving on 15/03/2021.
//

import SwiftUI

protocol textFieldProtocol: View{
    var text: String {get set}
    var placeholder: String {get set}
    
}

struct underLineTextField: View {
    //@Binding lets us declare that one value actually comes from elsewhere, and should be shared
    //in both places.
    @Binding var text: String
    let placeholder: String

    
    var body: some View {
        
        VStack(alignment: .leading) {
                Text(placeholder)
                    .padding(.top, 10)
            TextField(placeholder, text: $text)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("borderColor"))
                .padding(.bottom, 10)
        }
    }
}

struct underLineSecureField: textFieldProtocol {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        
        VStack(alignment: .leading) {
                Text(placeholder)
                    .padding(.top, 10)
            SecureField(placeholder, text: $text)
            Rectangle()
                .frame(height: 1)
                .foregroundColor(Color("borderColor"))
                .padding(.bottom, 10)
        }
    }
}

//struct LoginTextFieldView_Previews: PreviewProvider {
//
//    static var previews: some View {
//        LoginTextFieldView(text: $userEmail, placeholder: "Email")
//    }
//}
