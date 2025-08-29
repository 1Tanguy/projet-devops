# 📝 Application TodoList - Projet DevOps

## 🎯 Description du Projet

Cette application TodoList est un projet DevOps complet qui démontre l'intégration de technologies modernes avec des pratiques d'infrastructure as code, de conteneurisation et de déploiement automatisé.

### Architecture de l'Application

L'application suit une architecture 3-tiers :
- **Frontend** : Application Angular 15 avec Angular Material
- **Backend** : API REST Node.js avec Express et Sequelize ORM
- **Base de données** : MySQL 8.0

## 🏗️ Structure du Projet

```
projet-devops/
├── frontend/           # Application Angular
├── backend/           # API Node.js
├── k8s/              # Manifestes Kubernetes
├── iac/              # Infrastructure as Code (Terraform)
├── .github/          # Workflows GitHub Actions
└── docker-compose.yml # Configuration Docker Compose
```

## 🚀 Technologies Utilisées

### Frontend
- **Angular 15** - Framework web
- **Angular Material** - Composants UI
- **TypeScript** - Langage de programmation
- **SCSS** - Préprocesseur CSS

### Backend
- **Node.js** - Runtime JavaScript
- **Express 5** - Framework web
- **Sequelize** - ORM pour base de données
- **MySQL2** - Driver MySQL
- **Swagger UI** - Documentation API
- **Jest** - Framework de tests
- **CORS** - Gestion des requêtes cross-origin

### DevOps & Infrastructure
- **Docker** - Conteneurisation
- **Kubernetes (AKS)** - Orchestration de conteneurs sur Azure
- **Terraform** - Infrastructure as Code
- **GitHub Actions** - CI/CD
- **MySQL 8.0** - Base de données

## 📋 Prérequis

- **Node.js** 16+ et npm
- **Docker** et Docker Compose
- **kubectl** (pour Kubernetes)
- **Terraform** (pour l'infrastructure)
- **Git**

## 🛠️ Installation et Démarrage

### 1. Cloner le Projet

```bash
git clone <url-du-repo>
cd projet-devops
```

### 2. Démarrage avec Docker Compose (version locale)

```bash
# Construire et démarrer tous les services
docker-compose up --build

# En arrière-plan
docker-compose up -d --build
```

L'application sera accessible sur :
- **Frontend** : http://localhost
- **Backend API** : http://localhost:3000
- **Documentation API** : http://localhost:3000/api-docs

### 3. Démarrage en Mode Développement

#### Backend
```bash
cd backend
npm install
npm run dev
```

#### Frontend
```bash
cd frontend
npm install
npm start
```

## 🐳 Configuration Docker

### Services Docker Compose

- **mysql** : Base de données MySQL avec initialisation automatique
- **backend** : API Node.js exposée sur le port 3000
- **frontend** : Application Angular servie par Nginx sur le port 80

### Variables d'Environnement

Le fichier `.env` peut contenir :
```env
DB_HOST=mysql
DB_USER=todouser
DB_PASSWORD=todopassword
DB_NAME=todolist_db
NODE_ENV=production
PORT=3000
```

## ☸️ Déploiement Kubernetes (AKS)

L'application est déployée sur un cluster Azure Kubernetes Service (AKS) pour la production.

### Ressources Kubernetes Disponibles

- **Namespace** : Isolation des ressources
- **Deployments** : Frontend, Backend, MySQL
- **Services** : Exposition des applications
- **ConfigMaps** : Configuration des applications
- **Secrets** : Données sensibles
- **PVC** : Stockage persistant pour MySQL
- **Ingress** : Routage externe

### Déploiement

```bash
# Appliquer tous les manifestes
kubectl apply -f k8s/

# Vérifier le déploiement
kubectl get pods -n todolist
kubectl get services -n todolist
```

## 🏗️ Infrastructure as Code (Terraform)

Le dossier `iac/` contient les configurations Terraform pour provisionner l'infrastructure cloud nécessaire.

```bash
cd iac
terraform init
terraform plan
terraform apply
```

## 🔄 CI/CD avec GitHub Actions

Le workflow `.github/workflows/ci-cd.yml` automatise :
- Tests unitaires et d'intégration
- Construction des images Docker
- Déploiement sur Kubernetes
- Notifications de statut

## 🧪 Tests

### Backend
```bash
cd backend
npm test
```

### Frontend
```bash
cd frontend
npm test
```

## 📊 Monitoring et Observabilité

- **Health Checks** : Vérifications de santé des conteneurs
- **Logs** : Centralisation via Docker/Kubernetes
- **Métriques** : Surveillance des performances

## 🔧 Commandes Utiles

### Docker
```bash
# Voir les logs
docker-compose logs -f

# Redémarrer un service
docker-compose restart backend

# Nettoyer
docker-compose down -v
```

### Kubernetes
```bash
# Voir les pods
kubectl get pods -n todolist

# Logs d'un pod
kubectl logs -f <pod-name> -n todolist

# Port forwarding
kubectl port-forward service/frontend-service 8080:80 -n todolist
```

## 🚨 Dépannage

### Problèmes Courants

1. **Base de données non accessible**
   - Vérifier que MySQL est démarré
   - Contrôler les variables d'environnement

2. **Frontend ne charge pas**
   - Vérifier que le backend est accessible
   - Contrôler la configuration CORS

3. **Erreurs de build Docker**
   - Nettoyer les images : `docker system prune`
   - Reconstruire : `docker-compose build --no-cache`

## 📈 Améliorations Futures

- [ ] Mise en place de monitoring avec Prometheus/Grafana
- [ ] Ajout de tests end-to-end
- [ ] Implémentation de la sécurité (authentification/autorisation)
- [ ] Optimisation des performances
- [ ] Mise en place de backups automatisés

## 👥 Contribution

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/nouvelle-fonctionnalite`)
3. Commit les changements (`git commit -am 'Ajout nouvelle fonctionnalité'`)
4. Push vers la branche (`git push origin feature/nouvelle-fonctionnalite`)
5. Créer une Pull Request


