import Foundation

public extension Date {
    var year: Int {
        Calendar.current.component(.year, from: self)
    }

    var month: Int {
        Calendar.current.component(.month, from: self)
    }

    var day: Int {
        Calendar.current.component(.day, from: self)
    }

    /// 날짜의 시간을 Int로 return합니다.
    ///
    /// 24시 포맷을 사용합니다.
    /// 오후 3시: 15
    var hour: Int {
        Calendar.current.component(.hour, from: self)
    }

    var minute: Int {
        Calendar.current.component(.minute, from: self)
    }

    var second: Int {
        Calendar.current.component(.second, from: self)
    }

    /// 날짜의 요일을 Int로 return합니다.
    ///
    /// 1: 일요일
    /// 7: 토요일
    var weekday: Int {
        Calendar.current.component(.weekday, from: self)
    }

    var weekdayString: String {
        switch weekday {
        case 1: return "일"
        case 2: return "월"
        case 3: return "화"
        case 4: return "수"
        case 5: return "목"
        case 6: return "금"
        case 7: return "토"
        default: return ""
        }
    }
}
