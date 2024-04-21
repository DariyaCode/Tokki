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
    Course(title: "Beggining", subtitle: "3 sections - 15 minutes", text: "History of language", image: "Illustration 5", background: "Background 5", logo: "Logo 2"),
    Course(title: "Korean A1 course!", subtitle: "2 sections - 2 hours", text: "The base of Alphabet", image: "Illustration 3", background: "Background 4", logo: "Logo 4"),
    Course(title: "Korean words", subtitle: "20 sections - 5 hours", text: "Wordbook", image: "Illustration 1", background: "Background 1", logo: "Logo 1"),
    Course(title: "Korean grammar", subtitle: "20 sections - 4 hours", text: "Grammas", image: "Illustration 2", background: "Background 9", logo: "Logo 3")
]

var courses = [
    Course(title: "Word list", subtitle: "16 sections - 3 hours", text: "Learning  new words", image: "Illustration 5", background: "Background 9", logo: "Logo 2"),
    Course(title: "Reading", subtitle: "14 sections - 2 hours", text: "Prowiding your manhwa's", image: "Illustration 3", background: "Background 8", logo: "Logo 4"),
    Course(title: "Workbook", subtitle: "21 sections - 4 hours", text: "Challenge yourself!", image: "Illustration 1", background: "Background 3", logo: "Logo 1"),
    Course(title: "Exersices", subtitle: "20 sections - 4 hours", text: "Challenge yourself! pt2", image: "Illustration 2", background: "Background 10", logo: "Logo 3")
]
