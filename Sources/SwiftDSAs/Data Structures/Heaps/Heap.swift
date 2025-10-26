//
//  Heap.swift
//  SwiftDSAs
//
//  Created by Michael Koohang on 10/24/25.
//

class HeapPriorityQueue<K: Comparable, V>: PriorityQueue {
    private var data: [Item<K, V>] = []

    func add(key: K, value: V) {
        data.append(Item(key: key, value: value))
        upHeap(j: data.count - 1)
    }

    func min() -> (K, V)? {
        if isEmpty() {
            return nil
        }
        let item = data[0]
        return (item.key, item.value)
    }

    func removeMin() -> (K, V)? {
        if isEmpty() {
            return nil
        }

        swap(i: 0, j: data.count - 1)
        let item = data.popLast()
        downHeap(j: 0)
        return (item!.key, item!.value)
    }

    func isEmpty() -> Bool {
        data.count == 0
    }
}

extension HeapPriorityQueue {
    private func parent(j: Int) -> Int {
        return (j-1) / 2
    }

    private func left(j: Int) -> Int {
        return 2*j + 1
    }

    private func right(j: Int) -> Int {
        return 2*j + 2
    }

    private func hasLeft(j: Int) -> Bool {
        return left(j: j) < data.count
    }

    private func hasRight(j: Int) -> Bool {
        return right(j:j) < data.count
    }

    private func swap(i: Int, j: Int) {
        let temp = data[i]
        data[i] = data[j]
        data[j] = temp
    }

    private func upHeap(j: Int) {
        let parent = parent(j: j)
        if j > 0 && data[j] < data[parent] {
            swap(i: j, j: parent)
            upHeap(j: parent)
        }
    }

    private func downHeap(j: Int) {
        if hasLeft(j: j) {
            let left = left(j: j)
            var smallChild = left
            if hasRight(j: j) {
                let right = right(j: j)
                if data[right] < data[left] {
                    smallChild = right
                }
            }
            if data[smallChild] < data[j] {
                swap(i: j, j: smallChild)
                downHeap(j: smallChild)
            }
        }
    }
}
