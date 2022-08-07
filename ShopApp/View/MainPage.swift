//
//  MainPage.swift
//  ShopApp
//
//  Created by Istiaque Ahamed on 3/7/22.
//

import SwiftUI
import Firebase



struct MainPage: View {
    
   
   @State var logStatus: Bool = true
    
    var body: some View {
        
        if logStatus {
            
            mainPageContent
            
        }else {
            
            Home()
        }
        
    }
 
        
        var mainPageContent: some View {
            
            
            VStack (spacing : 20) {
                
            Text ("Welcome Home")
                    .fontWeight(.regular)
                    .font(.title2)
                    .foregroundColor(.black)
              
                
                Button (action: {
                    
                    try? Auth.auth().signOut()
                    logStatus = false
                    print("user has susccessfully logged out")
                    
                }, label: {
                    
                    
                    Text("Logout")
                        .font(.system(size: 15,weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color("dark"))
                        .clipShape(Rectangle())
                        .cornerRadius(5)
                    
                    // Shadow...
                        .shadow(color: Color("lightBlue").opacity(0.6), radius: 5, x: 0, y: 0)
                    
                    
                })
                
                .frame(maxWidth: .infinity, alignment: .bottom)
                .padding(.top, 10)
                
                
            }
        }
        
    }



    



    
    
   
    
    
    


struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
