# ops-scripts

A personal library of practical command-line scripts for Linux administration, networking, homelab operations, NOC/SOC troubleshooting, monitoring, and automation.

The goal of this repository is to build a collection of small, understandable tools that solve real operational problems while also reinforcing shell scripting skills.

## Scripts

### `check-http`

Repeatedly checks an HTTP or HTTPS endpoint and displays response headers along with useful connection information.

Reports:

* HTTP status code
* Final URL after redirects
* Remote IP address
* Number of redirects
* Connection time
* Total response time

**Tags:** `network`, `http`, `https`, `curl`, `monitoring`, `troubleshooting`, `noc`

Example:

```bash
check-http http://192.168.1.174:3001
```

Help:

```bash
check-http --help
```

---

### `find-script`

Searches the local script library by script contents or metadata tags.

**Tags:** `scripts`, `search`, `library`, `grep`, `automation`

Examples:

```bash
find-script http
```

Search only script tags:

```bash
find-script --tag network
```

## Repository Structure

```text
ops-scripts/
├── README.md
├── bin/
│   ├── check-http
│   └── find-script
├── docs/
└── templates/
```

Executable scripts are stored in `bin/`.

## Script Metadata

Each script should begin with a standard metadata header:

```bash
#!/usr/bin/env bash

# Name:
# Description:
# Tags:
# Usage:
# Platform:
# Requires:
# Updated:
```

This makes the library searchable using normal command-line tools such as `grep`, while also providing consistent documentation.

## Using the Scripts

Add the repository's `bin` directory to your shell `PATH`:

```bash
export PATH="$HOME/ops-scripts/bin:$PATH"
```

For Bash, this can be added permanently to:

```text
~/.bashrc
```

Then reload the shell configuration:

```bash
source ~/.bashrc
```

Scripts can then be executed like normal commands:

```bash
check-http
find-script
```

## Design Principles

Scripts in this repository should be:

* Small and focused
* Readable and well-commented
* Safe by default
* Useful for real administrative or troubleshooting tasks
* Searchable using descriptive metadata and tags
* Free of passwords, API keys, tokens, private keys, and other secrets

## Planned Topics

Future scripts may cover:

* DNS troubleshooting
* Listening ports and network services
* SSH diagnostics
* Log analysis
* Disk and filesystem usage
* Process troubleshooting
* Systemd service health
* Docker diagnostics
* Proxmox administration
* Backup verification
* File permissions
* Git utilities
* Security and SOC investigation tasks
* Network reachability and latency testing

## Purpose

This repository serves as both a practical operations toolkit and an ongoing shell-scripting learning project.
