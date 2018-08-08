(use-package popwin
  :ensure t
  :config
  (popwin-mode 1)

  (push "*eshell*" popwin:special-display-config)
  (push '("\*Skeletor.*\*$" :regexp t :noselect t) popwin:special-display-config)
  (push '("*Warnings*" :height 5 :position top) popwin:special-display-config)
  (push '("*mocha tests*" :height 100 :position bottom) popwin:special-display-config)  
  (push '("*Messages*" :width 100 :position right :noselect t) popwin:special-display-config))
