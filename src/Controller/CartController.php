<?php

namespace App\Controller;

use App\Cart\CartService;
use App\Form\CartConfirmationType;
use App\Form\LoginType;
use App\Form\UserType;
use App\Entity\User;
use App\Repository\ProductRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class CartController extends AbstractController
{
    /** @var ProductRepository */
    protected $productRepository;

    /** @var CartService logique métier du panier (session) */
    protected $cartService;

    // Symfony injecte automatiquement les dépendances via le constructeur
    public function __construct(ProductRepository $productRepository, CartService $cartService)
    {
        $this->productRepository = $productRepository;
        $this->cartService = $cartService;
    }

    // Ajoute 1 exemplaire du produit {id} au panier
    #[Route('/cart/add/{id}', name: 'cart_add', requirements: ['id' => '\\d+'])]
    public function add($id, Request $request): Response
    {
        // Vérifie que le produit existe en BDD, sinon 404
        $product = $this->productRepository->find($id);

        if (!$product) {
            throw $this->createNotFoundException("Le produit $id n'existe pas.");
        }

        $this->cartService->add($id);

        $this->addFlash('success', "Le produit a bien été ajouté au panier.");

        // Bouton + depuis la page panier : ?returnToCart=true → retour au panier
        if ($request->query->get('returnToCart')) {
            return $this->redirectToRoute('cart_show');
        }

        // Requête AJAX (fetch JS) → réponse JSON pour mettre à jour le compteur sans recharger
        if ($request->isXmlHttpRequest()) {
            return new JsonResponse([
                'success' => true,
                'total' => $this->cartService->getTotal(),
                'totalDisplay' => number_format($this->cartService->getTotal() / 100, 2, '.', ''),
            ]);
        }

        // Requête normale (sans JS) → retour sur la fiche produit
        return $this->redirectToRoute('product_show', [
            'category_slug' => $product->getCategory()->getSlug(),
            'slug' => $product->getSlug()
        ]);
    }

    // Retire 1 exemplaire du produit {id} (supprime l'article si qty tombe à 0)
    #[Route('/cart/decrement/{id}', name: 'cart_decrement', requirements: ['id' => '\\d+'])]
    public function decrement($id)
    {
        $product = $this->productRepository->find($id);

        if (!$product) {
            throw $this->createNotFoundException("Le produit $id n'existe pas et ne peut pas être décrémenté.");
        }

        $this->cartService->decrement($id);
        $this->addFlash('success', "Le produit a bien été décrémenté.");
        return $this->redirectToRoute("cart_show");
    }

    // Affiche le panier avec les formulaires de confirmation, connexion et inscription
    #[Route('/cart', name: 'cart_show')]
    public function show(Request $request): Response
    {
        $confirmationForm = $this->createForm(CartConfirmationType::class);

        // Le formulaire de login redirige vers /cart après connexion réussie
        $loginForm = $this->createForm(LoginType::class, [
            'redirect_to' => '/cart'
        ]);

        $signupForm = $this->createForm(UserType::class, new User());

        // Articles détaillés : chaque item contient le produit, la qty et le sous-total
        $detailedCart = $this->cartService->getDetailedCartItems();
        $total = $this->cartService->getTotal();

        return $this->render('cart/cart.html.twig', [
            'items' => $detailedCart,
            'total' => $total,
            'confirmationForm' => $confirmationForm->createView(),
            'loginForm' => $loginForm->createView(),
            'signupForm' => $signupForm->createView(),
        ]);
    }

    // Supprime complètement le produit {id} du panier (quelle que soit la quantité)
    #[Route('/cart/delete/{id}', name: 'cart_delete', requirements: ['id' => '\\d+'])]
    public function delete($id)
    {
        $product = $this->productRepository->find($id);

        if (!$product) {
            throw $this->createNotFoundException("Le produit $id n'existe pas et ne peut être supprimé.");
        }

        $this->cartService->remove($id);

        $this->addFlash('success', "Le produit a bien été supprimé du panier.");
        return $this->redirectToRoute('cart_show');
    }
}
