# 🗃 dotfiles
Managed with [chezmoi](https://www.chezmoi.io/)

## 🖥 Install on a new machine
```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```

## ⬆ Updating to remote
```bash
chezmoi add <path_to_config_file>
chezmoi cd
git push -u origin main
```

## ⬇ Updating from remote
```bash
chezmoi update
```

## 🔮 Preview update from remote
```bash
chezmoi git pull -- --autostash --rebase && chezmoi diff
```

then to apply

```bash
chezmoi apply
```
