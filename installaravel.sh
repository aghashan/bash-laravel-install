#!/bin/bash

while true; do
    clear
    echo "==============================="
    echo "           Main Menu           "
    echo "==============================="
    echo "1. Laravel"
    echo "2. Laravel With Livewiew"
    echo "3. Laravel Breeze Blade"
    echo "5. Qiut"

    read -p "Masukkan pilihan Anda [1-4]: " choice

    case $choice in
        1)
            read -p "Masukan Nama Web : " webname
            composer create-project laravel/laravel $webname
            ;;
        2)
            read -p "Masukan Nama Web : " webname
            composer create-project laravel/laravel $webname
            cd $webname
            composer require livewire/livewire
            php artisan livewire:publish --config
            ;;
        3)
            read -p "Masukan Nama Web : " webname
            composer create-project laravel/laravel $webname
            cd $webname
            composer require laravel/breeze --dev
            php artisan breeze:install blade 
            php artisan migrate
            wait 
            secret="php artisan serve; exec bash"
            terminal_emulators=("gnome-terminal" "konsole" "xterm" "mate-terminal" "xfce4-terminal" "terminator")
            for terminal in "${terminal_emulators[@]}"; do
                if command -v "$terminal" &> /dev/null; then
                    "$terminal" -- bash -c "$secret"
                fi
            done
            echo "Run 'php artisan serve' manually."
            cd $webname
            npm install
            npm run dev
            ;;
        4)
            read -p "Masukan Nama Web : " webname
            composer create-project laravel/laravel $webname
            cd $webname
            composer require laravel/breeze --dev
            php artisan breeze:install livewire 
            php artisan migrate
            wait 
            secret="php artisan serve; exec bash"
            terminal_emulators=("gnome-terminal" "konsole" "xterm" "mate-terminal" "xfce4-terminal" "terminator")
            for terminal in "${terminal_emulators[@]}"; do
                if command -v "$terminal" &> /dev/null; then
                    "$terminal" -- bash -c "$secret"
                fi
            done
            echo "Run 'php artisan serve' manually."
            cd $webname
            npm install
            npm run dev
            ;;
        5)
            echo "Quit...."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter a number between 1 and 4."
            read -p "Press enter to continue..."
            ;;
    esac
done
