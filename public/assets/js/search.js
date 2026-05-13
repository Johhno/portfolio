// Autocomplétion de la barre de recherche — IIFE pour éviter de polluer le scope global
(function () {
    const input = document.getElementById('search-input');
    const results = document.getElementById('search-results');
    // Ne rien faire si les éléments sont absents (page sans navbar)
    if (!input || !results) return;

    let timer; // Référence au debounce pour pouvoir l'annuler

    // Déclenché à chaque frappe dans le champ
    input.addEventListener('input', function () {
        clearTimeout(timer); // Annule la requête précédente si l'utilisateur tape encore
        const q = input.value.trim();
        // Minimum 3 caractères pour éviter des requêtes trop larges
        if (q.length < 3) {
            hide();
            return;
        }
        // Attend 300 ms après la dernière frappe avant d'envoyer la requête
        timer = setTimeout(() => fetchResults(q), 300);
    });

    // Ferme le dropdown si on clique en dehors de la zone de recherche
    document.addEventListener('click', function (e) {
        if (!e.target.closest('.search-wrapper')) {
            hide();
        }
    });

    // Ferme le dropdown avec la touche Échap
    input.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') hide();
    });

    // Appelle l'API Symfony et injecte les résultats dans le dropdown
    function fetchResults(q) {
        fetch('/api/products/search?q=' + encodeURIComponent(q))
            .then(r => r.json())
            .then(products => {
                if (products.length === 0) {
                    results.innerHTML = '<div class="search-no-result">Aucun résultat</div>';
                } else {
                    results.innerHTML = products.map(p => {
                        // URL construite à partir des slugs renvoyés par l'API
                        const url = '/' + (p.categorySlug || '') + '/' + p.slug;
                        return '<a class="search-item" href="' + url + '">'
                            + '<span class="search-item-name">' + escHtml(p.name) + '</span>'
                            + '<span class="search-item-price">' + p.price.toFixed(2) + ' €</span>'
                            + '</a>';
                    }).join('');
                }
                results.style.display = 'block';
            })
            .catch(() => hide()); // En cas d'erreur réseau, on ferme silencieusement
    }

    // Vide et masque le dropdown
    function hide() {
        results.innerHTML = '';
        results.style.display = 'none';
    }

    // Échappe les caractères HTML pour éviter les injections XSS dans les noms de produits
    function escHtml(str) {
        return str.replace(/[&<>"']/g, function (c) {
            return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
        });
    }
})();
