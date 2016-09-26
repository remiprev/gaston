# Gaston

Gaston is a Slack bot that snitches on user who remove their messages from
channels.

## Installation

```bash
$ git clone git@github.com:remiprev/gaston.git
```

## Environment variables

Gaston expects a few environment variables when it starts.

```bash
# Slack API token linked to the bot
SLACK_API_TOKEN=foo

# Comma-separated list of channels where the bot will listen
GASTON_CHANNELS=ABC123,DEF456
```

## Usage

```bash
$ mix run --no-halt
```