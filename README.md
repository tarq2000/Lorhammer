# Lorhammer
(The orginal file is in the Lorhammer website : http://lorhammer.itk.fr/)



# Lorhammer Installation Guide

This guide outlines the steps to install and run Lorhammer on your local environment.

## Prerequisites

Before you begin, ensure you have `git` and `make` installed on your system.

## Installation

1. **Clone the repository:**

   Clone Lorhammer to your local machine by running the following command:

   ```bash
   git clone https://github.com/tarq2000/Lorhammer.git

2. **Then need to make build :**

   
   ```bash
   make

3. **start mandatory tools :**


   ```bash
   ./resources/scripts/launchTools.sh

4. **start lorhammer worker**

   please change the  127.0.0.1 what your host (use  127.0.0.1 for local host) : 


   ```bash
   ./build/lorhammer -mqtt tcp://127.0.0.1:1884








> Stress your lora network-server

[![status](https://gitlab.com/itk.fr/lorhammer/badges/master/build.svg)](https://gitlab.com/itk.fr/lorhammer/commits/master)
[![coverage report](https://gitlab.com/itk.fr/lorhammer/badges/master/coverage.svg)](https://gitlab.com/itk.fr/lorhammer/commits/master)
[![Go Report Card](https://goreportcard.com/badge/gitlab.com/itk.fr/lorhammer)](https://goreportcard.com/report/gitlab.com/itk.fr/lorhammer)

When building a big iot lora platform handling millions of messages per seconds, how to be sure we handle all the messages in time ? Today, no publicly accessible tool enables us to simulate the behavior of a wide lora infrastructure along with the messages.

Lorhammer is here to do that. You can launch as much lorhammers as you want to stress and test your network-server.

[![lorhammer-schema](doc/static/images/Lorhammer-schema.png)](doc/static/images/Lorhammer-schema.png)

## Features

* Can stress a lorawan network-server, through scenarios
* Can check if result are good over prometheus api call
* Can display what happend over grafana
* Can be distributed
* An orchestrator is available to manage lorhammers, through mqtt
* lorhammers can be deployed over ssh on amazon

## Built with

### Language

* [Golang](https://golang.org/)

### Infra

* [Gitlab](https://gitlab.com/)
* [Docker](https://www.docker.com/)
* [Docker-compose](https://docs.docker.com/compose/)

### Tools

* [Mosquitto](https://mosquitto.org/)
* [Hugo](https://gohugo.io/)

### Libs

* [Logrus](https://github.com/sirupsen/logrus) // [MIT](https://github.com/sirupsen/logrus/blob/master/LICENSE)
* [Prometheus](https://github.com/prometheus/client_golang/prometheus) // [APACHE2](https://github.com/prometheus/client_golang/blob/master/LICENSE)
* [Paho Mqtt](https://github.com/eclipse/paho.mqtt.golang) // [ECLIPSE](https://github.com/eclipse/paho.mqtt.golang/blob/master/LICENSE)
* [Uuid](https://github.com/google/uuid) // [BSD3](https://github.com/google/uuid/blob/master/LICENSE)
* [Lorawan](https://github.com/brocaar/lorawan) // [MIT](https://github.com/brocaar/lorawan/blob/master/LICENSE)
* [Aws-sdk](https://github.com/aws/aws-sdk-go) // [APACHE2](https://github.com/aws/aws-sdk-go/blob/master/LICENSE.txt)
* [Sarama](https://github.com/Shopify/sarama) // [MIT](https://github.com/Shopify/sarama/blob/master/LICENSE)

## Inspiration

Lorhammer has been inspired by [Gatling](http://gatling.io/) but for lorawan networks and with distribution in mind. One day, lorhammer will become hammer with flavours like lorhammer and resthammer...

We want to thank [brocaar](https://github.com/brocaar) for his great job on opensourcing his projects, we have been inspired by [brocaar/loraserver](https://github.com/brocaar/loraserver) and particularly [brocaar/lorawan](https://github.com/brocaar/lorawan) which we use in lorhammer.

## Links

* [Issues](https://gitlab.com/itk.fr/lorhammer/issues), please be sure to have read the [contributing](http://lorhammer.itk.fr/contributing/#reporting-bugs) page before.
* [Quickstart](http://lorhammer.itk.fr/quickstart) to use lorhammer
* [Develop](http://lorhammer.itk.fr/develop) to add features on lorhammer, please be sure to have read the [contributing](http://lorhammer.itk.fr/contributing/#code-contribution) page before.

## Versioning

We use SemVer for versioning. For the versions available, see the tags on this repository.

## Powered by ITK

[![itk_logo](doc/static/images/ITK_PredictandDecide.png?width=50%)](doc/static/images/ITK_PredictandDecide.png)

itk is globally recognized as being an innovation leader in scientific knowledge and software for a more sustainable agriculture in general.

Lorhammer is a project powered by [itk](http://www.itk.fr/). We use it internally to choose the right network-server for our IoT infrastructure.
Furthermore, we use it to run integration tests every time we accept merge-request (same thing as a pull-request but in the gitlab world).
Indeed, for every new update, a stress test is launched over our IoT plateform and checkers check if all is ok, taking in consideration response time delays and data processing.

## License

This project is licensed under the Apache 2 License - see the `LICENSE.md` file for details