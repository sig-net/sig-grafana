# Contributing

This repository uses **Conventional Commits** and automated semantic releases.

## Why

We use Conventional Commits so that:

- commit history is easier to understand
- changelogs can be generated automatically
- version bumps happen consistently based on the type of change

This repository uses automated releases based on commit history:

- `fix:` changes trigger a **patch** release (`0.0.X`)
- `feat:` changes trigger a **minor** release (`0.X.0`)
- commits marked as **breaking changes** trigger a **major** release (`X.0.0`)

---

## Commit message format

Use this format:

    <type>[optional scope][optional !]: <description>

    [optional body]

    [optional footer(s)]

### Parts of the format

- **type**: the kind of change being made
- **scope**: optional area of the repo affected, such as `grafana`, `dashboards`, `alerts`, `collectors`, `synthetics`, `terraform`, `ci`, etc.
- **!**: optional marker for a breaking change
- **description**: short summary of the change
- **body**: optional longer explanation
- **footer**: optional metadata, notes, or breaking change details

Example:

    feat(dashboards): add validator latency panel

Example with scope and breaking change:

    feat(terraform)!: rename collector module inputs

Example with body and footer:

    fix(alerts): correct threshold for mainnet balance alert

    The previous threshold was too low and caused noisy alerts during
    expected balance fluctuations.

    Refs: #42

---

## Supported commit types

This repository allows the following commit types.

### `feat`
A new feature or capability.

    feat(dashboards): add account balance overview panel

### `fix`
A bug fix.

    fix(terraform): correct dashboard folder UID reference

### `docs`
Documentation-only changes.

    docs(readme): clarify local Grafana development steps

### `style`
Formatting, whitespace, or other non-functional style-only changes.

    style(terraform): reformat module variables

### `refactor`
A code change that is neither a feature nor a fix.

    refactor(collectors): simplify environment variable handling

### `perf`
A performance improvement.

    perf(synthetics): reduce redundant probe requests

### `test`
Adding or updating tests.

    test(terraform): add validation coverage for dashboard inputs

### `build`
Changes to the build system, packaging, or dependencies.

    build(actions): pin workflow action versions

### `ci`
Changes to CI/CD workflows or automation.

    ci(github-actions): add PR title lint workflow

### `chore`
General maintenance or housekeeping that does not fit another category.

    chore(repo): update release manifest

### `revert`
Reverting a previous commit.

    revert: revert "feat(dashboards): add account balance overview panel"

---

## Optional scope values

The scope is optional, but recommended when it helps clarify the affected area.

Common examples for this repository may include:

- `grafana`
- `dashboards`
- `alerts`
- `collectors`
- `synthetics`
- `terraform`
- `modules`
- `near`
- `ci`
- `github-actions`
- `readme`
- `security`

Examples:

    feat(dashboards): add new Near balance panel
    fix(alerts): correct missing label in notification rule
    docs(readme): document Grafana datasource UID changes
    ci(github-actions): enforce conventional PR titles

You are not strictly limited to the examples above. Use a short, meaningful scope when helpful.

---

## Breaking changes

Breaking changes indicate a change that is not backward compatible.

A breaking change causes a **major version bump**.

You can mark a breaking change in either of these ways.

### Option 1: add `!` after the type or scope

    feat(terraform)!: rename collector module inputs

    refactor(dashboards)!: remove legacy dashboard file layout

### Option 2: add a `BREAKING CHANGE:` footer

    feat(terraform): redesign dashboard module inputs

    BREAKING CHANGE: renamed `grafana_folder_uid` to `folder_uid`

Use the footer when the change needs more explanation.

---

## Optional body

Use the body to explain:

- why the change was needed
- important implementation details
- migration considerations
- context that would help reviewers

Example:

    fix(dashboards): correct datasource UID in balance panel

    The previous datasource UID referenced an outdated Grafana datasource
    and caused the imported dashboard to fail queries.

---

## Optional footers

Footers can be used for references and metadata.

Examples:

    fix(terraform): correct provider configuration for dashboard deploy

    Refs: #101

    docs(readme): add local dashboard development notes

    Closes: #87

    feat(alerts): add validator balance alerting

    Reviewed-by: @example-user

The most important footer is:

    BREAKING CHANGE: <description>

That footer triggers a major release.
