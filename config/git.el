(use-package magit 
  :ensure t
  :bind
  ("C-0" . magit-status)
  
  :config
  (setq magit-repository-directories
        '(("~/development" . 2)
          ("~/.emacs.d" . 1))))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-dired-mode))

