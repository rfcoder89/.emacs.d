(use-package projectile
  :ensure t
  :config
  (setq projectile-indexing-method 'native)
  (setq projectile-enable-caching t)
  (projectile-global-mode)
  
  (bind-keys
   :prefix-map rlf/p/projectile
   :prefix "C-x C-p"
   ("C-p" . counsel-projectile-switch-project)
   ("C-f" . counsel-projectile)
   ("C-d" . counsel-dired-jump)   
   ("C-g" . counsel-projectile-grep)
   ("C-i" . projectile-ibuffer)
   ("C-G" . projectile-grep)
   ("C-o" . projectile-multi-occur)))
