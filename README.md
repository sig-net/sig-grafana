# Grafana

 This repo is primarily used by Sig Network to manage different aspects of Grafana, which we thought would be useful for the greater community. This is not intended to be a "plug and play" set up by simply running terraform apply, but with the right configuration, it could be mostly "plug and play". Below will be an overview of how to do so.


## Implemenation

 We utilize Terraform to deploy our dashboards, alerts, and other tools that involve alerting and monitoring. This was not intended to utilize a "monorepo" approach for CD purposes, as we would like to control dashboard and alerting configurations manually, however this repo could be set up to run in an automated deployment fashion with some modifications. The individual folders could be utilized as "modules" while a `main.tf` file could live in the root directory. You will need to change up the provider configuration and backend state, but that should be an easy change.

> *Below are the things that would need to change in order for you to use this in your environment.*

### Dashboards
---
- In the [`terraform/dashboards/Near`](./terraform/dashboards/Near/) path, in the JSON file ([`account-balances.json`](./terraform/dashboards/Near/balances/account-balances.json), [`chain_sig_new.json`](./terraform/dashboards/Near/chain-signatures/chain_sig_new.json)), the `datasource.uid`'s will need to change to the datasorce UID of you organization, since these are unique in Grafana.
- In [`resources.tf`](./terraform/dashboards/Near/chain-signatures/resources.tf) files, the authentication and state information will need to change to match what is used in your organization. Currently we utilze Google Cloud Platform Secret Manger to consume sensitive data such as Grafana usernames, passwords, API credentials and URLs.
- You may remove node paths that do not apply to your organization. Since we are the owner of this service, we do our part to monitor nodes across the ecosystem, but you do not have to do so.
- We track balances of certain nodes that we use for development as well as certain "tooling" accounts we use, you may remove these, as they are pretty useless to everyone but us.
- If you would like to continue to edit or create new dashboards via code, there is a VS Code plugin for local development, this is to test out JSON files before commiting them to source control. If you would like to do the same, you will need to configure a Grafana Service Account with "Viewer" permissions, and generate an API key. [VS Code Plugin Docs](https://marketplace.visualstudio.com/items?itemName=Grafana.grafana-vscode)


### Alerts
---
- In the [`terraform/alerts/Near`](./terraform/alerts/Near/) directory, it will be much of the same as in `dashboards`. Datasource UIDs will need to be chaged as well as folder UIDs if you choose to use different folders.
- We consume secrets in the same manner as dashboards, so you will need to provide your own values for these.
- We have soft alerts for our Dev environment, [`Multichain_Dev.tf`](./terraform/alerts/Near/chain-signatures/Multichain_Dev.tf), you can delete these files in your implementation along with other node alerts that are outside of your organization.
- Again we alert on balances on nodes we own, so you can either swap out your node information, or delete those alerts all-together.

### Collectors
---
- We separate Prometheus collectors based on environment, as to not have a single point of failure for metrics collection for all environments. This is a redundancy that you may or may not need, feel free to use a single collector for your environment. I would use [`terraform/collectors/Near/Prod/Mainnet`](./terraform/collectors/Near/Prod/Mainnet) as an example.
- Again, we consume secrets for authenticating to Grafana via Google Cloud, you can see where our variables are used in the [`agent.yaml`](./terraform/collectors/Near/Prod/Mainnet/agent.yaml) configuration file, as well as passed in to the cloudrun service via environment variables in [`terraform/modules/collector/main.tf`](./terraform/modules/collector/main.tf).
- We utilize the `grafana/agent v0.49` Prometheus collector that we ourselves manage via versioning, this is technically a deprecated service in favor of Grafana Alloy, however this collector suits our needs better at the moment and was simple to configure. You will need to manage your own collector image as you see fit.
- Again, as with other changes, you may delete any node that does not belong to you. Just remove the job as a whole in the `agent.yaml` file.

### Synthetics
---
- This is a custom service which was created to ping a the smart contract of the ecosystem to act as a "heartbeat" monitor for the overall smart contract functionality. You do not need to monitor synthetics for the smart contract, but I encourage you to configure your own Synthetics for your node just for visibility. I have not converted synthetic alerts and configurations into terraform just yet, as they are a work in progress, but I plan to do so in the future once we have something more fleshed out and useful for the greater community.
