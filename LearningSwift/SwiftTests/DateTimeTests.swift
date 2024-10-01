import Testing
import Cocoa

struct DateTimeTests {
    @Test
    func canDateFromIso8601String() {
        let iso8601DateFormatter = ISO8601DateFormatter()
        let date = iso8601DateFormatter.date(from: "1986-02-23T21:00:00Z")
        
        #expect(date == Calendar(identifier: .gregorian).date(from: DateComponents(
            timeZone: .gmt, year: 1986, month: 2, day: 23, hour: 21, minute: 0, second: 0))!)
    }
    
    @Test
    func canDateToIso8601String() {
        let iso8601DateFormatter = ISO8601DateFormatter()
        let dateString = iso8601DateFormatter.string(from: Calendar(identifier: .gregorian).date(from: DateComponents(
            timeZone: .gmt, year: 1986, month: 2, day: 23, hour: 21, minute: 0, second: 0))!)
        
        #expect(dateString == "1986-02-23T21:00:00Z")
    }
    
    @Test
    func canCompareDates() {
        let date1 = dateFromIso8601("2024-10-01T01:00:00Z")
        let date2 = dateFromIso8601("2024-10-01T01:32:00Z")
        #expect(date1 < date2)
    }
    
    @Test
    func canUseDateInterval() {
        let date1 = dateFromIso8601("2024-10-01T01:00:00Z")
        let date2 = dateFromIso8601("2024-10-01T01:32:00Z")
        let dateInterval = DateInterval(start: date1, end: date2)
        #expect(dateInterval.contains(dateFromIso8601("2024-10-01T01:15:00Z")))
        
        let dif = DateIntervalFormatter()
        let dateIntervalString = dif.string(from: dateInterval)!
        #expect(dateIntervalString == "9/30/24, 9:00 – 9:32 PM") // note: magic spaces, magic dash
    }
    
    private func dateFromIso8601(_ iso8601String: String) -> Date {
        let iso8601DateFormatter = ISO8601DateFormatter()
        return iso8601DateFormatter.date(from: iso8601String)!
    }
}
