

- automatic provisioning of machines, preconfigured with an IP address, hostname, and SSH key, nameserver etc...
- those configurations dont change in the lifetime of the machine ( fixed per mac address possibly)
- when machines bootup they call ansible pull to apply configurations automatically as the ansible role is passed to the machine when its configured
- bonus points, to see a list of all machines running with all details in a web interface ( possibly proxmox UI if proxmox agent is working perfectly)