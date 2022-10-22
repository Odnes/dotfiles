#!/usr/bin/env python3

import subprocess
from urllib import request
from git import Repo, Git

APP_ROUTE = 'http://10.0.0.1:8002/admin'
# must be hardcoded cuz script is to be run as root for wg handling
USER_PATH = '/home/odnes'
SSH_IDENTITY = '%s/.ssh/id_ed25519' % USER_PATH
GIT_SSH_CMD = 'ssh -i %s' % SSH_IDENTITY
repo = Repo('%s/Documents/tti_articles' % USER_PATH)


def get_repo_differences(repo) -> tuple:
    repo = repo
    old_commit = repo.commit('HEAD~1')
    head_commit = repo.head.commit
    diff = old_commit.diff(head_commit)

    new = []
    updated = []
    for changed in diff:
        if changed.b_path.endswith('.md'):
            if changed.change_type == 'A':
                new.append(changed.b_path)
            elif changed.change_type == 'M':
                updated.append(changed.b_path)

    print('Articles to be created: ' + str(new) +
          ' \nArticles to be updated: ' +
          str(updated))
    return new, updated


def wg_is_up() -> bool:
    interfaces = []
    interfaces = subprocess.check_output("ls /sys/class/net", shell=True)
    interfaceString = str(interfaces)
    interfaceString = interfaceString[2:-3]
    interfaces = interfaceString.split('\\n')
    if 'wg0' in interfaces:
        return True


new, updated = get_repo_differences(repo)

if not wg_is_up():
    subprocess.run(['wg-quick', 'up', 'wg0'], check=True)

with repo.git.custom_environment(GIT_SSH_COMMAND=GIT_SSH_CMD):
    push_result = repo.remotes.origin.\
                       push('master')

if push_result[0].flags == 256:
    print("Fast forwarded")
elif push_result[0].flags == 512:
    print("Up to date")
else:
    print("Something went wrong with pushing")

for filename in new:
    request.urlopen(APP_ROUTE + '/article_from_md?filename=' + filename)
for filename in updated:
    request.urlopen(APP_ROUTE + '/update_article?filename=' + filename)
