//
//  SignupView.swift
//  2bAllDoneTutoring
//
//  Created by Andrew Nyago on 11/10/2022.
//

import SwiftUI

struct SignupView: View {
    @State var firstName = ""
    @State var lasttName = ""
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""

    @Environment(\.presentationMode) var mode

    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        ZStack{
            BackgroundGradientView()
            
            VStack{
                LogoView()
                    .padding(.bottom, 25)
                
                VStack{
                    UserTextField(text: $firstName, placeHolder: "First Name")
                    UserTextField(text: $lasttName, placeHolder: "Last Name")
                    EmailTextField(text: $email)
                    PasswordSecureField(text: $password, placeHolder: "Password")
                    PasswordSecureField(text: $confirmPassword, placeHolder: "Confirm Password")
                }
                .padding(.horizontal, 32)
                
                Button {
                    //  Sign Up Action
                    viewModel.register(withEmail: email, password: password, firstName: firstName, lastName: lasttName)
                } label: {
                    AuthenticateButtonView(text: "Sign Up")
                        .padding()
                }
                
                Spacer()
                
                Button {
                    mode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Text("Already have an Account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }.foregroundColor(.white)
                }
                .padding(.bottom, 16)
            }
            .padding(.top, 20)
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
