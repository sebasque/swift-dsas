//
//  SortedPriorityQueue.swift
//  SwiftDSAs
//
//  Created by Michael Koohang on 10/25/25.
//

class SortedPriorityQueue<K: Comparable, T>: PriorityQueue {
    typealias Position = PositionalList<Item<K, T>>.Position
    private var data = PositionalList<Item<K, T>>()

    func isEmpty() -> Bool {
        data.size == 0
    }

    func add(key: K, value: T) -> Position? {
        let newest = Item(key: key, value: value)
        var walk = data.last()
        while walk != nil && newest < walk!.element()! {
            walk = data.before(p: walk!)
        }
        if walk == nil {
            return data.addFirst(newest)
        } else {
            return data.addAfter(p: walk!, value: newest)
        }
    }

    func min() -> (K, T)? {
        if isEmpty() {
            return nil
        }
        if let p = data.first(), let item = p.element() {
            return (item.key, item.value)
        }
        return nil
    }

    func removeMin() -> (K, T)? {
        if let p = data.first(), let item = data.delete(p: p) {
            return (item.key, item.value)
        }
        return nil
    }
}
