//
//  Extensions.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import UIKit

// MARK: - UITableView

protocol UITableViewCreatable where Self: UITableViewCell {
    
    /// View make factory pattern
    static func makeNib() -> UINib
}

extension UITableViewCreatable {
    static func makeNib() -> UINib {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        let nib: UINib = UINib(nibName: nibName, bundle: bundle)
        return nib
    }
}

// MARK: - UIView

public protocol UIViewCreatable where Self: UIView {
    
    /// View make factory pattern
    static func makeView() -> Self
}

extension UIViewCreatable {
    
    /// View make factory pattern
    ///
    /// make by bundleType
    public static func makeView() -> Self {
        let bundle: Bundle = Bundle(for: Self.self)
        let nibName = String(describing: Self.self)
        let nib: UINib = UINib(nibName: nibName, bundle: bundle)
        let view: Self = nib.instantiate(withOwner: self, options: nil).first as! Self
        
        return view
    }
}

// MARK: - Int

extension Int {
    
    public func toString() -> String {
        return String(self)
    }
}

// MARK: - String

extension String {
    
    public func toInt() -> Int? {
        return Int(self)
    }
}

// MARK: - Date

extension Date {

    public func adding(type: Calendar.Component, value: Int) -> Date {
        return Calendar.current.date(byAdding: type, value: value, to: self)!
    }

    public func getComponent(_ comp: Calendar.Component) -> Int {
        return Calendar.current.component(comp, from: self)
    }

    public func toString(format: String = "yyyy-MM-dd HH:mm:ss") -> String {
        let dateFormatter = DateFormatter.shared
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }

    public func withoutTime() -> Date? {
        let components: DateComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        let start: Date? = Calendar.current.date(from: components)
        return start
    }
}

// MARK: - DateFormatter

extension DateFormatter {

    static var shared: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return DateFormatter()
    }()
}



