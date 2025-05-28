🛠️ Sajan's Dotfiles

Welcome to my personal Dotfiles repository! This is where I keep my configuration files for a clean, productive, and visually appealing development environment.
🔑 Key Features

  - i3 Window Manager: Optimized for efficiency and customization.
  - Kitty Terminal: Personalized themes and settings for a sleek terminal experience.
  - Gruvbox Material Color Scheme: Consistent aesthetics across applications.
  - Systemd-Boot Configurations: Streamlined bootloader setup with GRUB as a backup.
  - Arch Linux Setup: Fine-tuned for performance and minimalism.

⚡ Easy Installation with setup_dotfiles

To automate the setup process, I use a dedicated script available at setup_dotfiles. This script:

  - Automatically creates required directories.
  - Uses GNU Stow to manage symlinks for clean and modular dotfile management.

⬇️ Installation Steps

  - Clone the setup_dotfiles repository in home directory and hop into the setup_dotfiles folder:

        cd ~
        git clone https://github.com/SajanGhuman/setup_dotfiles.git
        cd setup_dotfiles
        
  - Make it executable:
  
        chmod +x setup_dotfiles.sh
  
   - Run the script:

         ./setup_dotfiles.sh

  The script will automatically handle directory creation and symlinking using Stow.

🎨 Aesthetic Customizations

Enjoy a cohesive and visually pleasing environment with Gruvbox Material themes integrated across:

  - 🐱 Kitty
  - ✏️ Neovim
  - 🪟 i3 Status Bar

⬇️ Uninstallation Steps

  - Hop into the setup_dotfiles folder:

        cd ~
        cd setup_dotfiles
        
  - Make the uninstall script executable:
  
        chmod +x uninstall.sh
  
   - Run the script to uninstall everything:

         ./uninstall.sh

