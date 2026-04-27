document.addEventListener('DOMContentLoaded', function () {
    var cartTotal = document.querySelector('#cart-total');

    function updateCartTotal(totalDisplay) {
        if (cartTotal) {
            cartTotal.textContent = totalDisplay;
        }
    }

    document.querySelectorAll('a.js-add-to-cart').forEach(function (link) {
        link.addEventListener('click', function (event) {
            event.preventDefault();
            var url = link.href;

            fetch(url, {
                method: 'GET',
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'Accept': 'application/json'
                }
            })
                .then(function (response) {
                    if (!response.ok) {
                        throw new Error('Erreur lors de l’ajout au panier.');
                    }
                    return response.json();
                })
                .then(function (data) {
                    if (data && data.success) {
                        updateCartTotal(data.totalDisplay);
                    }
                })
                .catch(function (error) {
                    console.error(error);
                });
        });
    });
});

window.addEventListener('pageshow', function (event) {
    var navEntries = window.performance && window.performance.getEntriesByType
        ? window.performance.getEntriesByType('navigation')
        : [];
    var navigationType = navEntries.length ? navEntries[0].type : (window.performance && window.performance.navigation ? window.performance.navigation.type : null);

    if (event.persisted || navigationType === 'back_forward' || navigationType === 2) {
        window.location.reload();
    }
});
