# 🚀 GitHub Action for Mercure

Send a [Mercure](https://mercure.rocks) publish event. Simple as that.

TODO: Insert image

<hr/>

## Usage

```hcl
action "Publish notification" {
  uses = "Ilshidur/action-mercure@master"
  secrets = ["MERCURE_HUB_URL", "MERCURE_HUB_JWT"]
  args = "{ \"hello\": \"world\" }"
}
```

**NOTICE :** for stability purposes, it is recommended to use the action with an explicit commit SHA-1 :

TODO: Insert proper commit SHA-1
`uses = "Ilshidur/action-mercure@1e77575"` (=> link to the commits list : https://github.com/Ilshidur/action-mercure/commits/master)

### Arguments

The argument is TODO:.

**Environment variables can be interpolated** in the message using brackets (`{{` and `}}`) :

e.g.: `args = "{ \"action\": \"{{ GITHUB_ACTION }}\" }"`

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
  <a href="https://github.com/Ilshidur/action-discord/issues/new">Your feedback is appreciated</a>
</p>
