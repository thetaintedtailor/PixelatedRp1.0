# Pixelated1.0

Main repository for PixelatedRP FiveM server.

## Development

TODO: Development environment guide coming soon.

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
