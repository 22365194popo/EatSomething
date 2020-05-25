//
//  ContentView.swift
//  EatSomething
//
//  Created by ＪＡＹ on 2020/5/21.
//  Copyright © 2020 Apple Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    @State var show = false
    var body: some View{
        NavigationView{
            ZStack{
                NavigationLink(destination: SignUp(show: self.$show), isActive: self.$show){
                    Text("")
                }
                .hidden()
                Login(show: self.$show)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct Login: View{
    @State var color = Color.black.opacity(0.9)
    @State var email = ""
    @State var pass = ""
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @Binding var show: Bool
    var body: some View{
        ZStack{
            ZStack(alignment: .topTrailing){
                GeometryReader{_ in
                    VStack{
                        Image("home_page_img")
                        Text("Log in to your account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(self.color)
                            .padding(.top, 5)
                        TextField("Email", text: self.$email)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 40).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                            .padding(.top, 25)
                        HStack(spacing: 15){
                            VStack{
                                if self.visible{
                                    TextField("Password", text: self.$pass)
                                }
                                else{
                                    SecureField("Password", text: self.$pass)
                                }
                            }
                            Button(action:{
                                self.visible.toggle()
                            }){
                                Image(systemName: self.visible ? "eye.slash.fill": "eye.fill").foregroundColor(self.color)
                            }
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 40).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                        HStack{
                            Spacer()
                            Button(action:{
                                
                            }){
                                Text("Forgot password")
                                    .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                            }
                        }
                        .padding(.top, 20)
                        Button(action:{
                            self.verify()
                        }){
                            Text("Log in")
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .frame(width: UIScreen.main.bounds.width - 50)
                        }
                        .background(Color("Color"))
                        .cornerRadius(40)
                        .padding(.top, 25)
                    }
                    .padding(.horizontal, 25)
                }
                Button(action:{
                    self.show.toggle()
                }){
                    Text("Register")
                        .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                }
                .padding()
            }
            if self.alert{
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    func verify(){
        if self.email != "" && self.pass != ""{
            
        }
        else{
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
    }
}

struct SignUp: View{
    @State var color = Color.black.opacity(0.9)
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @State var visible = false
    @State var revisible = false
    @Binding var show: Bool
    var body: some View{
        ZStack(alignment: .topLeading){
            GeometryReader{_ in
                VStack{
                    Image("home_page_img")
                    Text("Log in to your account")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                        .padding(.top, 5)
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 40).stroke(self.email != "" ? Color("Color") : self.color, lineWidth: 2))
                        .padding(.top, 25)
                    HStack(spacing: 15){
                        VStack{
                            if self.visible{
                                TextField("Password", text: self.$pass)
                            }
                            else{
                                SecureField("Password", text: self.$pass)
                            }
                        }
                        Button(action:{
                            self.visible.toggle()
                        }){
                            Image(systemName: self.visible ? "eye.slash.fill": "eye.fill").foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 40).stroke(self.pass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    HStack(spacing: 15){
                        VStack{
                            if self.revisible{
                                TextField("Re-enter", text: self.$repass)
                            }
                            else{
                                SecureField("Re-enter", text: self.$repass)
                            }
                        }
                        Button(action:{
                            self.revisible.toggle()
                        }){
                            Image(systemName: self.revisible ? "eye.slash.fill": "eye.fill").foregroundColor(self.color)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 40).stroke(self.repass != "" ? Color("Color") : self.color, lineWidth: 2))
                    .padding(.top, 25)
                    Button(action:{
                        
                    }){
                        Text("Register")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(RoundedRectangle(cornerRadius: 40).foregroundColor(Color("Color")))
                    .cornerRadius(10)
                    .padding(.top, 25)
                }
                .padding(.horizontal, 25)
            }
            Button(action:{
                self.show.toggle()
            }){
                Image(systemName: "chevron.left")
                    .font(.title)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct ErrorView: View{
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    var body: some View{
        GeometryReader{_ in
            VStack{
                HStack{
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    Spacer()
                }
                .padding(.horizontal, 25)
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                Button(action:{
                    self.alert.toggle()
                }){
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                }
                .background(RoundedRectangle(cornerRadius:40)).foregroundColor(Color("Color"))
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(25)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}
