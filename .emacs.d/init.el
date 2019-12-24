;;; this loads the package manager
(require 'package)

;;; here there's a variable named package-archives, and we are adding the MELPA repository to it
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; loads packages and activates them
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("86704574d397606ee1433af037c46611fb0a2787e8b6fd1d6c96361575be72d2" default)))
 '(package-selected-packages (quote (xterm-color git xresources-theme evil)))
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode t)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(87 . 87))

;; Relative line numbers
(display-line-numbers-mode)
(setq-default display-line-numbers 'relative)

(load-theme 'xresources t)

(require 'git)

(add-hook 'shell-mode-hook
      (lambda ()
        (display-line-numbers-mode)))

(require 'xterm-color)

;; Packages to install: git, xterm-color, evil
