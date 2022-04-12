//
//  CardStruct.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/08.
//

import Foundation

struct GuideCard: Identifiable {
    let id:             UUID
    let cardName:       String
    var image:          [String]
    let title:          String
    var guideLine:      String
    var detailGuideLine:String
    var video:          [String]
    var info:           String
    var recyclable:     [String]
    var unrecyclable:   [String]
    
    /*
     init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
     self.id = id
     self.title = title
     self.attendees = attendees
     self.lengthInMinutes = lengthInMinutes
     self.theme = theme
     }}
     */
    
    init(id: UUID = UUID(), cardName: String, image: [String], title: String, guideLine: String, detailGuideLine: String, video: [String], info: String, recyclable: [String], unrecyclable: [String]) {
        self.id                 = id
        self.cardName           = cardName
        self.image              = image
        self.title              = title
        self.guideLine          = guideLine
        self.detailGuideLine    = detailGuideLine
        self.video              = video
        self.info               = info
        self.recyclable         = recyclable
        self.unrecyclable       = unrecyclable
    }
}

extension GuideCard {
    static let sampleData: [GuideCard] =
    [
        // 샘플 데이터 - 플라스틱
        GuideCard(
            cardName: "플라스틱",
            image: ["plastic01", "plastic02"],
            title: "플라스틱은",
            guideLine: "플라스틱은 요렇게 배출합니다. 페트병과 플라스틱 용기에 든 내용물은 깨끗이 비우고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발.",
            detailGuideLine: "페트병과 플라스틱 용기에 든 내용물은 깨끗이 비우고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다.",
            video: ["비디오링크01", "비디오링크02"],
            info: "플라스틱은 이러합니다",
            recyclable: ["투명페트병", "플라스틱"],
            unrecyclable: ["빨대", "병뚜껑"]),
        
        // 샘플 데이터 - 종이 #1
        GuideCard(
            cardName: "종이",
            image: ["paper01", "paper02"],
            title: "종이는",
            guideLine: "종이는 이렇게 저렇게 요렇게 비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 제거하고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다",
            detailGuideLine: "종이는 이렇게 저렇게 요렇게 비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 제거하고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다",
            video: ["비디오링크03", "비디오링크04"],
            info: "종이는 이러합니다",
            recyclable: ["책", "A4용지"],
            unrecyclable: ["전단지", "이물질이 묻은 종이"]),
        
        // 샘플 데이터 - 종이 #2
        GuideCard(
            cardName: "종이",
            image: ["paper01", "paper02"],
            title: "종이는",
            guideLine: "종이는 이렇게 저렇게 요렇게 비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 제거하고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다",
            detailGuideLine: "종이는 이렇게 저렇게 요렇게 비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 제거하고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다",
            video: ["비디오링크03", "비디오링크04"],
            info: "종이는 이러합니다",
            recyclable: ["책", "A4용지"],
            unrecyclable: ["전단지", "이물질이 묻은 종이"]),
        
        // 샘플 데이터 - 비닐
        GuideCard(
            cardName: "비닐",
            image: ["vynyl01", "vynyl02"],
            title: "비닐은",
            guideLine: "비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 씻어내고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다.",
            detailGuideLine: "비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 제거하고 어쩌구 저쩌구 샬라샬라 재활용을 잘해라 제발 전용 수거함에 넣어 배출합니다.",
            video: ["비디오링크05", "비디오링크06"],
            info: "비닐은 이러합니다",
            recyclable: ["깨끗한 포장지", "뽁뽁이"],
            unrecyclable: ["유색비닐", "이물질이 묻은 비닐"])
    ]
}
