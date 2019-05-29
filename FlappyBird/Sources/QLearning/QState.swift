//
//  Copyright © 2019 sroik. All rights reserved.
//

import Foundation

struct QState {
    var velocity: Double
    var yDistance: Double
    var xDistance: Double
    var stride: Double
}

extension QState {
    static let maxState = QState(
        velocity: 1024,
        yDistance: 1024,
        xDistance: 512,
        stride: 10
    )

    var xIndex: Int {
        let clamped = xDistance.clamped(from: 0, to: QState.maxState.xDistance)
        return Int(ceil(clamped / stride))
    }

    var yIndex: Int {
        let clamped = (yDistance + QState.maxState.yDistance / 2).clamped(
            from: 0,
            to: QState.maxState.yDistance
        )

        return Int(ceil(clamped / stride))
    }

    var vIndex: Int {
        let clamped = (velocity + QState.maxState.velocity / 2).clamped(
            from: 0,
            to: QState.maxState.velocity
        )

        return Int(ceil(clamped / stride))
    }
}
