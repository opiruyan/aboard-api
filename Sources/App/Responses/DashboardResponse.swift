import Vapor

struct DashboardResponse: Content {
    var name: String;
    var links: [LinkStructure] = [GitLabLink, Jira, Confluence];
    
    init(teamName: String) {
        self.name = teamName;
    }
}

struct LinkStructure: Content {
    var name: String;
    var uri: String;
    var description: String;
}

let GitLabLink = LinkStructure(name: "GitLab", uri: Resources.GITLAB_URL.rawValue, description: "This is where our code lives");
let Jira = LinkStructure(name: "Jira", uri: Resources.JIRA_URL.rawValue, description: "All tasks are here");
let Confluence = LinkStructure(name: "Confluence", uri: Resources.GITLAB_URL.rawValue, description: "Has all high level information and documentation");
