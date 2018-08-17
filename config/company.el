(use-package company
  :ensure t
  :diminish 'company-mode
  :config
  (global-company-mode)
  (setq company-idle-delay 0.5)
  (setq company-minimum-prefix-length 1))



