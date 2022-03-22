;;; bp-ui.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: Bryan Paronto

;; Commentary

;; User interface customizations..

;;; Code:


(use-package all-the-icons)
(use-package doom-themes
  :config
  (load-theme 'doom-one t))

;;; Fonts
(add-to-list 'default-frame-alist '(font . "Victor Mono" ))
(set-face-attribute 'default nil :font "Victor Mono" :height 130)
(set-face-attribute 'fixed-pitch nil :font "Victor Mono" :height 130)
(set-face-attribute 'variable-pitch nil :font "DejaVu Sans" :height 130 :weight 'regular)

;; Open frame in maximized mode.
(set-frame-parameter (selected-frame) 'fullscreen 'maximized)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter (selected-frame)'alpha '(85 . 80))
(set-frame-parameter (selected-frame)'internal-border-width 24)


;;;; Modeline
(use-package doom-modeline
  :init
  ;; Start up the modeline after initialization is finished
  (add-hook 'after-init-hook 'doom-modeline-init)
  (customize-set-variable 'doom-modeline-height 32)
  (customize-set-variable 'doom-modeline-bar-width 6)
  (customize-set-variable 'doom-modeline-minor-modes nil)
  (customize-set-variable 'doom-modeline-buffer-file-name-style 'truncate-except-project)
  ;; (custom-set-faces
  ;;  '(font-lock-comment-face :slant italic)
  ;;  '(font-lock-keyword-face :slant italic))
  (customize-set-variable 'doom-modeline-buffer-file-name-style 'truncate-except-project)
  :hook (after-init . doom-modeline-mode))

;;;; Help Buffers

;; Make `describe-*' screens more helpful
(use-package helpful
  :config
  (define-key helpful-mode-map [remap revert-buffer] #'helpful-update)
  (global-set-key [remap describe-command] #'helpful-command)
  (global-set-key [remap describe-function] #'helpful-callable)
  (global-set-key [remap describe-key] #'helpful-key)
  (global-set-key [remap describe-symbol] #'helpful-symbol)
  (global-set-key [remap describe-variable] #'helpful-variable)
  (global-set-key (kbd "C-h F") #'helpful-function))


;; Bind extra `describe-*' commands
(global-set-key (kbd "C-h K") #'describe-keymap)

;; also add some examples
(use-package elisp-demos
  :config
  (advice-add 'helpful-update :after #'elisp-demos-advice-helpful-update))

;;;; TODO Line Numbers


(setq fill-column 120)
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;;; Help Me Obi-wan Which-Key. You're my only hope.
(use-package which-key
  :defer 0
  :diminish which-key-mode
  :init
  (setq which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-idle-delay 0.3)
  :config
  (put 'which-key-replacement-alist 'initial-value which-key-replacement-alist)
  ;;(add-hook! 'doom-before-reload-hook
  ;;(defun doom-reset-which-key-replacements-h ()
  ;;(setq which-key-replacement-alist (get 'which-key-replacement-alist 'initial-value))))

  ;; general improvements to which-key readability
  (which-key-setup-side-window-bottom)
  ;;(setq-hook! 'which-key-init-buffer-hook line-spacing 3)

  (which-key-add-key-based-replacements (kbd "SPC") "<leader>")
  (which-key-add-key-based-replacements (kbd "SPC-;") "<localleader>")

  (which-key-mode))

(provide 'bp-ui)
;;; bp-ui.el ends here
