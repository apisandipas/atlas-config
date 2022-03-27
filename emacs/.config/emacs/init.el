;;; init.el --- the entry point
;;; -*- lexical-binding: t; -*-

;;; Commentary:

;; You know the drill by now

;;; Code:

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "Emacs loaded in %s."
                     (emacs-init-time))))

;; Don't pollute working directories
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (,tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

;; Set default coding system
(set-default-coding-systems 'utf-8)

(customize-set-variable 'visible-bell 1)  ; turn off beeps, make them flash!

(customize-set-variable 'large-file-warning-threshold 100000000) ;; change to ~100 MB

;; Add the modules folder to the load path
(add-to-list 'load-path (expand-file-name "modules/" user-emacs-directory))

;; Make GC pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(customize-set-variable 'custom-file
                        (expand-file-name "custom.el" user-emacs-directory))

;----------------------------
;; Package System Setup
(require 'bp-use-package)

;; Load All Guix-sources packages
(when (string= (system-name) "atlas")
  (guix-emacs-autoload-packages))

;;---------------------------
;; Emacs Defaults
(require 'bp-defaults)

;;---------------------------
;; UI Customizations

(require 'bp-ui)

;;-----------------------------
;; Evil `vi` emulation

(require 'bp-evil)

;;-----------------------------
;; Completion
(require 'bp-completion)

;;-----------------------------
;; Editing
(require 'bp-editing)

;;-----------------------------
;; Window / Buffer Settings
(require 'bp-window)

;;-----------------------------
;; Org Mode
(require 'bp-org)

;;-----------------------------
;; Log Mode (disabled by default)
(require 'command-log-mode)

(provide 'init)
;;; init.el ends here
