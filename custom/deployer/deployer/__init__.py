"""
Deployer module.
"""

import collections
import os

from dotenv import load_dotenv
from fabric import Connection
from fabric.transfer import Transfer

load_dotenv()
VAGRANT_KEY = os.getenv("SSH_PRIVATE_KEY")

Server = collections.namedtuple('Server', 'host port user key')

def setup_server_connection(server):
  """
  Creates a Fabric Connection from Server collection.

  Args:
    server (collection): Collection with server data

  Returns:
    Connection: A prepared Fabric connection
  """
  return Connection(
      host=server.host,
      port=server.port,
      user=server.user,
      connect_kwargs={"key_filename": server.key},
  )

def command(server, cmd):
  """
  Simple ssh remote command.

  Args:
    server (collection): Collection with server data
    cmd (string): Command to run on remote server

  Returns:
    string: STDOUT for the remote command
  """
  with setup_server_connection(server) as connection:
    result = connection.run(cmd, hide='both')
    return result.stdout.strip()

def git_status(server, root):
  """
  Git status of remote repository.

  Args:
    server (collection): Collection with server data
    root (string): Directory of git repository on remote server

  Returns:
    string: STDOUT for the remote command
  """
  return command(server, 'git --git-dir={0}/.git --work-tree={0} status'.format(root))

def copy_file(server, source, target):
  """
  Copy local file to remote server.

  Args:
    server (collection): Collection with server data
    source (string): File on local file system
    target (string): Desitination file on remote file system
  """
  with setup_server_connection(server) as connection:
    Transfer(connection).put(local=source, remote=target)

def test():
  """
  Test method for module.
  """
  server = Server(host='orka-node-1', port='22', user='vagrant', key=VAGRANT_KEY)
  print command(server, 'uname -s')
  print git_status(server, '/opt/orka')

  copy_file(server, '/etc/hosts', '/tmp/remote_hosts')
  print command(server, 'cat /tmp/remote_hosts')
