;; Package list:
;; community/emacs-w3m-cvs, aspell, aspell-ru, aspell-en, lush
;; Elpa list:
;; crontab-mode-1.2 dired+-21.2 haskell-mode-2.8.0 paredit-22
;; windresize-0.1 smex-1.1.2 sunrise-commander-6.441
;; Lisp List:
;; auto-complete-1.3.1 color-theme.el linum-relative.el nyan-mode.el
;; slime workspaces.el zenburn.el

;;
;;
;; Common
;;
;;

(require 'package)
;; Add the original Emacs Lisp Package Archive
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
			 ("gnu"  . "http://elpa.gnu.org/packages/")
			 ("SC"   . "http://joseito.republika.pl/sunrise-commander/")))
;; Add the user-contributed repository
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;; Load-path for lisp files
(let ((default-directory "~/.emacs.d/lisp/"))
  (setq load-path
	(append
	 (let ((load-path (copy-sequence load-path))) ;; Shadow
	   (append
	    (copy-sequence (normal-top-level-add-to-load-path '(".")))
	    (normal-top-level-add-subdirs-to-load-path)))
	 load-path)))

;;
;;
;; Key bindings
;;
;;

(global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-x C-m") 'smex)
(global-set-key (kbd "C-c C-m") 'smex)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "<f9>") 'flyspell-mode)
(global-set-key [?\C-q] 'workspace-goto)
(global-set-key (kbd "<f8>")
		(lambda ()
		  (interactive)
		  (kill-buffer "*Completions*")
		  ;;FIXME! Need kill all buffers at down
		  ;;(kill-buffer "*Help*")
		  ;;(kill-buffer "*Disassemble*")
		  ))
(global-set-key (kbd "C-x C-/") "…")
(global-set-key (kbd "C-x C-.") "…")
(global-set-key (kbd "C-S-u") 'ucs-insert)

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-c")
			   'eval-defun)))
(add-hook 'c-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c C-c")
			   'comment-or-uncomment-region)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x C-a")
			   'org-agenda)))
(add-hook 'org-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-x C-l")
			   'org-timeline)))
(global-set-key (kbd "C-c C--") "—")

;;
;;
;; Appearance
;;
;;

;; Disable startup-message (show *scratch* buffer)
(setq inhibit-startup-message t)
;; Set *scratch* buffer text
(setq initial-scratch-message
      ";; This buffer is for notes you don't want to save.\n\n")
;; Set *scratch* buffer mode
(setq initial-major-mode 'text-mode)
;; Disable all bar
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;; Set font
(set-default-font "Ubuntu Mono-13")
(setq default-frame-alist '((font . "Ubuntu Mono-13")))
;; Files for zenburn-theme : ~/.emacs.d/lisp/zenburn.el and
;; ~/.emacs.d/lisp/color-theme.el
(require 'zenburn)
(zenburn)
;; Show time
;;(setq display-time-interval 1) ;; in seconds, default value 60
(setq display-time-format "%H:%M")
(display-time-mode)
;; Show column (line,column)
(column-number-mode)
;; Nyan-mode
;; files: ~/.emacs.d/lisp/nyan-mode.el, ~/.emacs.d/lisp/nyan-img/*
(require 'nyan-mode)
(nyan-mode)
;; Indent style
(setq c-default-style "linux"
      c-basic-offset 4)
(global-hl-line-mode 1)
;; highlight just parens
(show-paren-mode)
(setq show-paren-style 'parenthesis)
;; Set table-cell color (WHATTHEFUCK? NEED FIX)
;;(set-face-background 'table-cell "#3f3f3f")
;;(set-face- 'table-cell "#dcdccc")
;; Set fill column
(setq-default fill-column 66)
;; Display battery state in mode-line
(setq battery-mode-line-format " (%L %p%% %t)")
(display-battery-mode 1)

;;
;;
;; Goodies
;;
;;

;; DONE with date in todo-list
(setq org-log-done t)
;; Dired+ use one buffer
(toggle-diredp-find-file-reuse-dir t)
;; y-or-n instead of yes-or-no in kill buffer
(defalias 'yes-or-no-p 'y-or-n-p)
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
 '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
;; Use firefox as default browser for open link
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
;; Scilab
;;(load "scilab-startup")
(define-abbrev-table 'text-mode-abbrev-table
  '(("alpha" "α")
    ("beta" "β")
    ("gamma" "γ")
    ("theta" "θ")
    ("epsilon" "ε")
    ("omega" "ω")
    ("lambda" "λ")
    ("inf" "∞")))

;;
;;
;; Functions
;;
;;

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun fill-buffer ()
  (interactive)
  (fill-region (point-min) (point-max)))
(defun compile-buffer ()
  (interactive)
  (slime-compile-region (point-min) (point-max)))
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))
(defun sudo-edit (&optional arg)
  (interactive "p")
  (if arg
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
(defun reverse-input-method (input-method)
  "Build the reverse mapping of single letters from INPUT-METHOD."
  (interactive
   (list (read-input-method-name "Use input method (default current): ")))
  (if (and input-method (symbolp input-method))
      (setq input-method (symbol-name input-method)))
  (let ((current current-input-method)
	(modifiers '(nil (control) (meta) (control meta))))
    (when input-method
      (activate-input-method input-method))
    (when (and current-input-method quail-keyboard-layout)
      (dolist (map (cdr (quail-map)))
	(let* ((to (car map))
	       (from (quail-get-translation
		      (cadr map) (char-to-string to) 1)))
	  (when (and (characterp from) (characterp to))
	    (dolist (mod modifiers)
	      (define-key local-function-key-map
		(vector (append mod (list from)))
		(vector (append mod (list to)))))))))
    (when input-method
      (activate-input-method current))))
;; Авто определение формата по расширению файла
(add-to-list 'auto-mode-alist '(".fb2$" . fb2-mode-view))
;; Функция для файлов .fb2 в режиме просмотра
(defun fb2-mode-view()
  (vc-toggle-read-only)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
;; Функция для файлов .fb2 в режиме редактирования
(defun fb2-mode-edit()
  (vc-toggle-read-only nil)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
(defun insert-unicode-char ()
  "Insert unicode char"
  (interactive)
  (if (not (boundp 'ucs-names-list))
      (defvar ucs-names-list
	(loop for i in (ucs-names) collect (car i))))
  (let ((char (cdr (assoc-string
		    (ido-completing-read "Unicode (name): "
					 ucs-names-list nil t)
		    ucs-names))))
    (when char
      (ucs-insert char))
    (message (format "%x" char))))
(defun show-unicode-char ()
  (interactive)
  (message (format "%x" (char-after))))
(defun unfill-paragraph ()
  "Replace newline chars in current paragraph by single spaces.
This command does the reverse of `fill-paragraph'."
  (interactive)
  (let ((fill-column 90002000))
    (fill-paragraph nil)))
(defun unfill-region (start end)
  "Replace newline chars in region by single spaces.
This command does the reverse of `fill-region'."
  (interactive "r")
  (let ((fill-column 90002000))
    (fill-region start end)))
(defun unfill-buffer ()
  (interactive)
  (unfill-region (point-min) (point-max)))
;; Hacker typer :)
(defun deactivate-hacker-type ()
  (interactive)
  (define-key fake-hacker-type-map [remap self-insert-command] nil))
(defun inject_contents (&optional n)
  (interactive)
  (setq end (+ start insert_by))
  (insert-file-contents filename nil start end)
  (forward-char insert_by)
  (setq start (+ start insert_by)))
(defun hacker-type (arg)
  (interactive (list (read-file-name "Filename: ")))
  (setq fake-hacker-type-map (make-sparse-keymap))
  (setq filename arg)
  (setq start 0)
  (setq insert_by 3)
  (define-key fake-hacker-type-map [remap self-insert-command] 'inject_contents)
  (use-local-map fake-hacker-type-map))
;; End of Hacker Typer
(defun single-lines-only ()
  "replace multiple blank lines with a single one"
  (interactive)
  (goto-char (point-min))
  (while (re-search-forward "\\(^\\s-*$\\)\n" nil t)
    (replace-match "\n")
    (forward-char 1)))

;;
;;
;; Plugins
;;
;;

;; Workspaces
;; files: ~/.emacs.d/lisp/workspaces.el
(load-library "workspaces.el")
;; Auto Complete Mode
;; files: ~/.emacs.d/lisp/auto-complete-1.3.1/*
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
(ac-config-default)
;; InteractivelyDoThings
(ido-mode)
(setq ido-enable-flex-matching t)
(recentf-mode)
;; Relative linum line-number mode
(require 'linum-relative)
;; Common Lisp developer environment
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")
;;(add-to-list 'load-path "~/.emacs.d/lisp/slime/")
(require 'slime)
(slime-setup)
;;(require 'w3m-load)
;;(setq w3m-use-cookies t)
;; For aspell, need aspell, aspell-ru, aspell-en
(setq-default ispell-program-name "aspell")
(setq ispell-list-command "list")
;; Lush
;;(load "/usr/share/lush2/etc/lush.el")
;; Smex - M-x replacement
(require 'smex)
(smex-initialize)
(smex-auto-update)
;; Elim
;; (FIXME: Бинарник elim в пути ниже для x86_64. Нужно рекомпилировать.
;;(add-to-list 'load-path "~/.emacs.d/lisp/elim")
;;(load-library "garak")
;; truncate long chat buffers,
;; enable spell checking in all lui buffers
;; and use the american dictionary in them
(setq lui-max-buffer-size 30000
      lui-flyspell-p t
      lui-flyspell-alist '(("." "american")))
;;If you’re not seeing images in the Garak account tree you need to add this code:
;;
;;(setq tree-widget-image-enable t)
(require 'org-habit)
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)" "IN PROGRESS(p)") 
	(sequence "|" "CANCELED(c@)" "FAILED(f@)")))
(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "LightPink" :weight bold))
        ("IN PROGRESS" . (:foreground "AliceBlue" :weight bold))
        ("DONE" . (:foreground "LightGreen" :weight bold))
        ("CANCELED" . (:foreground "LightYellow" :weight bold))
        ("FAILED" . (:foreground "IndianRed" :weight bold))))
;; Hotkeys on russian layout
(reverse-input-method 'russian-computer)
;;(add-to-list 'load-path "~/.emacs.d/lisp/scilab-emacs")
;;(load "scilab-startup")
(require 'dired+)

;;
;;
;; Hooks
;;
;;

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (auto-complete-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (pretty-lambda-mode +1)))

(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (auto-complete-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (pretty-lambda-mode +1)))

(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'text-mode-hook (lambda () (auto-fill-mode +1)))
(add-hook 'text-mode-hook (lambda () (abbrev-mode +1)))
;;(add-hook 'text-mode-hook (lambda () (refill-mode +1)))
