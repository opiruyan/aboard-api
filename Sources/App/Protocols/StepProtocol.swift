import Vapor

protocol StepProtocol {
    var item: String { get };
    var status: String? { get set };
}
