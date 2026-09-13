# ZPWA Safety & System Integrity

## The Snapshot-First Workflow
ZPWA is built on the principle that every modification should be reversible. Before the suite alters any of your configuration files, it creates a timestamped `.bak` snapshot of the affected files.

* **Location:** All system snapshots are stored in `${XDG_DATA_HOME:-$HOME/.local/share}/zpwa/snapshots/`.
* **Scope:** ZPWA targets specific integration points such as `bindings.conf` using timestamped backups.
* **Precision:** Instead of overwriting your files, ZPWA injects marked blocks. This ensures that even if an injection occurs, your personal configurations remain untouched and easily recoverable.

## Contained Execution
ZPWA is designed to be as non-intrusive as possible. Outside of the initial installation which requires `sudo` to place the package in `/usr/share/`, the entire suite operates with standard user privileges.

* **Profile Isolation:** All PWA profiles are generated within `~/.zen/` and prefixed with `webapp.` for easy identification. These are independent instances and do not touch your primary Zen Browser `profiles.ini`.
* **Centralized Logic:** The suite’s internal logic, dispatcher registry, and local payloads are contained entirely within `${XDG_DATA_HOME:-$HOME/.local/share}/zpwa/`.
* **Zero Root Requirement:** Once installed, `zpwa` does not require administrative privileges to create, manage, or delete your PWAs.

## Standards-Compliant Architecture
ZPWA is engineered to respect standard desktop conventions:
* It targets only the dedicated user-modifiable directories.
* It does not modify system binaries, global `/etc/` configurations, or the core Zen Browser engine.

## The "User is King" Disclaimer
While ZPWA automates setup on an Arch Linux system, this is Arch.

**The user is the ultimate authority.** ZPWA provides the tools for automation and the safety nets for recovery, but the final onus of system protection lies with the user. It is your responsibility to:
1. Maintain regular backups of your `.config` directory.
2. Follow the correct order of operations (e.g., using `zpwa revert` before package removal).
3. Audit the utility's files in `${XDG_DATA_HOME:-$HOME/.local/share}/zpwa/` if you have specific security or utility requirements.

ZPWA is a tool for power users; use it with the caution that a custom-tailored Linux environment demands.
