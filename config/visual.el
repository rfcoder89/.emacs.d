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

(display-time-mode)

(use-package dakrone-theme
  :ensure t
  :config
  (load-theme 'dakrone t))

(use-package telephone-line
  :ensure t
  :config
  (setq telephone-line-lhs
        '((evil   . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-erc-modified-channels-segment
                     telephone-line-process-segment))
          (nil    . (telephone-line-minor-mode-segment
                     telephone-line-buffer-segment))))

  (setq telephone-line-rhs
        '((nil    . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil   . (telephone-line-airline-position-segment))))
  (telephone-line-mode 1))

(diminish 'eldoc-mode)

(set-face-background 'cursor "DeepSkyBlue")
(set-default-font "Consolas-10")
