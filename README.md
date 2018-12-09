# Orchestration Test Spike
Test Spike of Orchestration Methods

# Cluster Test Environment
Vagrant will be used to create multiple VM's with networking automatically setup
to simulate a real environment.

## Server Descriptions
A minimum of 3 servers will be used but the number is configurable depending on the
`cluster` variable in your `orka/user_settings.yaml` file.

For simplicity, Centos will be used for these clusters.  Please note, there is an
issue with VirtualBox and Centos that impedes the automatic installation of VB Guest
Additions.

# Automation VS Orchestration Note

Automation is simply the scripting of certian jobs to remove manual intervention.
The difference between that and orchestration is that automation works on a single
system. For our purposes and in a lot of online documenation, a single system is
defined as one server.  That is a convenient if simplistic distinction that will
be used to differentiate the 2 terms.

# Server and Container Orchestration Note

This project will be testing out methods for *server orchestration*.  The differences
between server and container orcestration should be noted.  In a containerized environment,
a lot of the provisioning applications require is performed in the container setup.

However, even if containers were used the underlying servers would still require
an orchestration method to control necessary non-container aspects of the system.
The orchestration of containers requires a separate solution than what we are currently
looking at here.

Theoretically VM's may be automatically provisioned depending on the needs of required
containers.  These could then also be destroyed automatically to produce an immutable
system.  Both SaltStack and Ansible offer some support for this aspect of orchestration
and it may be useful to extend this project to test those features as well.

## SaltStack

The SaltStack orchestration test spike is utilizing an agent setup with gpg keys
shared between master and nodes.  After a `vagrant up --provision` the following
commands will show the simple orchestration of a Salt highstate (full server provision).

```
vagrant ssh orka-master --command "sudo salt '*' test.ping"
vagrant ssh orka-master --command "sudo salt '*' state.apply"
vagrant ssh orka-master --command "sudo salt-run state.orchestrate orch.secondary"
```

## Ansible

The Ansible orchestration test spike is utilizing an *agentless* setup with gpg
keys shared between master and nodes.  After a `vagrant up --provision` the following
commands will show the simple orchestration of a simple playbook.

```
vagrant ssh ansible-master --command "sudo ansible all -m ping"
vagrant ssh ansible-master --command "sudo ansible-playbook /opt/orka/ansible/config/playbook.yml"
```

## Custom

For simple tasks, the full blown SaltStack or Ansible solutions are too much for
what amounts to simple bash of python scripts.  It is possible to get limited orchestration
with a reusable Python project.  This test spike will act as the bridge between
Bamboo and the orchestration server.  A packaged python project that encompasses
common tasks to prevent code duplication.
