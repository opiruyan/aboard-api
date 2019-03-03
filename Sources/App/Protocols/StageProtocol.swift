import Vapor

protocol StageProtocol: Content {
    var name: String { get }
    var steps: [StepProtocol] { get };
}
