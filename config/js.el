(use-package json-mode
  :ensure t
  :mode("\\.json\\'" . json-mode))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.js\\'" . rjsx-mode)
  :config
  (setq-default js2-global-externs '("require" "module"))
  (setq-default js2-basic-offset 2))

(use-package js2-refactor
  :ensure t
  :after rjsx-mode
  :config
  (bind-keys
   :map rjsx-mode-map
   :prefix "M-<SPC>"
   :prefix-map rlf/p/js2r
   ("rv" . js2r-rename-var)
   ("ee" . js2r-expand-node-at-point)
   ("cc" . js2r-contract-node-at-point)
   ("ef" . js2r-extract-function)
   ("em" . js2r-extract-method)
   ("tf" . js2r-toggle-function-expression-and-declaration)
   ("ta" . js2r-toggle-arrow-function-and-expression)
   ("ts" . js2r-toggle-function-async)
   ("ip" . js2r-introduce-parameter)
   ("lp" . js2r-localize-parameter)
   ("wi" . js2r-wrap-buffer-in-iife)
   ("ig" . js2r-inject-global-in-iife)
   ("ag" . js2r-add-to-globals-annotation)
   ("ev" . js2r-extract-var)
   ("el" . js2r-extract-let)
   ("ec" . js2r-extract-const)
   ("iv" . js2r-inline-var)
   ("rv" . js2r-rename-var)
   ("vt" . js2r-var-to-this)
   ("ao" . js2r-arguments-to-object)
   ("3i" . js2r-ternary-to-if)
   ("sv" . js2r-split-var-declaration)
   ("ss" . js2r-split-string)
   ("st" . js2r-string-to-template)
   ("uw" . js2r-unwrap)
   ("lt" . js2r-log-this)
   ("dt" . js2r-debug-this)
   ("sl" . js2r-forward-slurp)
   ("ba" . js2r-forward-barf)
   ("k"  . js2r-kill)))

(use-package npm-mode
  :load-path (lambda () (path-join rlf-modules "npm-mode"))
  :config
  (npm-global-mode))
