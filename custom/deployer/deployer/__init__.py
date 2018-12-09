import collections
from dotenv import load_dotenv
from fabric import Connection
from fabric.transfer import Transfer
import os

Server = collections.namedtuple('Server', 'host port user key')

load_dotenv()
vagrant_key = os.getenv("SSH_PRIVATE_KEY")

def command(server, cmd):
  with Connection(
      host=server.host,
      port=server.port,
      user=server.user,
      connect_kwargs={ "key_filename": server.key },
  ) as c:
    result = c.run(cmd, hide='both')
    print result.stdout.strip()

def test():
  server = Server(host='orka-node-1', port='22', user='vagrant', key=vagrant_key)
  command(server, 'uname -s')
  git_setup(server, 'nothing', '/opt/orka')
  copy_file(server, '/etc/hosts', '/tmp/remote_hosts')

def git_setup(server, source, target):
  with Connection(
      host=server.host,
      port=server.port,
      user=server.user,
      connect_kwargs={ "key_filename": server.key },
  ) as c:
    result = c.run('git --git-dir={0}/.git --work-tree={0} status'.format(target), hide='both')
    print result.stdout.strip()

def copy_file(server, source, target):
  with Connection(
      host=server.host,
      port=server.port,
      user=server.user,
      connect_kwargs={ "key_filename": server.key },
  ) as c:
    Transfer(c).put(local=source, remote=target)
    result = c.run('cat {}'.format(target), hide='both')
    print result.stdout.strip()
