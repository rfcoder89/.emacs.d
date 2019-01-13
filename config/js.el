(use-package pug-mode
  :ensure t
  :mode("\\.pug\\'" . pug-mode))

(use-package json-mode
  :ensure t)
  ;; :mode("\\.json\\'" . json-mode))

(use-package rjsx-mode
  :ensure t
  :mode ("\\.js\\'" "\\.js.flow\\'")
  :config
  (setq-default js2-global-externs '("require" "module"))
  (setq-default js2-basic-offset 2)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  :bind (:map rjsx-mode-map
              ("M-o" . rlf/open-test-file)))

(defun my/use-eslint-from-node-modules ()
  (let*
      ((root (locate-dominating-file
              (or (buffer-file-name) default-directory)
              "node_modules"))
       (eslint (and root (expand-file-name "node_modules/.bin/eslint.cmd" root))))
    (when (and eslint (file-exists-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun my/use-flow-from-node-modules ()
  (let*
      ((root (locate-dominating-file
              (or (buffer-file-name) default-directory)
              "node_modules"))
       (flow (and root (expand-file-name "node_modules/.bin/flow.cmd" root))))
    (when (and flow (file-exists-p flow))
      (setq-local flycheck-javascript-flow-executable flow))))

(use-package flycheck-flow
  :ensure t)

(use-package flycheck
  :after rjsx-mode flycheck-flow
  :ensure t
  :config
  (setq-default flycheck-temp-prefix ".flycheck")
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint)))
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
  (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
  (flycheck-add-mode 'javascript-eslint 'rjsx-mocha-mode)
  (flycheck-add-mode 'javascript-flow 'rjsx-flow-mode)

  ;; (flycheck-add-next-checker 'javascript-eslint 'javascript-flow)

  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  (add-hook 'flycheck-mode-hook #'my/use-flow-from-node-modules)
  (global-flycheck-mode))

;; (use-package flow-minor-mode
;;   :after rjsx-mode
;;   :ensure t
;;   :config
;;   (add-hook 'js2-mode-hook 'flow-minor-enable-automatically))

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
  :diminish 'npm-mode
  :config
  (npm-global-mode))

(use-package mocha
  :ensure t
  :after rjsx-mode
  :config
  (bind-keys
   :map rjsx-mode-map
   :prefix "C-c t"
   :prefix-map rlf/p/mocha
   ("t" . mocha-test-project)
   ("f" . mocha-test-file)
   ("p" . mocha-test-at-point)
   ("<SPC>" . (lambda () (interactive) (popwin:popup-buffer "*mocha tests*")))
   ("C-<SPC>" . (lambda () (interactive) (popwin:popup-buffer "*compilation*")))))

(use-package coverlay
  :load-path (lambda () (path-join rlf-modules "coverlay"))
  :diminish 'coverlay-minor-mode
  :config
  (global-coverlay-mode))

;; (use-package eslint-fix
;;   :after rjsx-mode
;;   :ensure t
;;   :config
;;   (bind-keys
;;    :map rjsx-mode-map
;;    ("C-c f" . eslint-fix)))

(use-package indium :ensure t)

(setq rjsx-mocha-mode-highlights
      '(("describe\\|it\\|before\\|beforeEach" . font-lock-function-name-face)))

(define-derived-mode rjsx-flow-mode rjsx-mode "JS Flow"
  "Major mode based on rjsx-mode for editing flow files.")

(define-derived-mode rjsx-mocha-mode rjsx-mode "JSMocha"
  "Major mode based on rjsx-mode for editing mocha test files."
  (setq font-lock-defaults '(rjsx-mocha-mode-highlights)))

(define-derived-mode webpack-mode rjsx-mode "Webpack"
  "Major mode based on rjsx-mode for editing webpack files.")

(add-to-list 'auto-mode-alist '("\\.mocha.js\\'" . rjsx-mocha-mode))
(add-to-list 'auto-mode-alist '("\\webpack.config.js\\'" . webpack-mode))

(defun rlf/open-test-file ()
  (interactive)
  (let ((testsDir) (testFile) (srcFile))
    (setq testsDir (format "%stests" default-directory))
    (unless (file-directory-p testsDir)
      (progn
        (make-directory testsDir)
        (message "created directory %s" testsDir)))
    (setq testFile
          (format
           "%s/%s.mocha.js"
           testsDir
           (file-name-sans-extension (file-name-nondirectory buffer-file-name))))
    (unless (file-exists-p testFile)
      (with-temp-buffer (write-file testFile)))
    (find-file testFile)))
