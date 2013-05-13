;;;; This file is free software: you can redistribute it and/or
;;;; modify it under the terms of the GNU General Public License
;;;; as published by the Free Software Foundation, either version
;;;; 3 of the License, or (at your option) any later version.
;;;;
;;;; This file is distributed in the hope that it will be useful,
;;;; but WITHOUT ANY WARRANTY; without even the implied warranty
;;;; of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
;;;; the GNU General Public License for more details.
;;;;
;;;; You should have received a copy of the GNU General Public
;;;; License along with this program.  If not, see
;;;; <http://www.gnu.org/licenses/>.
;;;;
;;;; Author: Klementyev Mikhail <jollheef@riseup.net>
;;;;
;;;; https://github.com/jollheef/main/blob/master/init.el
;;;;

;;
;; Package list:
;; community/emacs-w3m-cvs, aspell, aspell-ru, aspell-en, lush
;;
;; Elpa list:
;; ac-slime-0.2 auctex-11.86 back-button-0.6.4 button-lock-0.9.10
;; cm-mode-0.1.0 coffee-mode-0.4.1 crontab-mode-1.2
;; csharp-mode-0.8.6 dired+-21.2 find-file-in-project-3.2
;; fixmee-0.8.2 flymake-easy-0.4 flymake-haskell-multi-0.2
;; flymake-hlint-0.2 gdb-shell-0.4 ghc-1.10.2 ghci-completion-0.1.3
;; git-commit-0.1 haml-mode-3.0.14 haskell-mode-2.8.0 highlight-21.0
;; highlight-indentation-0.5.0 highlight-parentheses-1.0.1
;; ido-ubiquitous-1.5 less-css-mode-0.10 list-utils-0.3.0
;; markdown-mode-1.8.1 monokai-theme-0.0.8 nav-flash-1.0.8
;; paredit-20 paredit-22 pcache-0.2.3 persistent-soft-0.8.6
;; php-mode-1.5.0 pretty-lambdada-22.0 rust-mode-0.1.0
;; sass-mode-3.0.14 shell-here-1.1 smartrep-0.0.3 smex-1.1.1
;; smex-2.0 string-utils-0.2.8 sunrise-commander-6.441
;; switch-window-0.9 tex-math-preview-readme.txt ucs-utils-0.7.2
;; w3-4.0.46 wgrep-2.1.3 windresize-0.1 yaml-mode-0.0.7
;;
;; Lisp List:
;; auto-complete-1.3.1 auto-complete-latex.el color-theme.el elim
;; elim-client highlight-indentation.el linum-relative.el
;; nasm-mode.el nyan-img nyan-mode.el workspaces.el zenburn.el
;;
;; Note:
;; Use last slime from unstable(deb) repository
;;

;;
;;
;; Common
;;
;;

(require 'package)
;; Add the original Emacs Lisp Package Archive
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu"  . "http://elpa.gnu.org/packages/")
	("SC"     "http://joseito.republika.pl/sunrise-commander/")))
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
(global-set-key (kbd "<f12>")
		(lambda ()
		  (interactive)
		  (ispell-change-dictionary "ru" nil)))
