# ops-scripts

A personal library of practical command-line scripts for Linux administration, networking, homelab operations, NOC/SOC troubleshooting, monitoring, and automation.

The goal of this repository is to build a collection of small, understandable tools that solve real operational problems while also reinforcing shell scripting skills.

## Scripts


### `check-service`

Checks the status and health of a Linux service managed by systemd.

Displays:

- Service type and current state
- Startup configuration (enabled, disabled, or static)
- Most recent execution result
- Main process exit status
- Service status and recent journal entries
- Health assessment

**Tags:** `linux`, `systemd`, `services`, `monitoring`, `troubleshooting`, `noc`

Examples:

```bash
check-service ssh
check-service apt-daily
check-service docker
```

Help:

```bash
check-service --help
```

**Exit codes:**

- `0` — Service is active, or an inactive oneshot service completed successfully.
- `1` — Service is inactive or failed and does not meet the success conditions.
- `2` — Invalid arguments or service not found.

**Note:** An inactive service is not necessarily unhealthy. Some services are designed to run periodically or only when triggered. The health assessment reports the service's current systemd state and does not determine whether it is operating according to its intended schedule.

**Requires:** Bash, systemd, `systemctl`, and `journalctl`.

---

### `check-port`

Tests whether a TCP port is reachable on a specified hostname or IP address.

Displays the connection result and returns an exit code suitable for use in monitoring scripts and automation.

**Tags:** `network`, `tcp`, `ports`, `monitoring`, `troubleshooting`, `noc`

Examples:

```bash
check-port docker.corp.home.arpa 22
check-port 192.168.1.174 443
```

Help:

```bash
check-port --help
```

**Exit codes:**

- `0` — TCP connection succeeded.
- `1` — TCP connection failed.
- `2` — Invalid or missing arguments.

**Requires:** Bash and OpenBSD netcat (`nc`).

---

### `check-dns`

Checks DNS resolution for a hostname using the system's default DNS resolver or a specified DNS server.

Displays:

- DNS response status (such as NOERROR or NXDOMAIN)
- IPv4 address records
- DNS server that answered the query
- Query response time

**Tags:** `dns`, `network`, `monitoring`, `troubleshooting`, `noc`

Example using the system's default DNS resolver:

```bash
check-dns google.com

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

Help:

```bash
find-script --help
```

The search includes scripts regardless of their filename extension.

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
