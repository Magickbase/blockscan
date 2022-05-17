<h1 align="center">AxonExplorer</h1>
<p align="center">Axon Explorer was fork on blockscout explorer project.</p>

## About
Axon Explorer was a explorer for [Axon](https://github.com/nervosnetwork/axon) Side Chain which is a layer2 network build on [Nervos Network](https://www.nervos.org/) [CKB](https://github.com/nervosnetwork/ckb)
## Getting Started
  1. install docker and docker compose
  2. run pg database on the host machine
  3. edit `xxx.env` file
  4. build command `docker-compose --env-file ./axon_staging.env -f ./docker-compose.yml build axon_explorer`
  5. run command `docker-compose --env-file ./axon_staging.env  -f ./docker-compose.yml up --force-recreate axon_explorer`
## Acknowledgements

We would like to thank the [Nervos Network](https://www.nervos.org/) for their funding support.

## Contributing
just fork and pull request

## License
[![License: GPL v3.0](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.
