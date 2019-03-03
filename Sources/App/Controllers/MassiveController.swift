import Vapor

struct MassiveController {
    func showDashboard(_ req: Request) -> DashboardResponse {
        return dashboard(req);
    }
}
