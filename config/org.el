(use-package org
  :config
  (setq org-log-done t)
  (setq org-agenda-files '("~/.emacs.d/docs"))
  (set-face-foreground 'org-level-1 "DeepSkyBlue")

  (bind-keys
   :prefix-map rlf/p/org
   :prefix "C-x C-o"
   ("C-o" . org-agenda)
   ("C-c" . org-capture)
   ("C-l" . org-store-link)
   ("C-b" . org-switchb)))
