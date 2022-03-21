;; bp-use-package.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: Bryan Paronto

;; Commentary

;; Built-in `package.el' with `use-package' configuration, including
;; elpas to search.

;;; Code:


;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(when (string= (system-name) "atlas")
  ;; We wanna use the Guix-sourced packages on Atlas
  (setq use-package-always-ensure nil)
  ;; Everywhere else, let the magic happen.
  (setq use-package-always-ensure t))

;;----------------------------------

(provide 'bp-use-package)
;;; bp -use-package.el ends here
