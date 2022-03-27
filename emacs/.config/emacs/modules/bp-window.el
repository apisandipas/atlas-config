;;; bp-window.el -*- lexical-binding: t; -*-

;; Copyright (C) 2022
;; SPDX-License-Identifier: MIT

;; Author: System Crafters Community

;;; Commentary:

;; Windows / Buffer mgmt configuration.

;;; Code:

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun bp/window-maximize-horizontally ()
  "Delete all windows to the left and right of the current window."
  (interactive)
  (require 'windmove)
  (save-excursion
    (while (ignore-errors (windmove-left)) (delete-window))
    (while (ignore-errors (windmove-right)) (delete-window))))

(defun bp/window-maximize-vertically ()
  "Delete all windows above and below the current window."
  (interactive)
  (require 'windmove)
  (save-excursion
    (while (ignore-errors (windmove-up)) (delete-window))
    (while (ignore-errors (windmove-down)) (delete-window))))

(bp/leader-keys
  ;; Window Bindings
  "w" '(:ignore t :which-key "windows")
  "wh" '(windmove-left :which-key "evil-move-left")
  "wl" '(windmove-right :which-key "evil-move-right")
  "wj" '(windmove-down :which-key "evil-move-down")
  "wk" '(windmove-left :which-key "evil-move-up")

  "wH" '(evil-window-move-far-left :which-key "move-window-left")
  "wL" '(evil-window-move-far-right :which-key "move-window-right")
  "wJ" '(evil-window-move-very-bottom :which-key "move-window-down")
  "wK" '(evil-window-move-very-top :which-key "move-window-up")

  ;;Window resizing
  "wo" '(evil-window-increase-width :which-key "expand-window")
  "wo" '(evil-window-increase-width :which-key "expand-window")
  "wc" '(evil-window-delete :which-key "close-window")
  "wd" '(evil-window-delete :which-key "delete-window")

  ;; window splitting
  "ws" '(evil-window-split :which-key "split-window-horizonal")
  "wv" '(evil-window-vsplit :which-key "split-window-vertical")

  ;; window change redo/undo
  "wu" '(winner-undo :which-key "undo last window change")
  "wU" '(winner-redo :which-key "redo last window change")

  "w+" '(evil-window-increase-height :which-key "window-increase-height")
  "w-" '(evil-window-decrease-height :which-key "window-decrease-height")
  "w=" '(balance-windows :which-key "balance-windows")
  "w<" '(evil-window-decrease-width :which-key "window-decrease-width")
  "w>" '(evil-window-increase-width :which-key "window-increase-width")

  "wm" '(:ignore t :which-key "maximize")
  "wmm" '(delete-other-windows :which-key "delete-other-windows")
  "wmv" '(bp/window-maximize-vertically :which-key "maximize-window-vertically")
  "wmh" '(bp/window-maximize-horizontally :which-key "maximize-window-horizonatally")

  ;; Buffer Bindings
  "b" '(:ignore t :which-key "buffers")
  "bk" '(kill-this-buffer :which-key "kill-buffer")
  "bd" '(kill-this-buffer :which-key "delete-buffer")
  "bs" '(save-buffer :which-key "save-buffer")
  "be" '(eval-buffer :which-key "eval-buffer")
  "bw" '(ivy-switch-buffer-other-window :which-key "switch-buffer")
  "bc" '(clone-indirect-buffer-other-window :which-key "cloneivy-switch-buffer-other-window-buffer"))


(provide 'bp-window)
;;; bp-window.el ends here
