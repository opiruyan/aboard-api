import Vapor

struct Jorney: Content {
    var name = "Very First Thing to do"
    var stages: Array<Stage>
}
