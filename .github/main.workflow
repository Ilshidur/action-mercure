workflow "New workflow" {
  on = "push"
  resolves = ["Publish test"]
}

action "Publish test" {
  uses = "./"
  args = "{ \"repo\": \"https://github.com/Ilshidur/action-mercure\", \"action\": \"{{ GITHUB_ACTION }}\", \"description\": \"Please star this project ! :-)\" }"
  env = {
    MERCURE_HUB_URL = "https://demo.mercure.rocks/hub"
    MERCURE_TOPICS = "foo"
  }
  secrets = ["MERCURE_HUB_JWT"]
}
