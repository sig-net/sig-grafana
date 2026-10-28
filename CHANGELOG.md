# Changelog

## [0.8.0](https://github.com/sig-net/sig-grafana/compare/0.7.0...0.8.0) (2026-10-28)


### Features

* **alerts:** add midnight testnet block height and success rate alerts ([#99](https://github.com/sig-net/sig-grafana/issues/99)) ([83c7a4c](https://github.com/sig-net/sig-grafana/commit/83c7a4cc3bd23efe13b1815047d671e39f003cb0))
* **alerts:** add testnet Midnight DUST balance row and alerts ([#117](https://github.com/sig-net/sig-grafana/issues/117)) ([7c5c974](https://github.com/sig-net/sig-grafana/commit/7c5c97477f6c18991106d6f84bd15dbf22440543))
* **alerts:** alert on dev nodes' Midnight DUST balance and unfunded publishes ([#106](https://github.com/sig-net/sig-grafana/issues/106)) ([7cde7db](https://github.com/sig-net/sig-grafana/commit/7cde7db932d12fc7653a82e4e695749791c9ada2))
* **alerts:** alert on the contract pinger's Midnight wallet ([#114](https://github.com/sig-net/sig-grafana/issues/114)) ([91d49da](https://github.com/sig-net/sig-grafana/commit/91d49daa5dceb1c2738cf8372a157bfbafca01e1))
* **dashboard:** add CS support workload metrics ([#92](https://github.com/sig-net/sig-grafana/issues/92)) ([d4f764e](https://github.com/sig-net/sig-grafana/commit/d4f764e81492350d35bc91d5d4713f0e91ac1425))
* **dashboard:** add midnight block height panel ([#98](https://github.com/sig-net/sig-grafana/issues/98)) ([96cf11c](https://github.com/sig-net/sig-grafana/commit/96cf11c71960eab0d9d06c1da3433556d2a89f12))
* **dashboard:** add publishing row for midnight publish refusal counts ([#108](https://github.com/sig-net/sig-grafana/issues/108)) ([1120412](https://github.com/sig-net/sig-grafana/commit/1120412516f3ad2e6a718a99eff3f640bb44c586))
* **dashboard:** fix the in time rate to use expired|in_time ([#93](https://github.com/sig-net/sig-grafana/issues/93)) ([068eb62](https://github.com/sig-net/sig-grafana/commit/068eb6210f8cccfea739d8b65cf93c7be1d914eb))
* **dashboard:** fix the leg2 organizing metric ([#91](https://github.com/sig-net/sig-grafana/issues/91)) ([85ce174](https://github.com/sig-net/sig-grafana/commit/85ce174849a248cdbe037a5921e4b5f1adb11376))
* **dashboard:** more bidirectional separation on key metrics ([#89](https://github.com/sig-net/sig-grafana/issues/89)) ([6b4ee96](https://github.com/sig-net/sig-grafana/commit/6b4ee96cd519ac52c452b84c913b69f3317d76de))
* **dashboards:** add mainnet Ethereum pinger balance ([#109](https://github.com/sig-net/sig-grafana/issues/109)) ([5f47ffc](https://github.com/sig-net/sig-grafana/commit/5f47ffce0a6c78af82961794e96e2a33c19ba685))
* **grafana:** add dev near balance panels ([#84](https://github.com/sig-net/sig-grafana/issues/84)) ([1899835](https://github.com/sig-net/sig-grafana/commit/1899835852f49e85901421abca14413cfa4e4c62))
* **grafana:** NEAR node balance panels and alerts for testnet, mainnet and dev via FastNear ([#105](https://github.com/sig-net/sig-grafana/issues/105)) ([219ca92](https://github.com/sig-net/sig-grafana/commit/219ca9244a1d481b9a7c14f6ca7d61ae906a5e63))


### Bug Fixes

* **alerts:** name the contract pinger ETH balance alerts and monitor the funding account ([#100](https://github.com/sig-net/sig-grafana/issues/100)) ([737b5ac](https://github.com/sig-net/sig-grafana/commit/737b5ac84959a8f996a5a751f2563b8c4562aece))
* **alerts:** treat missing data and query errors as alerts for balance rules ([#116](https://github.com/sig-net/sig-grafana/issues/116)) ([71fad8b](https://github.com/sig-net/sig-grafana/commit/71fad8b530cc1b295513c31e8a8a3f5400c13ace))
* **dashboard:** remove broken support workload panels ([#95](https://github.com/sig-net/sig-grafana/issues/95)) ([d62591f](https://github.com/sig-net/sig-grafana/commit/d62591fdf4b842a845ece691c094195ebf55b98d))
* **dashboard:** repair CS support workload panels ([#94](https://github.com/sig-net/sig-grafana/issues/94)) ([bca590c](https://github.com/sig-net/sig-grafana/commit/bca590c46218e95c1d217fa30761f2844d3f2e5b))
* **dashboards:** query the mainnet pinger panel through the Alchemy mainnet datasource ([#113](https://github.com/sig-net/sig-grafana/issues/113)) ([cf22069](https://github.com/sig-net/sig-grafana/commit/cf22069e37ac3225c286c4353e3522acb70b8d36))
* **dashboards:** update contract pinger balance panels and add funding account ([#101](https://github.com/sig-net/sig-grafana/issues/101)) ([ae8cad7](https://github.com/sig-net/sig-grafana/commit/ae8cad70d2aad1fbb03fd59d53d922de87ae2f46))
* **grafana:** bind ETH panels to ETH datasources ([#112](https://github.com/sig-net/sig-grafana/issues/112)) ([dcf8824](https://github.com/sig-net/sig-grafana/commit/dcf8824333efa1edf542da6b61a62489fc49a1e4))
* **grafana:** isolate Alchemy Ethereum datasources ([#111](https://github.com/sig-net/sig-grafana/issues/111)) ([1ac6b7e](https://github.com/sig-net/sig-grafana/commit/1ac6b7eef28d3055d06f50413e4ad7c64b0f14ca))
* **grafana:** load alchemy keys from gsm ([#103](https://github.com/sig-net/sig-grafana/issues/103)) ([866e98f](https://github.com/sig-net/sig-grafana/commit/866e98f9b5313d740b57e1f839337c63e9289e15))
* **grafana:** reduce dev near balance polling ([#86](https://github.com/sig-net/sig-grafana/issues/86)) ([385de42](https://github.com/sig-net/sig-grafana/commit/385de4240f7fe344ccf6c999627a98b84bb59370))
* **grafana:** remove Alchemy datasource base URLs ([#110](https://github.com/sig-net/sig-grafana/issues/110)) ([ebd98f8](https://github.com/sig-net/sig-grafana/commit/ebd98f8d3fc47437f30a9f50c38f66300bdcdbd4))
* **grafana:** remove PierTwo, Lifted, Luganodes and Blacksand from mainnet monitoring ([#104](https://github.com/sig-net/sig-grafana/issues/104)) ([073f798](https://github.com/sig-net/sig-grafana/commit/073f798f40a9567ab1b6d78098f84794074e1f9a))

## [0.7.0](https://github.com/sig-net/sig-grafana/compare/0.6.0...0.7.0) (2026-09-17)


### Features

* **dashboard:** separate by sign kind ([#81](https://github.com/sig-net/sig-grafana/issues/81)) ([eb036af](https://github.com/sig-net/sig-grafana/commit/eb036afbf897ece669508ab9152f849f1897f621))
* **grafana:** add testnet near balance alerts ([#82](https://github.com/sig-net/sig-grafana/issues/82)) ([ff672e9](https://github.com/sig-net/sig-grafana/commit/ff672e931d186961f5192a07e4b93b596f3d5bc4))


### Bug Fixes

* **alerts:** extend testnet eth block height stalled window ([#75](https://github.com/sig-net/sig-grafana/issues/75)) ([778b4e1](https://github.com/sig-net/sig-grafana/commit/778b4e188dd9eac7d7a8cc73d0aa30c207d15c8f))
* **alerts:** raise dev cpu request alert duration ([#77](https://github.com/sig-net/sig-grafana/issues/77)) ([5e788fe](https://github.com/sig-net/sig-grafana/commit/5e788fe60c37fb0d036753337ab4165945e82606))
* **grafana:** use near rpc for testnet balances ([#83](https://github.com/sig-net/sig-grafana/issues/83)) ([ea97109](https://github.com/sig-net/sig-grafana/commit/ea971094bc6974287904c82965d6a08e18c364c0))

## [0.6.0](https://github.com/sig-net/sig-grafana/compare/0.5.0...0.6.0) (2026-08-25)


### Features

* **alerts:** add multichain kubernetes workload sre observability ([#74](https://github.com/sig-net/sig-grafana/issues/74)) ([86782d6](https://github.com/sig-net/sig-grafana/commit/86782d64298971da8f974bfd28f3f3ae1a629b33))
* **dashboard:** add panels for canton, midnight and a section for checkpoints ([#71](https://github.com/sig-net/sig-grafana/issues/71)) ([1f256e9](https://github.com/sig-net/sig-grafana/commit/1f256e998227a785605a47c35abda3930bd9bfe9))


### Bug Fixes

* **alerts:** evaluate block height stalls over 30m window ([#67](https://github.com/sig-net/sig-grafana/issues/67)) ([491063e](https://github.com/sig-net/sig-grafana/commit/491063ea76aa0d085dbd770ed9c05ed9afed4d90))
* **alerts:** extend block height stalled alert delay ([#66](https://github.com/sig-net/sig-grafana/issues/66)) ([f5446e3](https://github.com/sig-net/sig-grafana/commit/f5446e3549814a7485a8cd4e8776510cced37707))
* **alerts:** lower chain signatures thresholds to 85% ([#64](https://github.com/sig-net/sig-grafana/issues/64)) ([f2661a3](https://github.com/sig-net/sig-grafana/commit/f2661a38cca2707b100dd0125a59f2d51d81e868))
* **alerts:** raise dev node memory threshold ([#68](https://github.com/sig-net/sig-grafana/issues/68)) ([874c6b6](https://github.com/sig-net/sig-grafana/commit/874c6b69863a7488a6c8ab582d06bbc3fd193c74))
* **alerts:** raise dev node memory threshold to 4.5gb ([#69](https://github.com/sig-net/sig-grafana/issues/69)) ([88eeea1](https://github.com/sig-net/sig-grafana/commit/88eeea1ce81809a304f2447f4109cd9a5e614841))
* **alerts:** use 1h window for testnet solana success-rate alert ([#62](https://github.com/sig-net/sig-grafana/issues/62)) ([20f0e77](https://github.com/sig-net/sig-grafana/commit/20f0e77a45ec971c6eba085bf928965c37a7f91f))
* **dashboards:** remove stale chain-signatures dashboard reference ([#73](https://github.com/sig-net/sig-grafana/issues/73)) ([c6d4271](https://github.com/sig-net/sig-grafana/commit/c6d42719b54998fbf7e254c9e3a6519613a00741))
* **dashboards:** run chain-signatures dashboard deploy apply ([#72](https://github.com/sig-net/sig-grafana/issues/72)) ([79e4ade](https://github.com/sig-net/sig-grafana/commit/79e4ade42a3eaab62095bd5b8120b708764ac22b))

## [0.5.0](https://github.com/sig-net/sig-grafana/compare/0.4.0...0.5.0) (2026-06-25)


### Features

* **dashboards:** add canton indexer panel and accept all indexing statuses ([#61](https://github.com/sig-net/sig-grafana/issues/61)) ([3d0f47b](https://github.com/sig-net/sig-grafana/commit/3d0f47bb2502a31ad8e3658979a5646d95624dd5))


### Bug Fixes

* **alerts:** delay testnet solana signature alerting ([#59](https://github.com/sig-net/sig-grafana/issues/59)) ([7b2d760](https://github.com/sig-net/sig-grafana/commit/7b2d76007e49c2e51eca4752ad5fc4aeb5f5a7c4))

## [0.4.0](https://github.com/sig-net/sig-grafana/compare/0.3.0...0.4.0) (2026-06-17)


### Features

* **canton:** add env-switchable monitoring dashboard ([#54](https://github.com/sig-net/sig-grafana/issues/54)) ([d4305a0](https://github.com/sig-net/sig-grafana/commit/d4305a0ade9fdfca125c9e218889c408f35a17d2))
* **sre:** import hardware dashboards and alerts ([#55](https://github.com/sig-net/sig-grafana/issues/55)) ([992a9d8](https://github.com/sig-net/sig-grafana/commit/992a9d8f7ab873687daa70c224932f837b3ccd82))


### Bug Fixes

* **alerts:** evaluate chain-signature success-rate alerts over 10m ([#50](https://github.com/sig-net/sig-grafana/issues/50)) ([8cea686](https://github.com/sig-net/sig-grafana/commit/8cea68690b6e3724c3faa9b19f98903f065a34bf))
* **alerts:** raise testnet signature success-rate threshold to 95% ([#52](https://github.com/sig-net/sig-grafana/issues/52)) ([22c9b69](https://github.com/sig-net/sig-grafana/commit/22c9b69e6d1ef5a52e3b563a78d036e650b1a83a))
* **alerts:** use 1h window for in-time SLI trend alerts ([#53](https://github.com/sig-net/sig-grafana/issues/53)) ([48e1cd4](https://github.com/sig-net/sig-grafana/commit/48e1cd4a93d384559206a87d1dae39d8ab78f346))
* **dashboards:** correct SRE hardware dashboard import ids ([#58](https://github.com/sig-net/sig-grafana/issues/58)) ([2d863fc](https://github.com/sig-net/sig-grafana/commit/2d863fc6b2883fa2ebcef54c8a0bcfa8f6866c3b))
* **sre:** import existing folder resources ([#56](https://github.com/sig-net/sig-grafana/issues/56)) ([fb8a511](https://github.com/sig-net/sig-grafana/commit/fb8a511010b8db618b9aeac277779eca31395787))

## [0.3.0](https://github.com/sig-net/sig-grafana/compare/0.2.0...0.3.0) (2026-06-02)


### Features

* **alerts:** map prod chain signatures alerts to prod dashboard ([#38](https://github.com/sig-net/sig-grafana/issues/38)) ([fff3086](https://github.com/sig-net/sig-grafana/commit/fff30864f1a03a5a855f5240130592fdc20de0df))
* **dashboards:** auto-sync chain signatures prod export ([#43](https://github.com/sig-net/sig-grafana/issues/43)) ([0af6ef5](https://github.com/sig-net/sig-grafana/commit/0af6ef56e05fa61f16822d08c15f9ba124f39aeb))


### Bug Fixes

* **alerts:** keep mainnet signature sli on last state ([#46](https://github.com/sig-net/sig-grafana/issues/46)) ([e17dbee](https://github.com/sig-net/sig-grafana/commit/e17dbeec122baae2489b8056342aa2d9af40a127))
* **alerts:** suppress mainnet app alert no-data pages ([#48](https://github.com/sig-net/sig-grafana/issues/48)) ([067d2b5](https://github.com/sig-net/sig-grafana/commit/067d2b5b5bdf3965c05d818ccd6de625d382afd6))
* **alerts:** suppress mainnet signature SLI no-data pages ([#47](https://github.com/sig-net/sig-grafana/issues/47)) ([425058d](https://github.com/sig-net/sig-grafana/commit/425058d8551ed691d1d787415932c15ef2240fbe))
* **alerts:** suppress no-data for all mainnet rules ([#49](https://github.com/sig-net/sig-grafana/issues/49)) ([eb2f698](https://github.com/sig-net/sig-grafana/commit/eb2f698c51e0612fa6b40ab2431f9106110bdefd))
* **dashboards:** remove staging dashboard from terraform to avoid ove… ([#45](https://github.com/sig-net/sig-grafana/issues/45)) ([8a040ff](https://github.com/sig-net/sig-grafana/commit/8a040ffec98c1dfe832052144275ddc37d4e3f94))

## [0.2.0](https://github.com/sig-net/sig-grafana/compare/0.1.2...0.2.0) (2026-05-27)


### Features

* **dashboards:** add prod chain signatures dashboard ([#30](https://github.com/sig-net/sig-grafana/issues/30)) ([4d2e469](https://github.com/sig-net/sig-grafana/commit/4d2e4693cd0fcb32e72e184db6136cf9bccd3e7f))


### Bug Fixes

* **dashboards:** align prod panel 163 with classic JSON ([#33](https://github.com/sig-net/sig-grafana/issues/33)) ([4d3cb4c](https://github.com/sig-net/sig-grafana/commit/4d3cb4cd872c763a4c5ae160456af2b187775fb4))
* **dashboards:** correct prod panel 163 ([#32](https://github.com/sig-net/sig-grafana/issues/32)) ([16f9cc9](https://github.com/sig-net/sig-grafana/commit/16f9cc9c1d5596ec34171ca1862d2089d22d61db))
* force push active dashboards ([86e57a4](https://github.com/sig-net/sig-grafana/commit/86e57a4a8b6c914c76eb593ff33dbfd732c543e1))
* **terraform:** update staging dashboard to reflect expected dashboard ([#34](https://github.com/sig-net/sig-grafana/issues/34)) ([32ffe68](https://github.com/sig-net/sig-grafana/commit/32ffe68bf57e203afb5e174defc7825c58c1c9ce))
* updated terraform provider to support v2 dashboards, added xaing… ([#40](https://github.com/sig-net/sig-grafana/issues/40)) ([922cb4d](https://github.com/sig-net/sig-grafana/commit/922cb4d92a1126da499ae51d40918dcad614e02e))

## [0.1.2](https://github.com/sig-net/sig-grafana/compare/0.1.1...0.1.2) (2026-05-05)


### Bug Fixes

* **terraform:** Swap contact point for balance alerts ([#27](https://github.com/sig-net/sig-grafana/issues/27)) ([2c28940](https://github.com/sig-net/sig-grafana/commit/2c28940f2c069c682e53ebbd35bdea69699edde9))

## [0.1.1](https://github.com/sig-net/sig-grafana/compare/0.1.0...0.1.1) (2026-03-26)


### Bug Fixes

* **alerts:** add contract pinger ETH balance alerts ([#25](https://github.com/sig-net/sig-grafana/issues/25)) ([353ec2e](https://github.com/sig-net/sig-grafana/commit/353ec2e2e07af0f76231ff20a63ed955cabed5a0))

## [0.1.0](https://github.com/sig-net/sig-grafana/compare/0.0.1...0.1.0) (2026-03-20)


### Features

* **grafana:** update account balances dashboard ([#19](https://github.com/sig-net/sig-grafana/issues/19)) ([08a8dd0](https://github.com/sig-net/sig-grafana/commit/08a8dd0ae66411a741f6c3de8d39fe92811edde0))
