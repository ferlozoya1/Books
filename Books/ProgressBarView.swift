//
//  ProgressBarView.swift
//  Books
//
//  Created by Fernanda Lozoya Navarro on 16/11/23.
//



import SwiftUI

//struct ArcShape: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        
//        let center = CGPoint(x: rect.midX, y: rect.midY)
//        let radius = min(rect.width, rect.height) / 2
//        
//        path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
//        
//        return path
//    }
//}
//
//struct ProgressBar: View {
//    var body: some View {
//        VStack {
//            ArcShape(startAngle: .degrees(180), endAngle: .degrees(0))
//                .stroke(Color.blue, lineWidth: 5)
//                .frame(width: 200, height: 200)
//        }
//    }
//}


struct ProgressBarArc: View {
    @State private var progress: CGFloat = 0.0
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var selectedNumber : Int = 1
    
    @Environment(\.defaultMinListRowHeight) var minRowHeight
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes =
        [.font: UIFont(descriptor:
                        UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
            .withDesign(.serif)!, size: 48)]
    }
    
    var body: some View {
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
                
//                                        if selectedNumber != 0 {
//                                            withAnimation(.linear(duration: 5)) {
//                                                progress = 1.0
//                                            }
//                                        }
            }
            .frame(width: 300, height: 300)
            .padding()
            
        }
        .padding()
    }
}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProgressBarArc()
//    }
//}

#Preview {
    ProgressBarArc()
}


