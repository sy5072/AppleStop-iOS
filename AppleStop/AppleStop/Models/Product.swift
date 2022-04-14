//
//  Product.swift
//  AppleStop
//
//  Created by DaeSeong on 2022/04/13.
//

 
import Foundation

struct ProductResponse : Codable {
    let C005 : Row
}
// api와 키가 똑같아야함 틀리면 에러발생함.

struct Row : Codable {
    let row : [Product]
}

struct Product : Codable {
    let CLSBIZ_DT : String?
    let SITE_ADDR : String?
    let PRDLST_REPORT_NO : String
    let BAR_CD : String?
    let POG_DAYCNT : String?
    let PRDLST_DCNM : String?
    let BSSH_NM : String?
    let END_DT : String?
    let INDUTY_NM : String?
}
/*
 
 "CLSBIZ_DT": "",
 "SITE_ADDR": "충청북도 진천군 이월면 궁동길 51-24",
 "PRDLST_REPORT_NO": "19930443028350",
 "PRMS_DT": "20070119",
 "PRDLST_NM": "면사랑 구수한 메밀국수",
 "BAR_CD": "8802039211424",
 "POG_DAYCNT": "24개월 실온",
 "PRDLST_DCNM": "건면",
 "BSSH_NM": "(주)면사랑",
 "END_DT": "",
 "INDUTY_NM": "식품제조가공업"
 */
