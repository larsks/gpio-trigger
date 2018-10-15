This is a systemd unit for triggering actions based on GPIO events.
It uses the `gpio` command from the `wiringpi` package to wait for
events.

## Installation

Run `make install`.  This will:

- Place `gpio-trigger@.service` in `/etc/systemd/system`
- Create `/etc/gpio-triggers` if it does not exist.

## Configuration

Create a file in `/etc/gpio-triggers` named after the BCM GPIO pin
number.  This file may set any of the following variables:

- `GPIO_COMMAND` (required) -- the command to run when the even is triggered.
- `GPIO_PULL` (default `up`) -- this may be `up`, `down`, or `tri`.
- `GPIO_DIR` (default `falling`) -- this may be `rising` or `falling`
- `GPIO_DEBOUNCE` (default `1.0`) -- the number of seconds to wait
  after triggering an event before triggering the next one.

For example, if I want GPIO4 to trigger a restart, I would
create `/etc/gpio-triggers/4` with the following content:

    GPIO_COMMAND='reboot'

To enable the service, run (as root):

    systemctl enable --now gpio-trigger@4

This will trigger a reboot when you connecto GPIO4 to ground.
