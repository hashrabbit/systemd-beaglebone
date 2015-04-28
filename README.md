# systemd-beaglebone

Use systemd-beaglebone to manage device tree overlays (capes) and initializing
GPIOs through systemd. Capes are treated as individual service units and GPIOs
are managed through files under `/usr/lib/gpios.d/`.

## Installation

Clone the repository or download one of the [releases] then `make install`.

[releases]: https://github.com/hashrabbit/systemd-beaglebone/releases

## Usage

### Loading Capes

Additional capes can be enabled through systemctl:

```sh
systemctl enable bone-capemgr@BB-BONE-BACON.service
systemctl enable bone-capemgr@BB-BONE-GPS.service
```

### Exporting GPIOs

GPIOs are defined in files under `/usr/lib/gpios.d/`. See [README.gpios] for
more information. Files are sorted alphabetically before being run by
the gpio.service.

As an example, a file could be placed at `/usr/lib/gpios.d/leds`:

```
# <pin> <direction> <value>
123     out         1
456     in
```

When the GPIO service starts, it would effectively execute:

```sh
echo 123 > /sys/class/gpios/export
echo out > /sys/class/gpios/gpio123/direction
echo 1 > /sys/class/gpios/gpio123/value
echo 456 > /sys/class/gpios/export
echo in > /sys/class/gpios/gpio456/direction
```

[README.gpios]: https://github.com/hashrabbit/systemd-beaglebone/blob/master/README.gpios

## Contributing

1. Fork it (https://github.com/hashrabbit/systemd-beaglebone/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
