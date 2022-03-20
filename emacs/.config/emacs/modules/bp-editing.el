;;; bp-editing.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;; Commentary

;; Editing text configuration.

;;; Code:

(use-package ws-butler
  :hook ((text-mode . ws-butler-mode)
         (prod-mode . ws-butler-mode)))

(use-package evil-nerd-commenter
  ;; Set a global binding for better line commenting/uncommenting
  :config
  (bp/leader-keys
    "tj" '(evilnc-comment-or-uncomment-lines :which-key "toggle comments"))) 

;; Set up ws-butler for trimming whitespace and line endings
(add-hook 'text-mode-hook 'ws-butler-mode)
(add-hook 'prog-mode-hook 'ws-butler-mode)


;; parentheses
(electric-pair-mode 1) ; auto-insert matching bracket
(show-paren-mode 1)    ; turn on paren match highlighting

(provide 'bp-editing)
;;; bp-editing.el ends here
