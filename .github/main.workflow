workflow "Push event" {
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

workflow "Star notification" {
  on = "watch"
  resolves = ["Star notif. test"]
}

action "Star notif. test" {
  uses = "./"
  args = "{ \"repo\": \"https://github.com/Ilshidur/action-mercure\", \"action\": \"{{ GITHUB_ACTION }}\", \"description\": \"Thank you for the STAR ! :-)\" }"
  env = {
    MERCURE_HUB_URL = "https://demo.mercure.rocks/hub"
    MERCURE_TOPICS = "foo"
  }
  secrets = ["MERCURE_HUB_JWT"]
}
