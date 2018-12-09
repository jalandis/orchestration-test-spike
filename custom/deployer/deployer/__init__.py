import collections
import os

from dotenv import load_dotenv
from fabric import Connection
from fabric.transfer import Transfer

load_dotenv()
VAGRANT_KEY = os.getenv("SSH_PRIVATE_KEY")

Server = collections.namedtuple('Server', 'host port user key')

def setup_server_connection(server):
  return Connection(
      host=server.host,
      port=server.port,
      user=server.user,
      connect_kwargs={"key_filename": server.key},
  )

def command(server, cmd):
  with setup_server_connection(server) as connection:
    result = connection.run(cmd, hide='both')
    print result.stdout.strip()

def git_status(server, root):
  command(server, 'git --git-dir={0}/.git --work-tree={0} status'.format(root))

def copy_file(server, source, target):
  with setup_server_connection(server) as connection:
    Transfer(connection).put(local=source, remote=target)
    result = connection.run('cat {}'.format(target), hide='both')
    print result.stdout.strip()

def test():
  server = Server(host='orka-node-1', port='22', user='vagrant', key=VAGRANT_KEY)
  command(server, 'uname -s')
  git_status(server, '/opt/orka')
  copy_file(server, '/etc/hosts', '/tmp/remote_hosts')
