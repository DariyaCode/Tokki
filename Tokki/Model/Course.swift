//
//  Course.swift
//  Tokki
//
//  Created by Dariya Gecher on 02.12.2023.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var featuredCourses = [
    Course(title: "SwiftUI course!", subtitle: "16 sections - 3 hours", text: "Build an appps for IPhone with SwiftUI", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design course!", subtitle: "14 sections - 2 hours", text: "Create a designs as professional", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter devs course!", subtitle: "21 sections - 4 hours", text: "Build an appps for IPhone with Flutter", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "React Hooks course!", subtitle: "20 sections - 4 hours", text: "Build an appps with React", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]

var courses = [
    Course(title: "SwiftUI course!", subtitle: "16 sections - 3 hours", text: "Build an appps for IPhone with SwiftUI", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "UI Design course!", subtitle: "14 sections - 2 hours", text: "Create a designs as professional", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Flutter devs course!", subtitle: "21 sections - 4 hours", text: "Build an appps for IPhone with Flutter", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "React Hooks course!", subtitle: "20 sections - 4 hours", text: "Build an appps with React", image: "Illustration 2", background: "Background 2", logo: "Logo 3")
]
