from faker import Faker
import json
import os

def generate_user():
    fake = Faker('fr_FR')
    user = {
        "name": fake.name(),
        "email": fake.email(),
        "username": fake.user_name(),
        "password": fake.password(length=10)
    }
    return user

if __name__ == "__main__":
    output_dir = "../ProjetSIGE/data"
    output_path = f"{output_dir}/faker_data.json"

    # Crée le dossier ../data s’il n’existe pas
    os.makedirs(output_dir, exist_ok=True)

    user_data = generate_user()
    print(user_data)  # juste avant l'ouverture du fichier
    print(os.path.abspath(output_path))  #Afficher le chemin absolu
    with open(output_path, "w") as f:
        json.dump(user_data, f, indent=4)

    print(f"Fichier JSON généré : {output_path}")
