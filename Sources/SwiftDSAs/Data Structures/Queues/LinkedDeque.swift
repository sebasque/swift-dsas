//
//  LinkedDeque.swift
//  SwiftDSA
//
//  Created by Michael Koohang on 10/20/25.
//

class LinkedDeque<T>: DoublyLinkedList<T> {
    func first() -> T? {
        if isEmpty {
            return nil
        }
        return header.next?.value
    }

    func last() -> T? {
        if isEmpty {
            return nil
        }
        return trailer.prev?.value
    }

    func insertFirst(_ value: T) -> DoublyLinkedNode<T> {
        insertBetween(value, prev: header, next: header.next)
    }

    func insertLast(_ value: T) -> DoublyLinkedNode<T> {
        insertBetween(value, prev: trailer.prev, next: trailer)
    }

    func deleteFirst() -> T? {
        if isEmpty {
            return nil
        }
        return deleteNode(header.next)
    }

    func deleteLast() -> T? {
        if isEmpty {
            return nil
        }
        return deleteNode(trailer.prev)
    }
}
