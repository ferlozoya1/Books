//
//  ContentView.swift
//  Books
//
//  Created by Fernanda Lozoya Navarro on 14/11/23.
//

import SwiftUI



struct ContentView: View {
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var selectedNumber : Int = 1
    @State private var progress: CGFloat = 0.0
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes =
        [.font: UIFont(descriptor:
                        UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(.serif)!, size: 48)]
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack{
                    
                    ZStack{
                        LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                            .opacity(0.2)
                            .ignoresSafeArea()
                        
                        VStack (alignment: .leading){
                            Divider()
                                .padding()
                            Text("Current")
                            
                                .font(.system(.headline, design: .serif))
                            
                            HStack{
                                
                                NavigationLink(destination:{
                                    VStack {
                                        CurrentBookView(elapsedTime: $elapsedTime)
                                    }
                                    .onAppear(perform: startTimer)
                                    .onDisappear(perform: stopTimer)
                                }
                                ){
                                    Image("elPrincipito")
                                        .resizable()
                                        .frame(width: 170 ,height: 200)
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                }
                                
                                
                                VStack(alignment: .leading){
                                    Text("El Principito")
                                        .fontWeight(.medium)
                                    Text("10%")
                                        .foregroundColor(Color.gray)
                                        .padding()
                                    Image(systemName: "ellipsis")
                                        .foregroundColor(Color.gray)
                                        .padding()
                                    
                                }
                            }
                        }
                        .padding()
                        
                    }
                    Section{
                        
                        ZStack{
                            LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                                .opacity(0.2)
                                .ignoresSafeArea()
                            VStack {
                                
                                NavigationLink(destination: Text("Hola")) {
                                    
                                    Image("newThisMonthNovember")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 180)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 10)
                                    
                                }.padding()
                                
                                
                                NavigationLink(destination: Text("Hola")) {
                                    
                                    Image("romance")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 180)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 10)
                                    
                                    
                                }.padding()
                                
