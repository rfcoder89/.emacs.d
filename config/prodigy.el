(setq lfm/netview-dir "c:/Users/Richard.Flood/Cmder/home/development/lfm/lfm-netview")
(setq lfm/netview-modules-bin-dir (format "%s/node_modules/.bin" lfm/netview-dir))

(use-package prodigy
  :ensure t
  :config
  (prodigy-define-service
   :name "LFM NetView - Cloud Build"
   :command "npm"
   :args '("run" "cloud:debug" "--" "--watch")
   :cwd lfm/netview-dir
   :tags '(lfm)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  
(prodigy-define-service
   :name "LFM NetView - Lint"
   :command "esw"
   :path lfm/netview-modules-bin-dir
   :args '("--config" ".eslintrc.json" "--color" "src" "test" "--watch")
   :cwd lfm/netview-dir
   :tags '(lfm)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)

(prodigy-define-service
   :name "LFM NetView - Test"
   :command "mocha"
   :path lfm/netview-modules-bin-dir
   :args '("-c" "--recursive" "--require" "@babel/register" "--require" "scripts/babel-conversion" "test/**/*.mocha.js" "--watch")
   :cwd lfm/netview-dir
   :tags '(lfm)
   :stop-signal 'sigkill
   :kill-process-buffer-on-stop t)
  
  :bind
  ("C-8" . prodigy)
  (:map prodigy-mode-map
        ("d" . prodigy-display-process)))
