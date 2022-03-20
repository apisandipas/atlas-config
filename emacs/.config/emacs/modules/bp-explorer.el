;;; bp-explorer.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;; Commentary

;; Explorer text configuration.

;;; Code:

(use-package treemacs
  :defer t
  :init
  (setq treemacs-follow-after-init t
        treemacs-is-never-other-window t
        treemacs-sorting 'alphabetic-case-insensitive-asc)
        ;;treemacs-persist-file (concat doom-cache-dir "treemacs-persist")
       ;; treemacs-last-error-persist-file (concat doom-cache-dir "treemacs-last-error-persist"))
  :config
  (setq treemacs-width 25)
  ;; Don't follow the cursor
  (treemacs-follow-mode -1))


(use-package treemacs-evil
  :defer t
  :after (treemacs)
  :bind (:map evil-treemacs-state-map
    ([return] . treemacs-RET-action)
   ([tab] . treemacs-TAB-action)
    ("TAB" . treemacs-TAB-action)
    ("o v" . treemacs-visit-node-horizontal-split)
    ("o s" . treemacs-visit-node-vertical-split)))

(provide 'bp-explorer)
;;; bp-explorer.el ends here
