# Orchestration Test Spike
Test Spike of Orchestration Methods

# Cluster Test Environment
Vagrant will be used to create multiple VM's with networking automatically setup
to simulate a real environment.

## Server Descriptions
A minimum of 3 servers will be used but the number is configurable depending on the
`cluster_size` variable in your `orka/user_settings.yaml` file.

CoreOS will be used in case this test spike grows to include container orchestration
methods.

# Server and Container Orchestration Note

This project will be testing out methods for *server automation orchestration*.
The differences between server and container orcestration should be noted.  In a
containerized environment, a lot of the provisioning applications require is performed
in the container setup.

However, even if containers were utilized the underlying systems used would still
require an orchestration method to control necessary non-container aspects of the
system.  The orchestration of containers requires a separate system than what we
are currently looking at here.
