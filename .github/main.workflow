workflow "New workflow" {
  on = "push"
  resolves = ["Publish test"]
}

action "Publish test" {
  uses = "./"
  args = "{ \"hello\": \"{{ GITHUB_ACTION }}\" }"
  env = {
    MERCURE_HUB_URL = "https://demo.mercure.rocks/hub"
    MERCURE_TOPICS = "foo"
  }
  secrets = ["MERCURE_HUB_JWT"]
}
