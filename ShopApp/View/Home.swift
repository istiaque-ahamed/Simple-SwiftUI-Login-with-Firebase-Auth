//
//  Home.swift
//  ShopApp
//
//  Created by Istiaque Ahamed on 2/7/22.
//
//
//  Login.swift
//  ShopApp
//
//  Created by Istiaque Ahamed on 2/7/22.

import SwiftUI
import Firebase




struct Home: View {
    
    
    @State var maxCircleHeight: CGFloat = 0
    @State var showSignUp = false
    @State var userIsLoggedIn = false
    
    
    
    var body: some View {
        
        if userIsLoggedIn {
            
            MainPage()
            
        }else {
            
            loginSignupPage
        }
    }
    
        
    var loginSignupPage: some View {
            
            VStack{
                
                //Top ring View...
                // Max Height will be width of the screen...
                
                //why geometry render..??
                //Since height will vary for different screen..
                //so in order to get the height we used...
                
                GeometryReader{proxy -> AnyView in
                    
                
                    let height = proxy.frame(in: .global).height
                    
                    DispatchQueue.main.async {
                        if maxCircleHeight == 0 {
                            maxCircleHeight = height
                        }
                    }
                    
                    return AnyView(
                        
                        
                        ZStack {
                            
                            Circle()
                                .fill(Color("orange"))
                                .offset(x: getRect().width / 2, y: -height / 1.0)
                            
                            Circle()
                                .fill(Color("orange"))
                                .offset(x: -getRect().width / 2, y: -height / 1.8)

                            Circle()
                                .fill(Color("gray"))
                                .offset(y: -height / 1.3)
                                .rotationEffect(.init(degrees: -5))
                            
                        })
                    
            }
                
                .frame(maxHeight: getRect().width)
                
                
                ZStack{
                    
                    // Transitions...
                    if showSignUp{
                        
                        SignUp()
                        
                            .transition(.move(edge: .leading))
                    }else {
                        Login()
                            .transition(.move(edge: .leading))
                        
                    }
                    
                }
             
                
                // removing unwanted space...
                
                .padding(.top, -maxCircleHeight / (getRect().height < 750 ? 1.5 : 1.6))
                .frame(maxHeight: .infinity, alignment: .top)
            }
            
            .overlay(
            
                HStack {
                    
                    Text(showSignUp ? "Already Member" : "Don't have an account")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        
                        withAnimation{showSignUp.toggle()
                            
                        }
                    }, label: {
                    
                        Text(showSignUp ? "Sign In" : "Sign Up")
                        .fontWeight(.bold)
                        .foregroundColor(Color("lightBlue"))
             
                })
            
             }
                
                    .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
                
                ,alignment: .bottom
            )
        
        
        
            .onAppear {
                
                Auth.auth().addStateDidChangeListener{ auth, user in
                    
                    if user != nil {
                        
                        userIsLoggedIn.toggle()
                    }
                }
            }
        
        
        
        
        
        
        
            
            
            .background(
               
                 HStack{
                    
                    Circle()
                        .fill(Color("gray"))
                        .frame(width: 70, height: 70)
                        .offset(x: -30, y: getRect().height < 750 ? 10 : 0)
                    
                    Spacer(minLength: 0)
                    
                    Circle()
                        .fill(Color("orange"))
                        .frame(width: 110, height: 110)
                        .offset(x: 40, y: 20)
                        
                    
                }
                 
                    .offset(y: getSafeArea().bottom + 30)
                
                ,alignment: .bottom
            
            )
   
            
        }

    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}


//Extending view to get screen size
extension View {
    
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
    
    
    // Getting Safe Area....
    func getSafeArea() -> UIEdgeInsets {
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets (top: 0, left: 0, bottom: 0, right: 0)
    }
}
