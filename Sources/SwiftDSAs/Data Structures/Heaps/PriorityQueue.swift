//
//  PriorityQueue.swift
//  SwiftDSAs
//
//  Created by Michael Koohang on 10/25/25.
//

class PriorityQueue {
    class Item<K: Comparable, V>: Comparable {
        var key: K
        var value: V

        init(key: K, value: V) {
            self.key = key
            self.value = value
        }

        static func < (lhs: PriorityQueue.Item<K, V>, rhs: PriorityQueue.Item<K, V>) -> Bool {
            lhs.key < rhs.key
        }

        static func == (lhs: PriorityQueue.Item<K, V>, rhs: PriorityQueue.Item<K, V>) -> Bool {
            lhs.key == rhs.key
        }
    }
}
