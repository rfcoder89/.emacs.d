(setq-default
 indent-tabs-mode nil
 tab-width 2
 truncate-lines t)

(setq
 auto-save-default nil
 backup-inhibited t
 auto-save-list-file-prefix nil
 ns-pop-up-frames nil
 ring-bell-function 'ignore
 indent-line-function 'insert-tab
 inhibit-splash-screen t
 initial-scratch-message nil
 indent-tab-mode t
 global-visual-line-mode t)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1)) 
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)
(recentf-mode)
(global-auto-revert-mode)
(disable-mouse-mode 1)

(ido-mode 1)
(blink-cursor-mode -1)
(show-paren-mode t)
(electric-indent-mode)
(global-linum-mode t)
(toggle-truncate-lines)
(toggle-frame-fullscreen)

(global-set-key (kbd "<f8>") 'redraw-display)

(use-package dakrone-theme
  :ensure t
  :config
  (load-theme 'dakrone t))

(set-face-background 'cursor "DeepSkyBlue")

(diminish 'eldoc-mode)
