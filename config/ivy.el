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
  :config
  (setcdr (assoc 'counsel-M-x ivy-initial-inputs-alist) ""))

(use-package counsel-projectile
  :ensure t
  :after counsel)

(use-package counsel-tramp
  :ensure t
  :after counsel)
