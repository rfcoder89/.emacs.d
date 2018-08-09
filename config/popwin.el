(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)

  (push "*eshell*" popwin:special-display-config)
  (push '("\*Skeletor.*\*$" :regexp t :noselect t) popwin:special-display-config)
  (push '("*Warnings*" :height 5 :position top) popwin:special-display-config)
  (push '("*mocha tests*" :height 50 :position bottom) popwin:special-display-config)
  (push '("*compilation*" :height 50 :position bottom) popwin:special-display-config)
  (push '("*Messages*" :height 50 :position bottom :noselect t) popwin:special-display-config))
