//
//  LoginView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ZStack{
            BackgroundGradientView()
            
            VStack{
                LogoView()
                    .padding(.bottom, 25)
                
                VStack(spacing: 20){
                    EmailTextField(text: $email)
                    
                    PasswordSecureField(text: $password, placeHolder: "Password")
                }
                .padding(.horizontal, 32)
                
                HStack {
                    Spacer()
                    Button {
                        //Forgot Passwprd Action
                    } label: {
                        Text("Forgot Password")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.top)
                            .padding(.trailing, 28)
                    }
                }
                
                Button {
                    //  SignIn Action
                } label: {
                    AuthenticateButtonView(text: "Sign In")
                }
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
