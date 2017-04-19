#!/usr/bin/python3
from fabric.api import *
import time
"""
"""

def do_pack():
    """
    Compresses a repository into a tarball, puts it into a directory with versions.
    """
    formatstring = "tar -vcf webstatic." + time.strftime("%Y%m%d%H%M%S", time.localtime()) + ".tgz webstatic/"
    return(fabric.run(formatstring))

urn = do_pack()
print(urn)