                                NavigationLink(destination: Text("Hola")) {
                                    
                                    Image("pasionateBiographies")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 180)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .shadow(radius: 10)
                                    
                                }.padding()
                            }
                        
                        }
                    }
                    
                    Section {
                        ZStack{
                            LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                                .opacity(0.2)
                                .ignoresSafeArea()
                            
                            VStack (alignment: .leading){
                                ScrollView(.horizontal,showsIndicators: false){
                                    HStack(spacing: 15){
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndThePhilosopher'sStoneByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                        }
                                        .padding(.leading,10)
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndTheChamberOfSecretsByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                            
                                        }
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndThePrisionerOfAzkabanByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                        }
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndTheGobletOfFireByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                        }
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndTheOrderOfThePhoenixByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                        }
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndTheHalf-bloodPrinceByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                        }
                                        NavigationLink(destination: Text("Hola")) {
                                            Image("harryPotterAndTheDeathlyHallowsByJKRowling")
                                                .resizable()
                                                .frame(width: 150 ,height: 200)
                                                .shadow(color: .black.opacity(0.8), radius: 5, x: 0, y: 10)
                                            
                                        }
                                        .padding(.trailing,20)
                                        
                                    }
                                    
                                    .scrollClipDisabled(true)
                                }
                                Divider()
                                    .padding()
                                HStack{
                                    
                                    
                                    Button("See All"){
                                        
                                    }
                                    
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.gray)
                                }
                                .padding()
                            }
                            .navigationTitle("Reading Now")
                        }
                    }
                header: {
                    HStack {
                        Text("Harry Potter Collection")
                            .font(.system(.headline, design: .serif))
                            .padding()
                        Spacer()
                    }
                }
                    ZStack{
                        LinearGradient(colors: [.white, .gray.opacity(0.7)], startPoint: .top, endPoint: .bottom)
                            .opacity(0.5)
                            .ignoresSafeArea()
                        VStack{
                            
                            Text("Reading Goals")
                                .font(.system(.largeTitle, design: .serif))
                                .fontWeight(.bold)
                            
                            
                            Text("Read every day, see your stats soar and finish more books.")
                                .font(.system(.subheadline, design: .serif))
                                .foregroundColor(Color.gray)
                                .multilineTextAlignment(.center)
                            
                            ZStack(alignment: .top){
                                
                                
                                NavigationLink(
                                    destination: AdjustGoalView( selectedNumber: $selectedNumber,elapsedTime: $elapsedTime)){
                                    VStack {
                                        ZStack {
                                            ArcShape(startAngle: .degrees(180), endAngle: .degrees(0))
                                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                .opacity(0.3)
                                                .foregroundColor(Color.gray.opacity(0.5))
                                            
                                            
                                            
                                            ArcShape(startAngle: .degrees(180), endAngle: .degrees(0))
                                                .trim(from: 0.0, to: progress)
                                                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
                                                .foregroundColor(Color.cyan)
                                                .rotationEffect(Angle(degrees: 0))
                                                .onAppear{
                                                    withAnimation(.linear(duration: 2)) {
                                                        progress = elapsedTime * 100/CGFloat(selectedNumber * 60)
                                                        print(progress, elapsedTime, selectedNumber)
                                                        progress = progress/100
                                                        
                                                    }
                                                    
                                                }
                                            
                                        }
                                        .frame(width: 300, height: 300)
                                        .padding()
                                        
                                    }
                                    .padding()
                                    .overlay(
                                        NavigationLink(destination: AdjustGoalView(selectedNumber: $selectedNumber,elapsedTime: $elapsedTime)){
                                            Rectangle() .opacity(0)
                                        }
                                    )
                                    
                                    }
                                VStack{
                                    
                                    Text("Today's Reading")
                                        .font(.system(.headline, design: .serif))
                                    
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                    
                                    Text( formattedTime(elapsedTime))
                                        .font(.system(.largeTitle, design: .serif))
                                        .fontWeight(.semibold)
                                        .multilineTextAlignment(.center)
                                    
                                    
                                    HStack {
                                        NavigationLink(
                                            destination: AdjustGoalView( selectedNumber: $selectedNumber,elapsedTime: $elapsedTime))
                                        {
                                            // Text("\(selectedNumber)")
                                            
                                            Text("of your \(selectedNumber) minute goal")
                                                .font(.body)
                                                .fontWeight(.medium)
                                                .fontDesign(.serif)
                                        }
                                    
                                        Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                        
                                    }
                                   
                                    VStack {
                                        NavigationLink{
                                            CurrentBookView(elapsedTime: $elapsedTime)
                                                .onAppear(perform: startTimer)
                                                .onDisappear(perform: stopTimer)
                                        } label: {
                                            VStack {
                                                Text("Keep reading")
                                                    .font(.subheadline)
                                                    .fontWeight(.heavy)
                                                    .foregroundStyle(
                                                        LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
                                                    )
                                                
                                                Text("El Principito")
                                                    .font(.caption)
                                                    .fontWeight(.light)
                                                    .foregroundStyle(
                                                        LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
                                                    )
                                            }
                                            
                                        }
                                        .frame(maxWidth: .infinity)
                                        .padding(.vertical)
                                        .padding(.horizontal, 30)
                                        .background(
                                            LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom)
                                        )
                                    .cornerRadius(40)
                                    }
                                    .padding()
                                }
                                .padding(.top,100)
                            }
                            
                        }
                        .padding()
                        
                    }
                    
                }
            }
            
        }
    }
   
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
struct ArcShape: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        
        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        return path
    }
}

struct ProgressBar: View {
    var body: some View {
        VStack {
            ArcShape(startAngle: .degrees(180), endAngle: .degrees(0))
                .stroke(Color.blue, lineWidth: 5)
                .frame(width: 200, height: 200)
        }
    }
}
#Preview {
    ContentView()
}
