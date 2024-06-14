//
//  CourseView.swift
//  Tokki
//
//  Created by Dariya Gecher on 16.05.2024.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    var course: Course = courses[0]
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDraggable = true
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .onAppear{ model.showDetail = true}
            .onDisappear { model.showDetail = false }
            .background(Color("Background"))
            .mask(RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous))
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture( isDraggable ? drag : nil )
            .ignoresSafeArea()
            
            button
            
        }
        .onAppear{
            fadeIn()
        }
        .onChange(of: show){ newValue in
            fadeOut()
        }
    }
    
    var cover: some View{
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack{
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundStyle(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .padding(20)
                    .frame(maxWidth: 500)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : 0)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(y: scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask(
                RoundedRectangle(cornerRadius: appear[0] ? 0 : 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.6 : 0)
            )
        }
        .frame(height: 500)
    }
    
    var content: some View{
        VStack(alignment: .leading, spacing: 30) {
            Text("Korean language")
                .font(.title3).fontWeight(.medium)
            Text("First course")
                .font(.title).bold()
            Text("Korean, one of the oldest languages in the world, has a rich history dating back thousands of years. Its origins are attributed to Altaic languages such as Mongolian and Turkic. However, over the centuries, the Korean language has been influenced by Chinese culture and writing. It is important to note that during various periods of Korean history, including the times of the Three Kingdoms (57 BCE-668 CE) and Goguryeo (37 BCE-668 CE), the Korean language has been shaped and developed, enriched with new linguistic elements.")
            Text("During the Three Kingdoms era, the territory of modern Korea was divided into three states: Goguryeo (Goguryeo), Baekgyo (Baekgyo), and Silla (Shilla). During this period, the Korean language began its journey toward stabilization and development as a distinct linguistic pattern. It was a time of active exchange of cultural and linguistic influences with neighboring powers, including China and Japan. One of the most important events that shaped the character of the Korean language was the creation of Hangul in the 15th century during the reign of King Seungdeok. Hangul was created to give the Korean people access to writing without the need to use Chinese characters, which greatly simplified education and allowed Koreans to become more familiar with writing. After the unification of Korea into a single state in 668 A.D. by the Silla Dynasty, the Korean language continued its development while maintaining its uniqueness and identity. ")
            Text("Popular language")
                .font(.title).bold()
            Text("During this period, the first written works in Korean, such as poems, chronicles, and historical documents, began to appear, helping to spread the language among the population. In the following centuries, the Korean language continued to evolve under the influence of various historical events, including invasions and occupations by China and Japan. However, despite these external influences, the Korean language remained a key element of the national identity and cultural heritage of the Korean people. As a result of all these historical changes and influences, the Korean language has become what we see today - a rich, expressive and unique language that continues to attract attention and interest both at home and abroad.")
        }
        .padding(20)
    }
    var button: some View{
        Button {
            withAnimation(.closeCard){
                show.toggle()
                model.showDetail.toggle()
            }
        } label : {
            Image(systemName: "xmark")
                .font(.body.weight(.bold))
                .foregroundColor(.secondary)
                .padding(8)
                .background(.ultraThinMaterial, in: Circle())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
        .padding(20)
        .ignoresSafeArea()
    }
    
    var overlayContent: some View{
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .font(.largeTitle.weight(.bold))
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            Divider()
                .opacity(appear[0] ? 1 : 0)
            HStack{
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in:
                                    RoundedRectangle(
                                        cornerRadius: 18, style: .continuous)
                    )
                    .strokeStyle(cornerRadius: 18)
                Text("Taught Dariya Gecher")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask(RoundedRectangle(
                    cornerRadius: 30, style: .continuous)
                )
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
        
    }
    
    var drag: some Gesture {
        
        DragGesture(minimumDistance: 30, coordinateSpace: .local).onEnded { value in
            guard value.translation.width > 0 else { return }
            
            if value.startLocation.x < 100{
                withAnimation(.closeCard){
                    viewState = value.translation
                }
            }
            
            if viewState.width > 120 {
                close()
            }
        }
        .onEnded{ value in
            if viewState.width > 80 {
                close()
            } else {
                withAnimation(.closeCard) {
                    viewState = .zero
                }
            }
        }
    }
    
    func fadeIn(){
        withAnimation(.easeInOut(duration: 0.3)){
            appear[0] = true
        }
        withAnimation(.easeInOut(duration: 0.4)){
            appear[1] = true
        }
        withAnimation(.easeInOut(duration: 0.5)){
            appear[2] = true
        }
    }
    
    func fadeOut(){
        appear[0] = false
        appear[1] = false
        appear[2] = false
    }
    
    func close(){
        withAnimation(.closeCard.delay(0.3)){
            show.toggle()
            model.showDetail.toggle()
        }
        
        withAnimation(.closeCard){
            viewState = .zero
        }
        
        isDraggable = false
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
            .environmentObject(Model())
    }
}
