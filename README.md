# Pixelated1.0

Main repository for PixelatedRP FiveM server.

## Development

1. `git clone --recurse-submodules git@github.com:thetaintedtailor/PixelatedRp1.0.git`
2. `cd PixelatedRP1.0`
3. `git update-index --assume-unchanged server-data\dev_server.cfg`
4. Edit `server-data\dev_server.cfg` and change the line that says `set mysql_connection_string "server=xxx;database=xxx;userid=xxx;password=xxx"` to the correct DB connection values for your development server (talk to mailbox if you need DB access).

### Submodules

We use submodules to manage development across multiple server resources. For example, the `pixelated_radio` resource is [its own git repo](https://github.com/pixelated-rp/radio). If you're not actively developing any of the resources that are kept in submodules, you have nothing to worry about. When you `git pull`, you'll get all of the changes you need. However, if you start to edit the files in any resource that is a submodule, that's when you need to take care.

To see a list of all directories in the project which are submodules: `git config --file .gitmodules --name-only --get-regexp path`. If you're not making changes in any directory listed there, you don't need to read any further.

#### Working in Submodules

TODO: Coming soon

## Deploying

### Staging
We have a staging server for testing all changes (with the assistance of the QA team) before things get deployed to production. Getting code onto the staging server is a simple process:

1. Open a pull request against master with your proposed changes.
2. Locally (on your command line), `git checkout staging`
3. `git pull origin staging`
4. `git merge my-branch`
5. `get push origin staging`

The act of pushing the staging branch will automatically trigger a deploy to the staging server and immediately restart it.

If you need to manually restart the staging server, ssh into it and use `sudo systemctl restart fivem`.

To view the logs on the staging server: `sudo journalctl -u fivem`.  Use `shift+G` to immediately scroll to the bottom.  Add the `-f` flag to the `journalctl` command to tail the log file.

### Production

TODO: Coming soon
