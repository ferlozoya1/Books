//
//  AdjustGoalView.swift
//  Books
//
//  Created by Fernanda Lozoya Navarro on 16/11/23.
//

import SwiftUI



struct AdjustGoalView: View {
    
    @Binding private var selectedNumber: Int
    @State private var isShowingPickerSheet = false
    @Binding var elapsedTime: TimeInterval
    @State private var timer: Timer?
    @State private var progress: CGFloat = 0.0
    
    let numbers = Array(1...1440)
    
    
    public init(selectedNumber: Binding<Int>, elapsedTime: Binding<TimeInterval>) {
        _selectedNumber = selectedNumber
        _elapsedTime = elapsedTime
    }
    
    private func formattedTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
        }
    }

    private func stopTimer() {
        timer?.invalidate()
    }
    
    
    var body: some View {
        Spacer()
        ZStack(alignment: .top){
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
            
            VStack{
                Text( formattedTime(elapsedTime))
                    .font(.system(.largeTitle, design: .serif))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                
                Text("of your \(selectedNumber) minute goal")
                    .font(.body)
                    .fontWeight(.medium)
                    .fontDesign(.serif)
                Divider()
                    .padding()
                VStack{
                    Text("Today's Reading")
                        .font(.system(.title, design: .serif))
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                    
                    Text("\(selectedNumber) minutes to go")
                        .font(.system(.headline, design: .serif))
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.cyan)
                    
                    Text("You're on your way to reaching youy daily goal.")
                        .font(.system(.subheadline, design: .serif))
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                }
                
            }
            .padding(.top,120)
            
        }
        
        
        Spacer()
        VStack{
            
           
            Button{
              
            } label: {
                VStack {
                    Text("SHARE")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(
                            LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
                        )
                }
            }
            .frame(width: 200)
            .padding(.vertical)
            .background(
                LinearGradient(colors: [.black], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
            
            Button("ADJUST GOAL") {
                isShowingPickerSheet.toggle()
            }
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(
                LinearGradient(colors: [.primary], startPoint: .top, endPoint: .bottom)
            )
            .padding()
            .sheet(isPresented: $isShowingPickerSheet) {
                
                
                NavigationStack{
                    Divider()
                    VStack {
                       
                        ZStack {
                            Picker("Select", selection: $selectedNumber) {
                                ForEach(numbers, id: \.self) {
                                    Text("\($0)")
                                }
                            }
                            .labelsHidden()
                            .pickerStyle(WheelPickerStyle())
                            .padding()
                            HStack{
                                Spacer()
                                Text("min/day")
                                    .padding(.trailing, 100.0)
                            
                            }
                            
                            
                        }
                        
                        
                        
                        
                    }
                    .navigationTitle("Daily Reading Goal")
                    .navigationBarTitleDisplayMode(.inline)
                    
                    
                    .toolbar {
                        ToolbarItem(placement: .primaryAction) {
                            Button("Done") {
                                
                                isShowingPickerSheet.toggle()
                            }
                        }
                    }
                }
                
                
                .presentationDetents([.height(225),.large])
            }
        }
        .padding()
        
    }
    
    
}


#Preview {
    AdjustGoalView(selectedNumber: .constant(0),elapsedTime: .constant(.init()))
}
