# Pixelated1.0

Main repository for PixelatedRP FiveM server.

## Development

TODO: Development environment guide coming soon.

## Deploying

### Staging
First, ensure that you have an ssh user set up properly on the staging server (talk to mailbox). Next, add a git remote for pushing to staging: `git remote add staging ssh://my-user@157.230.229.172/srv/git/pixelated.git/` replacing `my-user` with your ssh user name. From there, you're prepared to do the following steps whenever you need to deploy new code to staging:

1. `git checkout staging`
2. `git pull origin staging` (make sure everything is up to date)
3. `git merge my-branch`
4. `git push origin staging`
5. `git push staging staging`

The last command will push the staging branch to the staging server and automatically restart it immediately. Connect to 157.230.229.172:31021 with your FiveM client.

To view the logs on the staging server: `sudo journalctl -u fivem`.  Use `shift+G` to immediately scroll to the bottom.  Add the `-f` flag to the `journalctl` command to tail the log file.

### Production

TODO: Coming soon
