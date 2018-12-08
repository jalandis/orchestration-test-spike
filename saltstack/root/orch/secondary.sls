include:
  - orch.primary

Httpd Check:
  salt.function:
    - name: cmd.run
    - tgt: '*'
    - arg:
      - systemctl status httpd
    - require:
      - salt: HighState Setup
