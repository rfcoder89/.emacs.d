(use-package smex
  :ensure t)

(use-package ivy
  :ensure t
  :after smex
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d) "))

(use-package counsel
  :ensure t
  :after ivy
  :bind
  (("M-x" . counsel-M-x)
   ("C-x b" . ivy-switch-buffer)
   ("C-x C-b" . counsel-bookmark)
   ("C-x C-f" . counsel-find-file))
  
  :config
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) ""))

(use-package counsel-projectile
  :ensure t
  :after counsel)

(use-package counsel-tramp
  :ensure t
  :after counsel)
