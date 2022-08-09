(defn exit-error [msg]
  (eprint msg)
  (os/exit 1))

(defn sh [args]
  (let
    [p (os/spawn args :p {:out :pipe})
     o (:read (p :out) :all)
     c (:wait p)]
    {:code c :out o}))
