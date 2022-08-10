(defn exit-error [msg]
  (eprint msg)
  (os/exit 1))

(defn sh [args]
  (let
    [p (os/spawn args :p {:out :pipe})
     o (:read (p :out) :all)
     c (:wait p)]
    {:code c :out o}))

(defn blank? [a]
  (or (nil? a) (= a "")))

(defn present? [a]
  (not (blank? a)))

(defn rest [a]
  (array/slice a 1))
