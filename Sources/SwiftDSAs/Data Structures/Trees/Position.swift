//
//  Position.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/23/25.
//

protocol Position: Equatable {
    associatedtype T

    func element() -> T
}
