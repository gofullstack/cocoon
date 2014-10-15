# Cocoon

Like a warm blanket cocoon is a Rails development Vagrant box to wrap your
Rails application in a repeatable environment. No more, "It works on my
machine."

## Getting Started

1. Install [Vagrant](https://www.vagrantup.com) and
[VirtualBox](https://www.virtualbox.org/wiki/Downloads)

1. Install the Vagrant Omnibus plugin.

    ```bash
    $ vagrant plugin install vagrant-omnibus
    ```
1. Clone this repo and cd into the directory

    ```bash
    $ git clone git@github.com:gofullstack/cocoon.git
    $ cd cocoon
    ```

1. Startup and provision Vagrant, you'll be promped for your local password.
The rest of this process may take a bit of time the first run, go grab a
:cookie: and come back.

    ```bash
    $ vagrant up
    ```

    If you get an error about DHCP server config

    ```
    There was an error while executing `VBoxManage`, a CLI used by Vagrant
    for controlling VirtualBox. The command and stderr is shown below.

    Command: ["dhcpserver", "add", "--ifname", "vboxnet0", "--ip", "172.28.128.2", "--netmask", "255.255.255.0", "--lowerip", "172.28.128.3", "--upperip", "172.28.128.254", "--enable"]

    Stderr: VBoxManage: error: DHCP server already exists
    ```

   Then run the following command and then vagrant up again (see https://github.com/mitchellh/vagrant/issues/3083 for details)

   ```bash
   $ VBoxManage dhcpserver remove --netname HostInterfaceNetworking-vboxnet0
   $ vagrant up
   ```

1. SSH into Vagrant box.

    ```bash
    $ vagrant ssh
    ```

1. cd into the code directory and start a new Rails project.

    ```bash
    $ cd code
    $ rails new awesomesauce
    ```

    or to use this as a wrapper for an existing project checkout your existing project

    ```bash
    $ cd code
    $ git clone git@github.com:your/project.git
    ```

1. Go about your regular Rails development business. Anything in the code
directory will be synced locally to the code directory in cocoon.

## Testing

Cocoon uses Test Kitchen and Rubocop to ensure the chef recipe is in tip
top shape. To run Test Kitchen change into the cocoon cookbook directory
located at `chef/cookbooks/cocoon` and run `kitchen test`. For Rubocop run
`rubocop`.

## Contributing

If you're interested in contributing to Cocoon, go for it! Just branch
from master to a feature branch, make your change and open a pull request.
