(use-package magit
  :ensure t
  :bind
  (("C-0" . magit-status)
   ("C-M-0" . magit-list-repositories))

  :init
  (setq magit-repository-directories '(("~/development" . 2) ("~/.emacs.d" . 1)))
  
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-dired-mode))

(use-package gitignore-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.gitignore\\'" . gitignore-mode)))
  
