import Vapor

protocol StepProtocol: Content {
    var item: String { get };
    var status: String? { get set };
}
