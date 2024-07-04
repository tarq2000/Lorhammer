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

5. **Ensure the Binary is Executable**

   First, set the orchestrator binary as executable. This is crucial to ensure that you can run it from the command line. Execute the following command: 


   ```bash
   chmod +x ./build/orchestrator

6. **Run the Orchestrator**

   Now that the binary is executable, you can start the orchestrator. Given that you've confirmed its location, use this command to run it: 

   ```bash
   ./build/orchestrator -mqtt tcp://127.0.0.1:1884 -from-file "./resources/scenarios/simple.json"
.








> Stress your lora network-server

[![status](https://gitlab.com/itk.fr/lorhammer/badges/master/build.svg)](https://gitlab.com/itk.fr/lorhammer/commits/master)
[![coverage report](https://gitlab.com/itk.fr/lorhammer/badges/master/coverage.svg)]

When building a big iot lora platform handling millions of messages per seconds, how to be sure we handle all the messages in time ? Today, no publicly accessible tool enables us to simulate the behavior of a wide lora infrastructure along with the messages.

Lorhammer is here to do that. You can launch as much lorhammers as you want to stress and test your network-server.## License

This project is licensed under the Apache 2 License - see the `LICENSE.md` file for details