//
//  ContentView.swift
//  LabSwiftUi2
//
//  Created by Sarah on 31/07/2023.
//
import SwiftUI
struct CardData: Identifiable {
    let id: UUID = UUID()
    let title: String
    let imageURL: String
}

struct CardView: View {
    let data: CardData
    
    var body: some View{
        
        HStack{
            
            
            VStack {
                        Text(data.title)
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .font(.title)
                        
            }
            AsyncImage(url: URL(string: data.imageURL)){ result in
                if let image = result.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(23)
                } else {
                    Rectangle()
                        .fill(Color.black.opacity(0.1))
                }
            }
        }
        .frame(height: 200)
        
        
    }
}
struct ContentView: View {
    @Environment (\.colorScheme)  var colorScheme
    @State private var opacity = 0.5
    var body: some View {
        ScrollView{
            VStack{
                CardView(data: CardData(title: "cars", imageURL: "https://source.unsplash.com/200x200/?car"))
                    .foregroundColor(Color.blue)
                    .bold()
                CardView(data: CardData(title: "flower", imageURL: "https://source.unsplash.com/200x200/?flower"))
                    .foregroundColor(Color.blue)
                    .bold()
                CardView(data: CardData(title: "cloud", imageURL: "https://source.unsplash.com/200x200/?cloud"))
                    .foregroundColor(Color.blue)
                    .bold()
                VStack {
                           Text(" click here")
                               .padding()
                               .background(.gray)
                               .opacity(opacity)

                           Slider(value: $opacity, in: 0...1)
                               .padding()
                       }
                
            }
        }
        .padding(10)
        .preferredColorScheme(colorScheme)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.colorScheme, .dark)
    }
}
