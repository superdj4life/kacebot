Kacebot README
================

Kacebot is a slack bot that responds to messages that contain a Kace ticket ID with the Kace URL to that ticket.
Kacebot is built using [daemon-kit](https://github.com/kennethkalmer/daemon-kit)
and is based on the Slack realtime messaging API and the slack-api gem.
This implementation was heavily influenced by [dblock](http://code.dblock.org/2015/04/28/slack-bot-real-time-messaging-api-integration-tutorial.html).


Install
===========

Run 'bundle install' to install the project dependencies.

Configuration
===============

In Slack, create a Bot integration. Take note of the bot name and token.
Edit the config/config.yml file to include your Slack bot token, the Slack bot name, and the Kace domain.
By default the token is read from an env variable; you can hardcode this if needed but
the preferred method is to read it from an env variable. If you hardcode the token,
don't forget to remove the config.yml file from version control.

Running kacebot
=================

The Kacebot executable is in the project's bin folder. You can start kacebot with './[Project Directory]/bin/kacebot start'.
You can also supply env flag with -e or --env. For example, in production you can run
'./[Project Directory]/bin/kacebot start -e production'

Logging
=======

By default, Kacebot logs to environment specific log files in the log/ directory.
You can specifiy a log file at start with -l or --log flag

Support for log rotation:
Support for logrotate is baked right into daemon-kit. By sending your daemon a HUP signal all the log files file be closed and re-opened again on first use. Here is an example logrotate configuration:
```
/path/to/daemon.log {
    rotate 5
    weekly
    postrotate
      kill -HUP `cat /path/to/daemon.pid`
    endscript
}
```

Help
=====

For more detailed help run 'kacebot --help' or visit the [daemon-kit GitHub page](https://github.com/kennethkalmer/daemon-kit).
