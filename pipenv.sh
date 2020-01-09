# create venv with a specific python version
# create "Pipfile" and "Pipfile.lock" files
# do not activate the recently created venv
pipenv install --python 3.7.4

# activate and reactivate the virtual env
pipenv shell

# we can find all virtual envs in
ls ~/.local/share/virtualenvs

# exiting the virtual env
exit

# check installed packages
pipenv lock -r

# install python packages
pipenv install <package>

# uninstall a package
pipenv uninstall <package>

# install a dev package
pipenv install <package> --dev

# install from requirements
pipenv install -r ./requirements.txt

# check dependency graph
pipenv graph

# set lockfile - before deployment
pipenv lock

# run a jupyter notebook inside a environment
pipenv run jupyter notebook

## References
# https://gist.github.com/bradtraversy/c70a93d6536ed63786c434707b898d55