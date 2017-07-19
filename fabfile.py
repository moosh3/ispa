import datetime
import functools
import os
import sys
import tempfile

from fabric import api as fab
from fabric.state import env
from fabric.contrib.console import confirm
from fabric import utils
from fabric.colors import red, green

class MissingImageException(Exception):
    pass

DOCKERFILES = {
    'base': 'Dockerfile.base',
    'local': 'Dockerfile.local',
    'unittest': 'Dockerfile.unittest',
    'statics': 'Dockerfile.statics'
}

def build(*dockerfiles, **kwargs):
    '''Build docker images
    Usage:
        fab build:<DOCKERFILES.keys()>,tag=<TAG>,app=<APP>
    '''
    env.output_prefix = False
    tag = kwargs.get('tag', 'latest')
    app = kwargs.get('app', 'ispa')
    if not dockerfiles:
        dockerfiles = DOCKERFILES.keys()
    for image in dockerfiles:
        value = DOCKERFILES[image]
        try:
            if isinstance(value, tuple):
                continue
        except (MissingImageException, CatchableExceptions):
            utils.abort('Missing (image, dockerfile) tuple')

        with fab.quiet():
            is_running = fab.local(
                'docker images|grep {}:{}'.format(image_name, tag), capture=True
            )
        if is_running.return_code != 0:
            if not confirm(red('Image {}:{} already exists, are you sure '
                    'are you sure you\'d like to rebuild it?'.format(
                        image_name, tag)), default=False):
                utils.abort('Not building image {}:{}'.format(image_name, tag))
        fab.puts(green('Removing previous image:tag'))
        fab.local("docker images -q {}:{} | xargs docker rmi".format(
            image_name, tag))
        fab.puts(green("Building image from {}".format(value)))
        build_cmd = (
            'docker build -t {image_name}:{tag} -f {dockerfiles} .'.format(
                **{
                    'image_name': image_name,
                    'tag': tag,
                    'dockerfiles': value,
                }
            )
        )
        fab.local(build_cmd)

    fab.puts(green("Finished building!"))

ispa = {'ispa': 8000}

def start(*ispa):
    fab.puts('Starting...')
    docker_cmd = (
        'docker run -it --rm -d '
        '--workdir=/home/docker '
        '--volume $(pwd):/home/docker/ '
        '--name {host} --hostname {host} '
        '--publish {port}:{port} '
        'ispa:latest ./manage.py runserver 0.0.0.0:{port}; '.format(
            **{
                'host': 'ispa',
                'port': 8000
            }
        )
    )
    fab.puts(docker_cmd)
    with fab.quiet():
        start_msg = fab.local(docker_cmd, capture=True)
    if start_msg.return_code > 0:
        raise Exception(
            'Faile to start'
        )
