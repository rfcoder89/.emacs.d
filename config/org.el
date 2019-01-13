(use-package org
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-log-done t)
  (setq org-agenda-files '("~/development"))
  (setq org-default-notes-file (concat org-directory "~/notes.org"))
  (set-face-foreground 'org-level-1 "DeepSkyBlue")

  (bind-keys
   :prefix-map rlf/p/org
   :prefix "C-9"
   ("C-9" . org-agenda)
   ("C-<SPC>" . org-capture)
   ("C-l" . org-store-link)
   ("C-M-l" . org-insert-link)
   ("C-b" . org-switchb)))
