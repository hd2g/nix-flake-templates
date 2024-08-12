((nil . ((eval . (progn
                   (let ((proj/merlin-site-elisp (getenv "MERLIN_SITE_LISP"))
                         (proj/utop-site-elisp (getenv "UTOP_SITE_LISP"))
                         (proj/ocp-indent-site-elisp (getenv "OCP_INDENT_SITE_LISP")))
                     (if proj/merlin-site-elisp
                         (load-file proj/merlin-site-elisp)
                       (message "MERLIN_SITE_LISP not found")))
                   (setq-local
                    merlin-command (locate-file "ocamlmerlin" exec-path)
                    merlin-opam-bin-path (list (getenv "PATH"))))))))
