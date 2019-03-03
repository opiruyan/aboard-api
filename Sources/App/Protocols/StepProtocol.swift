import Vapor

protocol StepProtocol: Content {
    var id: Int { get };
    var item: String { get };
    var status: String? { get set };
}
