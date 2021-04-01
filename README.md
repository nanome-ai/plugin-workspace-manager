# Nanome - Workspace Manager

A Nanome Plugin allowing standalone VR headset users to save and load workspaces.

## Dependencies

[Docker](https://docs.docker.com/get-docker/)

## Usage

To run Workspace Manager in a Docker container:

```sh
$ cd docker
$ ./build.sh
$ ./deploy.sh -a <plugin_server_address> [optional args]
```

### In Nanome:

- Activate Plugin
- Login with account (default is admin/admin)
- Name your workspace, then click on "Save" to save your workspace
- Click on a workspace to load it
- Click on delete next to a workspace to remove it from the plugin's storage

### Managing Accounts:

Accounts for the workspace manager plugin are stored in `~/Documents/nanome-workspace-manager/accounts.txt`.

Each line contains `<username> <password> <is_admin>` where the password is hashed.

`is_admin` can either be `0` or `1` where `1` will allow the user to view and delete anyone's workspace.

To add an account, add a line to the file with the plaintext `username`, `password`, and `is_admin`. The next time the plugin is run, all plaintext passwords will automatically be hashed.

To change the password of an account, simply change the second value on a line to the desired password.

| NOTE: make sure to replace the admin account or change its password! |
| - |

If you do not wish to use accounts, you can start the plugin with the `-d` or `--disable-accounts` flag. Note that when accounts are disabled, everyone connected to the plugin can see or delete everyone else's saved workspaces.

## Development

To run Workspace Manager with autoreload:

```sh
$ python3 -m pip install -r requirements.txt
$ python3 run.py -r -a <plugin_server_address> [optional args]
```

## License

MIT
