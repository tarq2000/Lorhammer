# Lorhammer



# Lorhammer Installation Guide

This guide outlines the steps to install and run Lorhammer on your local environment.

## Prerequisites

Before you begin, ensure you have `git` and `make` installed on your system.

## Installation

1. **Clone the repository:**

   Clone Lorhammer to your local machine by running the following command:

   ```bash
   git clone https://github.com/tarq2000/Lorhammer.git

1. **Add directory **

   add Lorhammer directory

   ```bash
   cd Lorhammer

3. **Then need to make build :**

   
   ```bash
   make

4. **start mandatory tools :**


   ```bash
   ./resources/scripts/launchTools.sh

5. **start lorhammer worker**

   please change the  127.0.0.1 what your host (use  127.0.0.1 for local host) : 


   ```bash
   ./build/lorhammer -mqtt tcp://127.0.0.1:1884

6. **Ensure the Binary is Executable**

   First, set the orchestrator binary as executable. This is crucial to ensure that you can run it from the command line. Execute the following command: 


   ```bash
   chmod +x ./build/orchestrator

7. **Run the Orchestrator**

   Now that the binary is executable, you can start the orchestrator. Given that you've confirmed its location, use this command to run it: 

   ```bash
   ./build/orchestrator -mqtt tcp://127.0.0.1:1884 -from-file "./resources/scenarios/simple.json"
8. **Start simulating **

   To start only one lorhammer simulating 10 gateways with 5 nodes per gateway:

   ```bash
   ./build/lorhammer -nb-gateway 10 -min-nb-node 5 -max-nb-node 5 -ns-address 127.0.0.1:1700 -mqtt mqtt://127.0.0.1:1884
.







# About Lorhammer

(https://gitlab.com/itk.fr/lorhammer/commits/master)
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


## License

This project is licensed under the Apache 2 License - see the `LICENSE.md` file for details

## Orginal file

(The orginal file is in the Lorhammer website : http://lorhammer.itk.fr/)
