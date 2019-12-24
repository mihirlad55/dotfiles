;;; this loads the package manager
(require 'package)

;; Add melpa to package-archives
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
 '(package-selected-packages
   (quote
    (base16-theme xterm-color git xresources-theme evil)))
 '(recentf-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'git)
(require 'xterm-color)
(require 'evil)
(require 'whitespace)

;; Enable evil mode
(evil-mode t)

; Disable other bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(87 . 87))

;; Relative line numbers
(display-line-numbers-mode)
(setq-default display-line-numbers 'relative)

;; Show column number
(column-number-mode 1)


;; Disable line numbers on shell. This prevents issues with the prompt wrapping to a new line
(add-hook 'shell-mode-hook
      (lambda ()
        (setq-local display-line-numbers nil)))


;; Set the cursor color based on the evil state
;; Without this, there are face-errors with evil mode
(defvar my/base16-colors base16-default-dark-colors)
(setq evil-emacs-state-cursor   `(,(plist-get my/base16-colors :base0D) box)
      evil-insert-state-cursor  `(,(plist-get my/base16-colors :base0D) bar)
      evil-motion-state-cursor  `(,(plist-get my/base16-colors :base0E) box)
      evil-normal-state-cursor  `(,(plist-get my/base16-colors :base0B) box)
      evil-replace-state-cursor `(,(plist-get my/base16-colors :base08) bar)
      evil-visual-state-cursor  `(,(plist-get my/base16-colors :base09) box))

;; Load base16-flat (This should be after all base16 functions)
(load-theme 'base16-flat t)

(setq whitespace-style '(face empty tabs lines-tail trailing))
(global-whitespace-mode t)
