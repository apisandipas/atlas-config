;;; bp-evil.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: Bryan Paronto 

;; Commentary

;; Evil mode configuration, for those who prefer `vi' keybindings.
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


(defun bp/edit-config-file ()
    "Function to open the config file"
    (interactive)
    (message "'Edit Config' not yet implemented"))


(use-package general
  :after evil
  :config
  (general-create-definer bp/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (bp/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "te" '(treemacs :which-key "toggle file explorer")
    "tt" '(counsel-load-theme :which-key "choose theme")
    "f"  '(:ignore t :which-key "files")
    "fc" '(bp/edit-config-file :which-key "edit config")))



;;; Code:
(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode))

(use-package evil
  :init
  (customize-set-variable 'evil-want-integration t)
  (customize-set-variable 'evil-want-keybinding nil)
  (customize-set-variable 'evil-want-C-u-scroll t)
  (customize-set-variable 'evil-want-C-i-jump nil)
  (customize-set-variable 'evil-respect-visual-line-mode t)
  (customize-set-variable 'evil-undo-system 'undo-tree)
  :config
  (require 'evil-collection)
  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-collection-init)
  (evil-mode 1))
  ;; Make sure some mode start in Evil state
  (dolist (mode '(custom-mode
                    eshell-mode
                    term-mode))
  (add-to-list 'evil-emacs-state-modes mode))


(provide 'bp-evil)
;;; bp-evil.el ends here
