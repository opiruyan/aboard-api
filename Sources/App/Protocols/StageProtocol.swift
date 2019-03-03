import Vapor

protocol StageProtocol: Content {
    associatedtype StepProtocol
    var name: String { get }
    var steps: [StepProtocol]? { get };
    var mustComplete: Bool? { get };
}
