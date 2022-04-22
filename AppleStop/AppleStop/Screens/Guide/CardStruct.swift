//
//  CardStruct.swift
//  AppleStop
//
//  Created by 김보영 on 2022/04/08.
//

import Foundation

struct GuideCard: Identifiable, Hashable {
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
            guideLine: "플라스틱은 재질이 다른 뚜껑이나 포장지를 분리하고 이물질을 제거하고 분리수거 배출합니다.",
            detailGuideLine: "♻️ 부착상표, 부속품 등 본체와 다른 재질은 제거한 후 배출\n♻️ 내용물을 비우고 물로 헹구는 등 이물질을 제거하여 배출\n♻️ 물로 헹굴 수 없는 구조의 용기류(치약용기 등)는 내용물을 비운 후 배출",
            video: ["비디오링크01", "비디오링크02"],
            info: "플라스틱은 이러합니다",
            recyclable: ["음료용기", "세정용기"],
            unrecyclable: ["부피가 작은 플라스틱(빨대, 라이터 등)","고무류", "병뚜껑", "완구", "전화기", "비디오테이프", "옷걸이", "전자제품", "칫솔", "파일철", "낚시대", " 재질 혼합 제품"]),
        
        // 샘플 데이터 - 종이
        GuideCard(
            cardName: "종이",
            image: ["paper01", "paper02"],
            title: "종이는",
            guideLine: "종이 박스나 골판지류의 종이는 송장 스티커나 테이프 등 이물질을 모두 제거한 후 접어서 별도로 배출해줍니다.",
            detailGuideLine: "♻️ 종이 박스나 골판지류의 종이는 송장 스티커나 테이프 등 이물질을 모두 제거한 후 접어서 별도로 배출해줍니다.\n♻️ 신문이나 책자류는 스프링이나 스테이플러심 등 종이 외에 다른 재질은 모두 제거한 후 배출해줍니다.\n♻️ 비닐코팅된 종이팩, 종이컵등은 따로 배출해줍니다.",
            video: ["비디오링크03", "비디오링크04"],
            info: "종이는 이러합니다",
            recyclable: ["종이 박스", "골판지", "커피 홀더", "A4 용지", "종이 봉투", "포장지"],
            unrecyclable: ["오염된 종이", "영수증", "코팅지나 합성수지"]),
        
        // 샘플 데이터 - 신문지/흰종이/책
        GuideCard(
            cardName: "신문지 / 흰 종이 / 책",
            image: ["paper03", "paper04"],
            title: "신문지/흰 종이/ 책은",
            guideLine: "책은 신문지, 흰 종이와 함께 분리배출",
//            ♻️ 코팅된 표지나 스프링 등 종이 외 다른 재질을 모두 제거한 후 배출\n♻️ 이물질 묻어있는 종이는 일반쓰레기\n♻️ 다른 종이들과 분리하여 신문지/흰종이/다른 재질을 모두 제거한 책끼리 배출\n
            detailGuideLine: "♻️수입되는 폐지류의 가격인하 및 수입 증가, 국내 폐지류 품질 저하, 압축장과 제지업체의 검수기준 강화 등에 따라 공동주택에서 발생하는 폐지가 압축장과 제지업체로 원활하게 유통되지 않아 폐지 수거 거부 사례가 발생\n♻️신문지는 따로 묶어 배출하는 것이 원칙이다. 신문지는 물기에 젖지 않게 반듯하게 펴서 차곡차곡 쌓아 배출",
            video: ["비디오링크03", "비디오링크04"],
            info: "종이는 이러합니다",
            recyclable: ["신문지", "흰색 종이", "다른 재질이 포함되지 않은 책/노트"],
            unrecyclable: ["다른 재질(스프링, 표지, 스테이플러 등)이 있는 종이", "이물질이 묻어있는 종이", "파쇄된 종이"]),
        
        // 샘플 데이터 - 유리병
        GuideCard(
            cardName: "유리병",
            image: ["glass01", "glass02"],
            title: "유리병은",
            guideLine: "유리병은 내용물을 비우고 물로 헹궈서 유리병에 배출하고 뚜껑은 재질(ex.캔류)에 맞게 배출합니다.",
            detailGuideLine: "♻️ 유리병은 내용물을 비우고 깨끗이 물로 헹궈서 유리병에 배출하고 뚜껑은 재질(ex.캔류)에 맞게 배출합니다.\n♻️ 겉면의 라벨은 제거할 수 있다면 제거한 후에 배출합니다.\n♻️ 소주병과 맥주병 등 빈용기 보증금 대상 유리병은 소매점에 반납하여 환급받을 수 있습니다.\n  (보증금 환불을 거부 신고 시 최대 5만원까지 보상됩니다) ",
            video: ["비디오링크03", "비디오링크04"],
            info: "유리병은 이러합니다",
            recyclable: ["술병(맥주, 소주)", "음료수병", "참기름병"],
            unrecyclable: ["혼합 재질 제품", "깨진 유리"]),
        
        // 샘플 데이터 - 스티로폼
        GuideCard(
            cardName: "스티로폼",
            image: ["styrofoam01", "styrofoam02"],
            title: "스티로폼은",
            guideLine: "스티로폼은 이물질 및 라벨을 완전히 제거한 후 투명비닐 속에 넣거나 묶어서 배출합니다. 과일, 생선상자 등은 잔재물을 비우고 물로 헹구어 배출합니다.",
            detailGuideLine: "♻️ 내용물을 비우고 물로 헹구는 등 이물질을 제거하여 배출\n♻️부착상표 등 스티로폼과 다른 재질은 제거한 후 배출\n♻️TV 등 전자제품 구입 시 완충재로 사용되는 발포합성수지 포장재는 가급적 구입처로 반납\n♻️ 폐스티로폴이 바람이 흩날리지 않도록 별도 분리 수거 용기 설치 운영",
            video: ["비디오링크03", "비디오링크04"],
            info: "스티로폼은 이러합니다",
            recyclable: ["농·수·축산물 포장용 발포스티렌상자", "전자제품 완충재로 사용되는 발포합성수지포장재"],
            unrecyclable: ["타 재질과 코팅 또는 접착된 발포스티렌", "건축용 내·외장재 스티로폼", "컵라면 용기", "1회용 용기", "폐부자와 이물질이 묻어 있거나 타재질로 코팅된 것", "이물질을 제거하기 어려운 경우"]),
        
        // 샘플 데이터 - 비닐
        GuideCard(
            cardName: "비닐",
            image: ["vynyl01", "vynyl02"],
            title: "비닐은",
            guideLine: "비닐은 이렇게 저렇게 요렇게 붙어있는 이물질을 깨끗이 씻어내고 어쩌구 저쩌구 샬라샬라 재활용을 잘해서  전용 수거함에 넣어 배출합니다.",
            detailGuideLine: "♻️ 비닐류는 물로 헹궈 이물질을 완전히 제거하여 배출\n♻️ 흩날리지않도록 투명한 비닐봉투에 담아 배출\n♻️ 이물질 제거가 어려우 경우 종량제 봉투로 배출",
            video: ["비디오링크05", "비디오링크06"],
            info: "비닐은 이러합니다",
            recyclable: ["깨끗한 포장지", "뽁뽁이", "과자 및 라면 봉지", "1회용 비닐봉투"],
            unrecyclable: ["유색비닐(청색, 검정색 등)", "이물질이 제거되지 않은 랩필름", "식탁보", "고무장갑", "장판", "돗자리", "천막", "현수막"])
    ]
}
