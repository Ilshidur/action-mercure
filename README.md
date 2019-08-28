# 🚀 GitHub Action for Mercure

[![GitHubActions](https://img.shields.io/badge/listed%20on-GitHubActions-blue.svg)](https://github-actions.netlify.com/action-mercure)
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2FIlshidur%2Faction-mercure%2Fbadge&style=flat)](https://actions-badge.atrox.dev/Ilshidur/action-mercure/goto)

Send a [Mercure](https://mercure.rocks) publish event. Simple as that.

![GitHub Action](action.png "GitHub Action")

<hr/>

## Demo

1) Go to https://demo.mercure.rocks, in the **Subscribe** section.
2) Subscribe for notifications on this *topic* : **`foo`**.
3) 🌟 Star 🌟 this repo !
4) Quickly switch to the Mercure demo page to see a notification in your browser.

## Usage

### New YML synthax

 ```yaml
- name: Publish notification
  env:
    MERCURE_HUB_URL: ${{ secrets.MERCURE_HUB_URL }}
    MERCURE_HUB_JWT: ${{ secrets.MERCURE_HUB_JWT }}
    MERCURE_TOPICS: topic1,topic2
  uses: Ilshidur/action-mercure@master
  with:
    args: '{ \"hello\": \"world\" }'
```

 ### (legacy) HCL synthax

```hcl
action "Publish notification" {
  uses = "Ilshidur/action-mercure@master"
  secrets = ["MERCURE_HUB_URL", "MERCURE_HUB_JWT"]
  args = "{ \"hello\": \"world\" }"
}
```

**NOTICE :** for stability purposes, it is recommended to use the action with an explicit commit SHA-1 :

`uses = "Ilshidur/action-mercure@6265c17"` (=> link to the commits list : https://github.com/Ilshidur/action-mercure/commits/master)

### Arguments

The argument is the content of the event to send. It is **RECOMMENDED** to use JSON.

**Environment variables can be interpolated** in the message using brackets (`{{` and `}}`) :

e.g.: `args: "{ \"action\": \"{{ GITHUB_ACTION }}\" }"`

### Environment variables

* **`MERCURE_TOPICS`**: the Mercure topics. **Supports interpolation** using (`{{` and `}}`).

### Secrets

* **`MERCURE_HUB_URL`**: the **public** Mercure hub URL (**required**).
* **`MERCURE_HUB_JWT`**: the publisher JWT (**required**).
* That's all.

## License

GNU GENERAL PUBLIC LICENSE v3.

<hr/>

<p align="center">
  Don't forget to 🌟 Star 🌟 the repo if you like this GitHub Action !<br/>
  <a href="https://github.com/Ilshidur/action-mercure/issues/new">Your feedback is appreciated</a>
</p>
