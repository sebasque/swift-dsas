//
//  LinkedNode.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

/// Class to represent a node in a tree
class LinkedNode<T> {
    var element: T
    var next: LinkedNode?

    init(element: T, next: LinkedNode? = nil) {
        self.element = element
        self.next = next
    }
}
