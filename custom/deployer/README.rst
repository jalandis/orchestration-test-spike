===========================================
Test Spike for custom orchestration method
===========================================

Requirements
------------

Operations of a common bootstrap for a job:
  - Setup runner (build server) for new build
      - Setup new artifacts (git checkout or download from artifactory)
      - Provision runner - Installation and configuration or necessary applications
  - Execute one or more remote commands
  - Return build results from runner

The runner is expected to have its own more complex orchestration methods.

Project Setup
-------------

See **config/master_bootstrap.sh** for setup and build instructions.

Artifact Repository
^^^^^^^^^^^^^^^^^^^

Once the project is built, the python wheel can be hosted in our local PyPi repository.

See **config/master_bootstrap.sh** for deploy instructions.

TODO
----

Project needs some static code analysis tools and inclusion of **Sphinx** for documentation.