(global-set-key (kbd "<f11>")
		(lambda ()
		  (interactive)
		  (ispell-change-dictionary "en" nil)))
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
(global-set-key (kbd "C-c C-f") 'insert-fixme)
(global-set-key (kbd "C-c f") 'insert-fixme)
(global-set-key (kbd "C-c C-s") 'insert-seeme)
(global-set-key (kbd "C-c s") 'insert-seeme)
(global-set-key (kbd "M-]") 'undo)
(global-set-key (kbd "C-x O")
		(lambda () (interactive) (other-window -1))) ;; back one
(global-set-key (kbd "C-x C-o")
		(lambda () (interactive) (other-window 2))) ;; forward two
(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (save-buffer)
	    (local-set-key (kbd "C-c C-x C-s")
			   'latex-compile)))
(global-set-key (kbd "<f2>") 'toggle-truncate-lines)

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
(set-default-font "DejaVu Sans Mono-11")
(setq default-frame-alist '((font .  "DejaVu Sans Mono-11")))
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
(setq c-default-style "gnu"
      c-basic-offset 2)
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
;; Colors for highlight-indentation-mode
(require 'highlight-indentation)
(set-face-background 'highlight-indentation-face "#3F533F")
(set-face-background 'highlight-indentation-current-column-face "#5f7f5f")
(custom-set-faces
 '(whitespace-empty ((t (:background "#3F3F3F" :foreground "firebrick"))))
 '(whitespace-tab ((t (:background "#3F3F3F" :foreground "#666666"))))
 '(whitespace-space ((t (:background "#3F3F3F" :foreground "#666666"))))
 '(whitespace-newline ((t (:background "#3F3F3F" :foreground "#666666")))))
;;(global-whitespace-mode)

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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/")))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
(make-directory "~/.emacs.d/backups/" t)
;; Use firefox as default browser for open link
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
;; Scilab
;;(load "scilab-startup")
(define-abbrev-table 'text-mode-abbrev-table
  '(("alpha" "α")    ("альфа" "α")
    ("beta" "β")     ("бета" "β")
    ("gamma" "γ")    ("гамма" "γ")
    ("delta" "δ")    ("дельта" "δ")
    ("Delta" "Δ")    ("Дельта" "Δ")
    ("epsilon" "ε")  ("эпсилон" "ε")
    ("dzeta" "ζ")    ("дзета" "ζ")
    ("eta" "η")      ("эта" "η")
    ("theta" "θ")    ("тета" "θ")
    ("yota" "ι")     ("йота" "ι")
    ("kappa" "κ")    ("каппа" "κ")
    ("lambda" "λ")   ("лямбда" "λ")
    ("mu" "μ")       ("мю" "μ")
    ("nu" "ν")       ("ню" "ν")
    ("ksi" "ξ")      ("кси" "ξ")
    ("omikron" "ο")  ("омикрон" "ο")
    ("pi" "π")       ("пи" "π")
    ("ro" "ρ")       ("ро" "ρ")
    ("sigma" "σ")    ("сигма" "σ")
    ("tau" "τ")      ("тау" "τ")
    ("ipsilon" "υ")  ("ипсилон" "υ")
    ("phi" "φ")      ("фи" "φ")
    ("hi" "χ")       ("хи" "χ")
    ("psi" "ψ")      ("пси" "ψ")
    ("omega" "ω")    ("омега" "ω")
    ("inf" "∞")      ("бесконечность" "∞")))
(put 'downcase-region 'disabled nil)
(defalias 'select-all 'mark-whole-buffer)

;;
;;
;; Functions
;;
;;

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(defun c-indent-buffer ()
  (interactive)
  (astyle-buffer)
  (indent-buffer))
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
(defun update ()
  "Insert a date in a Day/Month/Year format"
  (interactive)
  (insert (format-time-string "Update %d/%m/%y : " (current-time))))
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
;;(add-to-list 'auto-mode-alist '(".fb2$" . fb2-mode-view))
(add-to-list 'auto-mode-alist '(".php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))
(add-to-list 'auto-mode-alist '(".gdb$" . gdb-script-mode))

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
(defun astyle-region (pmin pmax)
  (interactive "r")
  (shell-command-on-region
   pmin pmax
   "astyle -A7 -x" ;; GNU style formatting/indenting.
   (current-buffer) t
   (get-buffer-create "*Astyle Errors*") t))
(defun astyle-buffer ()
  (interactive)
  (astyle-region (point-min) (point-max)))
;; RECODE ENGLISH TO RUSSIAN
(defvar u:*en/ru-table*
  '((?q  . ?й) (?w  . ?ц) (?e  . ?у)
    (?r  . ?к) (?t  . ?е) (?y  . ?н) (?u  . ?г)
    (?i  . ?ш) (?o  . ?щ) (?p  . ?з)
    (?[  . ?х)
      (?]  . ?ъ) (?a  . ?ф) (?s  . ?ы) (?d  . ?в)
      (?f  . ?а) (?g  . ?п) (?h  . ?р) (?j  . ?о)
      (?k  . ?л) (?l  . ?д) (?\; . ?ж) (?\' . ?э)
      (?z  . ?я) (?x  . ?ч) (?c  . ?с) (?v  . ?м)
      (?b  . ?и) (?n  . ?т) (?m  . ?ь) (?,  . ?б)
      (?.  . ?ю) (?/  . ?.) (?!  . ?!) (?@  . ?\")
      (?#  . ?№) (?$  . ?\;) (?%  . ?%) (?^  . ?:)
      (?&  . ??) (?*  . ?*) (?Q  . ?Й) (?W  . ?Ц)
      (?E  . ?У) (?R  . ?К) (?T  . ?Е) (?Y  . ?Н)
      (?U  . ?Г) (?I  . ?Ш) (?O  . ?Щ) (?P  . ?З)
      (?{  . ?Х) (?}  . ?Ъ) (?A  . ?Ф)
      (?S  . ?Ы) (?D  . ?В) (?F  . ?А) (?G  . ?П)
      (?H  . ?Р) (?J  . ?О) (?K  . ?Л) (?L  . ?Д)
      (?:  . ?Ж) (?\" . ?Э) (?Z  . ?Я) (?X  . ?Ч)
      (?C  . ?С) (?V  . ?М) (?B  . ?И) (?N  . ?Т)
      (?M  . ?Ь) (?<  . ?Б) (?>  . ?Ю) (?\? . ?,)))
;;-----------------------------------------------------------
(defun recode-region-ru->en (beg end &optional arg)
  "Recode the given region, that contains Russain
   text typed in English, into Russian.
   With ARG recode from Russian o English."
  (interactive "*r\nP")
  (save-excursion
    (goto-char beg)
    (do () ((>= (point) end))
      (let* ((en-char (char-after (point)))
	     (ru-char (if arg
			  (car (rassoc en-char u:*en/ru-table*))
			(cdr (assoc en-char u:*en/ru-table*)))))
	(delete-char 1)
	(insert (if ru-char ru-char en-char))))))
(defun insert-fixme ()
  "Insert FIXME"
  (interactive)
  (insert "FIXME "))
(defun insert-seeme ()
  "Insert SEEME"
  (interactive)
  (insert "SEEME "))
(defun latex-compile ()
  (interactive)
  (save-buffer)
  (start-process
   "latex-compilation" "latex-compile"
   "/home/michael/bin/textopdf" (buffer-file-name))
  (sleep-for 3)
  (let ((filename (buffer-file-name)))
    (setf filename (concatenate 'string
				(file-name-directory filename)
				(file-name-base filename)
				".pdf"))
    (if (file-exists-p filename)
	(start-process
	 "latex-compilation" "latex-compile"
	 "evince"
	 filename))))
(defun save-macro (name)                  
  "save a macro. Take a name as argument
     and save the last defined macro under 
     this name at the end of your .emacs"
  (interactive "SName of the macro :")  ; ask for the name of the macro    
  (kmacro-name-last-macro name)         ; use this name for the macro    
  (find-file user-init-file)            ; open ~/.emacs or other user init file 
  (goto-char (point-max))               ; go to the end of the .emacs
  (newline)                             ; insert a newline
  (insert-kbd-macro name)               ; copy the macro 
  (newline)                             ; insert a newline
  (switch-to-buffer nil))               ; return to the initial buffer
(defun insert-random-md5 ()
  (interactive)
  (insert (shell-command-to-string
	   "cat /dev/urandom | head | md5sum | awk '{print $1}' |tr '\n' ' '")))

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
(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/lisp/auto-complete-1.3.1/ac-dict")
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
;;If you’re not seeing images in the Garak account
;; tree you need to add this code:
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
(require 'nasm-mode)
;; For ac-latex
;;(require 'auto-complete-latex)
;;(setq ac-modes (append ac-modes '(foo-mode)))
(yas-global-mode 1)

;;
;;
;; Hooks
;;
;;

(add-hook 'emacs-lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (auto-complete-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (pretty-lambda-mode +1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (highlight-parentheses-mode +1)))

(add-hook 'lisp-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (auto-complete-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (pretty-lambda-mode +1)))
(add-hook 'lisp-mode-hook (lambda () (highlight-parentheses-mode +1)))
;;(add-hook 'lisp-mode-hook (lambda () (git-auto-commit-mode +1)))

(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'text-mode-hook (lambda () (auto-fill-mode +1)))
(add-hook 'text-mode-hook (lambda () (abbrev-mode +1)))
;;(add-hook 'text-mode-hook (lambda () (refill-mode +1)))
(add-hook 'c-mode-hook (lambda () (c-toggle-auto-newline +1)))
(add-hook 'c-mode-hook (lambda () (c-toggle-auto-hungry-state +1)))
(add-hook 'c-mode-hook (lambda () (highlight-parentheses-mode +1)))
;;(add-hook 'c-mode-hook (lambda () (whitespace-mode +1)))
;;(add-hook 'c-mode-hook (lambda () (git-auto-commit-mode +1)))
(add-hook 'nasm-mode-hook (lambda () (auto-fill-mode)))
;;(add-hook 'foo-mode-hook 'ac-l-setup)
(add-hook 'LaTeX-mode-hook (lambda () (abbrev-mode -1)))
