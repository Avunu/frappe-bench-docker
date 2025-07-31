# frappe-bench-docker

🚀 **Deploy persistent docker-powered Frappe sites without building custom images**

A simplified Docker setup for [Frappe](https://github.com/frappe/frappe) and [ERPNext](https://github.com/frappe/erpnext) development that provides persistent storage and easy management through convenient scripts.

## ✨ Features

- **No Custom Images Required**: Uses official `frappe/bench:latest` Docker image
- **Persistent Storage**: Your bench and data persist across container restarts
- **Easy Setup**: Interactive setup script to configure your environment
- **Development Ready**: Includes file watching, debugging, and hot reload
- **Full Stack**: Includes MariaDB, Redis, web server, and all Frappe services
- **Print Server**: Optional CUPS integration for printing functionality
- **CLI Tools**: Convenient scripts to run bench commands

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/) (version 20.10 or later)
- [Docker Compose](https://docs.docker.com/compose/install/) (version 2.0 or later)
- [Git](https://git-scm.com/downloads)

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/Avunu/frappe-bench-docker.git
cd frappe-bench-docker
```

### 2. Run Setup

**Linux/macOS:**
```bash
./setup.sh
```

**Windows (PowerShell):**
```powershell
.\setup.ps1
```

The setup script will:
- Prompt you to configure environment variables (or use defaults)
- Create necessary configuration files
- Start all Docker services
- Initialize your Frappe bench

### 3. Access Your Site

Once setup is complete, your Frappe site will be available at:
- **URL**: http://localhost:8080
- **Username**: Administrator  
- **Password**: The password you set during setup (default: `admin`)

## ⚙️ Configuration

### Environment Variables

The setup script creates a `.env` file with these configurable options:

| Variable | Default | Description |
|----------|---------|-------------|
| `FRAPPE_VERSION` | `version-15` | Frappe version to install |
| `FRAPPE_SITE_NAME_HEADER` | `development.localhost` | Site name/domain |
| `SITE_PASSWORD` | `admin` | Administrator password |
| `DB_ROOT_PASSWORD` | `123` | MariaDB root password |
| `CUPS_USER_ADMIN` | `lpadmin` | CUPS admin username |
| `CUPS_USER_PASSWORD` | `123` | CUPS admin password |

### Manual Configuration

If you prefer to configure manually:

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit `.env` with your preferred values

3. Start the services:
   ```bash
   docker compose up -d
   ```

## 🛠️ Usage

### Running Bench Commands

Use the provided scripts to run bench commands:

**Linux/macOS:**
```bash
./bench.sh "list-apps"
./bench.sh "new-app myapp"
./bench.sh "install-app myapp"
```

**Windows (PowerShell):**
```powershell
.\bench.ps1 "list-apps"
.\bench.ps1 "new-app myapp"  
.\bench.ps1 "install-app myapp"
```

### Common Commands

```bash
# List installed apps
./bench.sh "list-apps"

# Create a new app
./bench.sh "new-app myapp"

# Install an app to your site
./bench.sh "install-app myapp"

# Update bench
./bench.sh "update"

# Migrate your site
./bench.sh "migrate"

# Access bench console
./bench.sh "console"

# Clear cache
./bench.sh "clear-cache"
```

### Managing Services

```bash
# View running services
docker compose ps

# View logs
docker compose logs -f

# Stop all services
docker compose down

# Restart services
docker compose restart

# Rebuild and restart
docker compose up -d --build
```

## 🏗️ Architecture

This setup includes the following services:

| Service | Purpose | Port |
|---------|---------|------|
| `configurator` | Initial setup and configuration | - |
| `backend` | Frappe web application | 8000 (internal) |
| `websocket` | Real-time communications | 9000 (internal) |
| `web` | Caddy reverse proxy | 8080 |
| `watch` | File watching for development | - |
| `schedule` | Scheduled job runner | - |
| `worker_*` | Background job workers | - |
| `mariadb` | Database server | 3306 (internal) |
| `redis-cache` | Cache server | 6379 (internal) |
| `redis-queue` | Queue server | 6379 (internal) |
| `cupsd` | Print server (optional) | 8631 |

### Data Persistence

- **Frappe Bench**: `./frappe-bench/` (mounted as volume)
- **Database**: `./mariadb-data/` (mounted as volume)
- **Configuration**: `./cupsd.conf`, `./printers.conf`

## 🔧 Development

### File Watching

The `watch` service automatically rebuilds assets when files change. This is enabled by default in development mode.

### Debugging

You can attach a debugger to the running backend service. The bench is available at `/home/frappe/frappe-bench` inside the containers.

### Custom Apps

To develop custom apps:

1. Create your app:
   ```bash
   ./bench.sh "new-app myapp"
   ```

2. Your app will be created in `./frappe-bench/apps/myapp`

3. Install the app:
   ```bash
   ./bench.sh "install-app myapp"
   ```

4. Edit files in `./frappe-bench/apps/myapp` - changes will be reflected immediately

## 🚨 Troubleshooting

### Common Issues

**Services won't start:**
- Ensure Docker is running
- Check if ports 8080 or 8631 are already in use
- Run `docker compose logs` to see error messages

**Site not accessible:**
- Wait a few minutes for initial setup to complete
- Check that the `configurator` service has finished running
- Verify the `.configured` file exists in `./frappe-bench/`

**Permission errors:**
- Ensure the `frappe-bench` directory has correct permissions
- The setup handles this automatically, but manual intervention may be needed

**Database connection errors:**
- Verify MariaDB service is running: `docker compose ps mariadb`
- Check database logs: `docker compose logs mariadb`

### Resetting Everything

To start fresh:

```bash
# Stop all services
docker compose down

# Remove all data (⚠️ This will delete your database and bench!)
sudo rm -rf frappe-bench mariadb-data .env cupsd.conf printers.conf

# Run setup again
./setup.sh
```

### Getting Help

- Check the [official Frappe documentation](https://docs.frappe.io/)
- Review [frappe_docker documentation](https://github.com/frappe/frappe_docker)
- Open an issue in this repository for setup-specific problems

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

### Development Setup

1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Test the setup process
5. Submit a pull request

## 🙏 Acknowledgments

- [Frappe Framework](https://github.com/frappe/frappe) for the excellent framework
- [frappe_docker](https://github.com/frappe/frappe_docker) for the base Docker setup
- The Frappe community for continued support and development
