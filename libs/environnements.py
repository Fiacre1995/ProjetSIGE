import os

# Lire l'environnement depuis la variable système ENV, défaut dev
ENV = os.environ.get("ENV", "dev").lower()

# Variables par environnement
env_vars = {
    "recette": {
        "URL": "https://openemis.recette-sige.education.gouv.ci/",
        "USERNAME": "dev_user",
        "PASSWORD": "dev_pass",
        "BROWSER": "chrome",
        "TIMEOUT": 5
    },
    "preprod": {
        "URL": "https://openemis.preprod-sige.education.gouv.ci/",
        "USERNAME": "stage_user",
        "PASSWORD": "stage_pass",
        "BROWSER": "chrome",
        "TIMEOUT": 10
    }
}

# Expose variables au format Robot Framework
for key, value in env_vars.get(ENV, {}).items():
    globals()[key] = value