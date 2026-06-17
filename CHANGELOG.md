# Changelog

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
