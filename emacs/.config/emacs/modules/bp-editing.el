;;; bp-editing.el --- Settings for editing code, etc
;;; -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: Bryan Paronto

;;; Commentary

;; Editing text configuration.

;;; Code:

;; (define-key evil-normal-state-map (kbd "s") 'basic-save-buffer)

;; Standard indentation behaviors
(setq standard-indent 2)

(defun bp/shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun bp/shift-right ()
  (interactive)
  (bp/shift-region 1))

(defun bp/shift-left ()
  (interactive)
  (bp/shift-region -1))


(define-key evil-visual-state-map (kbd ">") 'bp/shift-right)
(define-key evil-visual-state-map (kbd "<") 'bp/shift-left)
(define-key evil-visual-state-map [tab] 'bp/shift-right)
(define-key evil-visual-state-map [S-tab] 'bp/shift-left)

(use-package format-all
  :hook (prog-mode . format-all-mode))

(use-package ws-butler
  :diminish
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


