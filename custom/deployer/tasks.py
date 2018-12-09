import os
import invoke

def get_pylint_args():
    for root, dirs, files in os.walk("{}/deployer".format(os.getcwd())):
      for file in files:
        if file.endswith(".py"):
             yield os.path.join(root, file)

@invoke.task
def pylint(ctx):
    invoke.run("pylint " + " ".join(get_pylint_args()), echo=True)
