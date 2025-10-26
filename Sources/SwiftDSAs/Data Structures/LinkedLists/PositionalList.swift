//
//  PositionalList.swift
//  SwiftDSAs
//
//  Created by Michael Koohang on 10/24/25.
//

class PositionalList<T>: DoublyLinkedList<T> {

    enum ValidationError: Error {
        case invalidContainer
        case invalidPosition
    }

    class Position: Equatable {
        var container: PositionalList<T>
        var node: DoublyLinkedNode<T>

        init(container: PositionalList<T>, node: DoublyLinkedNode<T>) {
            self.container = container
            self.node = node
        }

        func element() -> T? {
            return node.value
        }

        static func == (lhs: Position, rhs: Position) -> Bool {
            lhs.node === rhs.node
        }
    }

    func validate(p: Position) throws -> DoublyLinkedNode<T> {
        guard p.container !== self else {
            throw ValidationError.invalidContainer
        }

        guard p.node.next != nil else {
            throw ValidationError.invalidPosition
        }

        return p.node
    }

    private func makePosition(node: DoublyLinkedNode<T>) -> Position? {
        if node === header || node === trailer {
            return nil
        } else {
            return Position(container: self, node: node)
        }
    }

    func first() -> Position? {
        if let next = header.next {
            return makePosition(node: next)
        } else {
            return nil
        }
    }

    func last() -> Position? {
        if let prev = trailer.prev {
            return makePosition(node: prev)
        } else {
            return nil
        }
    }

    func before(p: Position) -> Position? {
        do {
            let node = try validate(p: p)
            if let prev = node.prev {
                return makePosition(node: prev)
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }

    func after(p: Position) -> Position? {
        do {
            let node = try validate(p: p)
            if let next = node.next {
                return makePosition(node: next)
            } else {
                return nil
            }
        } catch {
            print(error)
            return nil
        }
    }

    private func insertBetween(
        _ value: T,
        prev: DoublyLinkedNode<T>?,
        next: DoublyLinkedNode<T>?
    ) -> Position? {
        let node = super.insertBetween(value, prev: prev, next: next)
        return makePosition(node: node)
    }

    func addFirst(_ value: T) -> Position? {
        insertBetween(value, prev: header, next: header.next)
    }

    func addLast(_ value: T) -> Position? {
        insertBetween(value, prev: trailer.prev, next: trailer)
    }

    func addBefore(p: Position, value: T) -> Position? {
        do {
            let original = try validate(p: p)
            return insertBetween(value, prev: original.prev, next: original)
        } catch {
            print("error")
            return nil
        }
    }

    func addAfter(p: Position, value: T) -> Position? {
        do {
            let original = try validate(p: p)
            return insertBetween(value, prev: original, next: original.next)
        } catch {
            print("error")
            return nil
        }
    }

    func delete(p: Position) -> T? {
        do {
            let original = try validate(p: p)
            return deleteNode(original)
        } catch {
            print("error")
            return nil
        }
    }

    func replace(p: Position, value: T) -> T? {
        do {
            let original = try validate(p: p)
            let oldValue = original.value
            original.value = value
            return oldValue
        } catch {
            print("error")
            return nil
        }
    }
}
