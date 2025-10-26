//
//  UnsortedPriorityQuue.swift
//  SwiftDSAs
//
//  Created by Michael Koohang on 10/25/25.
//

class UnsortedPriorityQueue<K: Comparable, T>: PriorityQueue {
    typealias Position = PositionalList<Item<K, T>>.Position
    private var data = PositionalList<Item<K, T>>()

    private func findMin() -> Position? {
        if isEmpty() {
            return nil
        }

        var small = data.first()

        guard small != nil else {
            return nil
        }
        var walk = data.after(p: small!)

        while walk != nil {
            guard let walkElement = walk?.element(), let smallElement = small?.element() else {
                return nil
            }
            if walkElement < smallElement {
                small = walk
            }
            walk = data.after(p: walk!)
        }
        return small
    }

    func isEmpty() -> Bool {
        data.size == 0
    }

    func add(key: K, value: T) -> Position? {
        data.addLast(Item(key: key, value: value))
    }

    func min() -> (K, T)? {
        if let p = findMin(), let item = p.element() {
            return (item.key, item.value)
        }
        return nil
    }

    func removeMin() -> (K, T)? {
        if let p = findMin(), let item = data.delete(p: p) {
            return (item.key, item.value)
        }
        return nil
    }
}
