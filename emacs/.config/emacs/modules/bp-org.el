;;; bp-org.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: Bryan Paronto

;; Commentary

;; Org Mode settings & customizations

;;; Code:

;;; Customize org-mode font setup
(defun bp/org-font-setup ()
  (setq org-hide-emphasis-markers t)
  (visual-line-mode)
  (org-indent-mode)
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.4 ))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.3 ))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.2 ))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.1 ))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0 ))))
   ))

(add-hook 'org-mode-hook #'bp/org-font-setup)

;;;;; Ligatures & Pretty Symbols
(defun bp/org-prettify-symbols ()
  "Beautify Org Checkbox Symbol"
  (setq prettify-symbols-alist
        (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
                '(
                  ("#+begin_src" . ?)
                  ("#+end_src" . ?)
                  ("#+begin_example" . ?)
                  ("#+end_example" . ?)
                  (":END:" . ?)
                  ("#+header:" . ?)
                  ("#+name:" . ?﮸)
                  ("#+results:" . ?)
                  ("#+call:" . ?)
                  (":properties:" . ?)
                  (":logbook:" . ?))))
  (prettify-symbols-mode))

(add-hook 'org-mode-hook #'bp/org-prettify-symbols)

(use-package visual-fill-column
  :hook ((org-mode text-mode) . visual-fill-column-mode)
  :config
  (setq-default visual-fill-column-center-text t
                visual-fill-column-width 120))

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

(provide 'bp-org)
;;; bp-org.el ends here
