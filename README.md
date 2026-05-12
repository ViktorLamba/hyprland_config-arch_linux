# Dotfiles Viktor

Мои dotfiles для рабочего окружения на Arch Linux с Hyprland. Это не универсальный
инсталлятор "для всех", а аккуратно собранный набор конфигов под мой ноутбук и
мой ежедневный сценарий: Wayland, тайлинг, быстрый терминал, нормальная панель,
уведомления, локскрин, обои и базовый набор программ.

## Железо и окружение

- OS: Arch Linux
- WM: Hyprland
- Login manager: SDDM
- CPU: AMD Ryzen 5 5600H
- GPU: NVIDIA GeForce RTX 3050 Ti Laptop
- Terminal: Kitty
- Shell: Fish
- Bar: Waybar
- Launcher: Wofi
- Notifications: SwayNC
- Lock/idle: Hyprlock + Hypridle
- Wallpaper: Hyprpaper + Waypaper
- File manager: Thunar

## Что внутри

- `hypr` - основной конфиг Hyprland, автозапуск, бинды, правила окон, NVIDIA env.
- `waybar` - верхняя панель с рабочими столами, треем, звуком, яркостью, батареей,
  сетью, Bluetooth, обновлениями, уведомлениями и меню питания.
- `wofi` - лаунчер приложений в тёмном стиле.
- `kitty` - терминал на JetBrains Mono с прозрачным тёмным оформлением.
- `fish` - минимальный shell-конфиг с запуском `fastfetch` в интерактивной сессии.
- `fastfetch` - короткий вывод информации о системе.
- `swaync` - центр уведомлений.
- `wlogout` - меню выхода/выключения.
- `gtk`, `nwg-look`, `xsettingsd` - GTK-тема Graphite-Dark, Papirus-Dark и общие настройки внешнего вида.
- `networkmanager-dmenu` - меню для NetworkManager.
- `thunar` и `desktop` - настройки файлового менеджера, MIME и pavucontrol.
- `wallpapers` - обои, которые раскладываются в `~/.config/wallpapers`.
- `packages` - списки пакетов для `pacman` и AUR.

## Установка

Скрипт ставит пакеты, делает бэкап старых конфигов из `~/.config` и раскладывает
новые конфиги через GNU Stow.

```bash
sudo pacman -S git stow
git clone https://github.com/USERNAME/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Если `yay` уже установлен, скрипт также поставит пакеты из `packages/aur.txt`.
Если `yay` не найден, AUR-шаг будет пропущен.

После установки лучше перезагрузиться или хотя бы перезагрузить Hyprland:

```bash
hyprctl reload
```

## Важно перед установкой

Скрипт переносит существующие нескриптовые конфиги из `~/.config` в папку вида:

```text
~/.dotfiles-backup-YYYYMMDD-HHMMSS
```

Это удобно, но всё равно стоит посмотреть список пакетов и конфиг Hyprland перед
запуском, особенно если железо или мониторы отличаются от моих. В `hyprland.conf`
уже прописаны настройки под NVIDIA/Wayland и мои мониторы:

- встроенный экран AU Optronics 1920x1080@165
- внешний монитор Shenzhen KTC AQ27H1 1920x1080@144

Если у тебя другой экран, нужно поправить секцию `MONITORS`.

## Основные бинды

- `SUPER + Q` - открыть Kitty
- `SUPER + R` - открыть Wofi
- `SUPER + E` - открыть Thunar
- `SUPER + B` - открыть браузер
- `SUPER + L` - заблокировать экран
- `SUPER + C` - закрыть активное окно
- `SUPER + V` - переключить floating-режим окна
- `SUPER + 1..0` - перейти на рабочий стол
- `SUPER + SHIFT + 1..0` - перенести окно на рабочий стол
- `SUPER + стрелки` - переместить фокус
- `SUPER + N` - открыть Waypaper
- `SUPER + T` - меню сети
- `PrintScreen` - скриншот всего экрана через Hyprshot
- `SUPER + SHIFT + S` - скриншот области

## Пакеты

Базовые пакеты лежат в:

```text
packages/pacman.txt
```

AUR-пакеты лежат в:

```text
packages/aur.txt
```

Там есть Hyprland-стек, NVIDIA-драйверы, PipeWire, Waybar, Wofi, Kitty,
SDDM, Thunar, Firefox/Chrome, Telegram, VS Code, темы, шрифты и прочие утилиты.

## Для себя

Этот репозиторий хранит состояние моей рабочей системы. Если переносить его на
другую машину, первым делом стоит проверить:

- мониторы в `hypr/.config/hypr/hyprland.conf`
- пути к обоям в `hyprpaper.conf`
- NVIDIA/AMD-пакеты в `packages/pacman.txt`
- настройки яркости Waybar, сейчас используется `amdgpu_bl1`
- список AUR-пакетов, чтобы не тащить лишнее
