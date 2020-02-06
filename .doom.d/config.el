;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; These are used for a number of things, particularly for GPG configuration,
;; some email clients, file templates and snippets.
(setq user-full-name ""
      user-mail-address "")

; Set font
(setq doom-font (font-spec :family "Source Code Pro" :size 10.5))

; Use doom-one theme
(setq doom-theme 'doom-one)

;; If you intend to use org, it is recommended you change this!
(setq org-directory "~/org/")


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', where Emacs
;;   looks when you load packages with `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.


; Disable other bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Opacity
(set-frame-parameter (selected-frame) 'alpha '(87 . 87))

;; Relative line numbers
(display-line-numbers-mode)
(setq-default display-line-numbers-type 'relative)

;; Show column number
(column-number-mode 1)


;; Disable line numbers on shell. This prevents issues with the prompt wrapping to a new line
(add-hook 'term-mode-hook
      (lambda ()
        (setq-local display-line-numbers nil)))


;; 80-column indicator. FCI causes laggy scrolling
(setq-default
 whitespace-line-column 81
 whitespace-style       '(face lines-tail))

(add-hook 'prog-mode-hook #'whitespace-mode)

(defun my-latex()
  "Latex mode customizations"
  (auto-fill-mode t)
  (reftex-mode t)
  (TeX-engine-set "luatex")
  (setq TeX-PDF-mode t)
  (add-to-list 'TeX-view-program-list '("Zathura" "zathura %o"))
  (setq TeX-view-program-selection '((output-pdf "Zathura")))
  )
(add-hook 'LaTeX-mode-hook 'my-latex)

(defun compile-latex()
  (setq TeX-command-force "LaTeX")
  (TeX-command-master)
)

(add-hook 'after-save-hook 'compile-latex)


; Multi-term
(map! :leader "zt" 'multi-term)
(map! :leader "zn" 'multi-term-next)
(map! :leader "zp" 'multi-term-prev)
