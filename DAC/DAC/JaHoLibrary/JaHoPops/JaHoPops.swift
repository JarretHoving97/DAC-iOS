//
//  JaHoPops.swift
//  DAC
//
//  Created by Jarret hoving on 18/03/2021.
//

import SwiftUI

struct SnackBar: View {

    let popColor: PopColors
    let text: String
    
    var body: some View {
        HStack(){
            VStack{
                Text(text)
                    .foregroundColor(.white)
                    .font(.title3)
            }
        }
        .frame(width: UIScreen.main.bounds.size.width - 40, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .background(popColor.color() )
        .cornerRadius(10)
    }
}


extension SnackBar {
    enum PopColors {
        case note, success, error
        func color() -> Color {
            switch self {
            case .error:
                return Color.red
            case .note:
                return Color.orange
            case .success:
                return Color.green
            }
        }
    }
}

//View modifier is a view you can apply to other views. Ideal for pop-ups or 'snackbars'
struct JaHoPop<T: View>: ViewModifier {
    let popup: T
    var isPresented: Bool
    let alignment: Alignment
    let direction: Direction
    
//  The popup is initialized with two arguments. The isPresented flag means whether the popup is currently visible onscreen. The content closure produces the popup sheet. It is marked with the @ViewBuilder attribute that enables us to use the SwiftUI declarative DSL.
    init(isPresented: Bool, alignment: Alignment, direction: Direction, @ViewBuilder content: () -> T)  {
        self.alignment = alignment
        self.direction = direction
        self.isPresented = isPresented
        popup = content()
    }
    
    //In the body() method we add the popup as an overlay to the parent view.
     func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }
    
    
//    GeometryReader eagerly takes all available space provided by its parent view. The popup within GeometryReader is shown or hidden based on the isPresented property. We specify frame() to correctly size and position the popup within the geometry reader.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .animation(.spring())
                    .transition(.offset(x: 0, y: direction.offset(popupFrame: geometry.frame(in: .global))))
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: alignment)

            }
        }
    }
}

//Calculate the popup position below the screen edge.
extension JaHoPop {
    enum Direction {
        case top, bottom

        func offset(popupFrame: CGRect) -> CGFloat {
            switch self {
            case .top:
                let aboveScreenEdge = -popupFrame.maxY
                return aboveScreenEdge
            case .bottom:
                let belowScreenEdge = UIScreen.main.bounds.height - popupFrame.minY
                return belowScreenEdge
            }
        }
    }
}


