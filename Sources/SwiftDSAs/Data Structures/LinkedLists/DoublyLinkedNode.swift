//
//  DoublyLinkedNode.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/16/25.
//

class DoublyLinkedNode<T> {
    var value: T?
    var prev: DoublyLinkedNode<T>?
    var next: DoublyLinkedNode<T>?

    init(
        value: T? = nil,
        prev: DoublyLinkedNode<T>? = nil,
        next: DoublyLinkedNode<T>? = nil
    ) {
        self.value = value
        self.prev = prev
        self.next = next
    }
}
