(function () {
    const input = document.getElementById('search-input');
    const results = document.getElementById('search-results');
    if (!input || !results) return;

    let timer;

    input.addEventListener('input', function () {
        clearTimeout(timer);
        const q = input.value.trim();
        if (q.length < 3) {
            hide();
            return;
        }
        timer = setTimeout(() => fetchResults(q), 300);
    });

    document.addEventListener('click', function (e) {
        if (!e.target.closest('.search-wrapper')) {
            hide();
        }
    });

    input.addEventListener('keydown', function (e) {
        if (e.key === 'Escape') hide();
    });

    function fetchResults(q) {
        fetch('/api/products/search?q=' + encodeURIComponent(q))
            .then(r => r.json())
            .then(products => {
                if (products.length === 0) {
                    results.innerHTML = '<div class="search-no-result">Aucun résultat</div>';
                } else {
                    results.innerHTML = products.map(p => {
                        const url = '/' + (p.categorySlug || '') + '/' + p.slug;
                        return '<a class="search-item" href="' + url + '">'
                            + '<span class="search-item-name">' + escHtml(p.name) + '</span>'
                            + '<span class="search-item-price">' + p.price.toFixed(2) + ' €</span>'
                            + '</a>';
                    }).join('');
                }
                results.style.display = 'block';
            })
            .catch(() => hide());
    }

    function hide() {
        results.innerHTML = '';
        results.style.display = 'none';
    }

    function escHtml(str) {
        return str.replace(/[&<>"']/g, function (c) {
            return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' }[c];
        });
    }
})();
