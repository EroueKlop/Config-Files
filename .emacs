;; For the (package) library to manage packages
(require 'package)
(setq package-enable-at-startup nil)


;; Milkypostman’s Emacs Lisp Package Archive (MELPA) has more packages than ELPA
(add-to-list 'package-archives
              '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Checks if (use-package) is installed if not it will be installed 
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Theme
(load-file "~/.emacs.d/masked-theme.el")
(load-theme 'masked t)

;; Font
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-12"))

;; Dashboard - Startup Screen
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/avatar.png")
  (setq dashboard-banner-logo-title "Its over, buddy boyo !"))

;; Modeline theme
(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))


(setq use-dialog-box nil)
(setq use-file-dialog nil)

;; Disable backups and auto-saves
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)

;; Disable menus and scrollbars 
(menu-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode -1)
(scroll-bar-mode -1)

;; Change yes-or-no questions into y-or-n questions
(defalias 'yes-or-no-p 'y-or-n-p)
