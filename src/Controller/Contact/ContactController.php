<?php

namespace App\Controller\Contact;

use App\Entity\Contact;
use App\Form\ContactType;
use App\Repository\ContactRepository;
use App\Entity\User;
use App\Form\UserType;
use App\Repository\UserRepository;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\String\Slugger\SluggerInterface;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\File\Exception\FileException;
use App\Event\ContactSuccessEvent;
use App\Event\InscriptionSuccessEvent;

use Symfony\Component\HttpFoundation\File\UploadedFile;
class ContactController extends AbstractController
{

    public function __construct(
        private EventDispatcherInterface $dispatcher, 
        private EntityManagerInterface $em)
    {}

    #[Route('/contact', name: 'envoyerMessageContact')]
    public function envoyerMessageContact(
        Request $request,
        SluggerInterface $slugger
    ) {
        $contact = new Contact;
        //getForm + setData
        $form = $this->createForm(ContactType::class);
        //analyse request
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
 
            /** @var UploadedFile $brochureFile */
            $brochureFile = $form->get('brochure')->getData();
            $contact = $form->getData();

            // Si reCAPTCHA est validé, traiter les données du formulaire
            if ($brochureFile) {
                $originalFilename = pathinfo($brochureFile->getClientOriginalName(), PATHINFO_FILENAME);
                // this is needed to safely include the file name as part of the URL
                $safeFilename = $slugger->slug($originalFilename);
                $newFilename = $safeFilename . '-' . uniqid() . '.' . $brochureFile->guessExtension();
                $contact->setBrochureFilename($newFilename);

                // Move the file to the directory where brochures are stored
                try {
                    $brochureFile->move(
                        $this->getParameter('brochures_directory'),
                        $newFilename
                    );
                } catch (FileException $e) {
                    // Gérer l'exception si le téléchargement échoue
                }
            }

            $this->em->persist($contact);
            $this->em->flush();

            // Lancer un évènement qui permettent aux autres développeurs de réagir à la soumission d'un message
            $contactEvent = new ContactSuccessEvent($contact);

            $this->dispatcher->dispatch($contactEvent, 'message.success');

            $this->addFlash('success', 'Votre message a été envoyé.');
        }

        $formView = $form->createView();

        return $this->render('contact/contact.html.twig', [
            'formView' => $formView
        ]);
    }

    public function confirm()
    {
    }

    #[Route('/admin/editerMessageContact/{id}', name: 'messageContactEdit')]
    public function editerMessageContact(
        $id,
        ContactRepository $contactRepository,
        Request $request,
        EntityManagerInterface $em
    ) {

        $message = $contactRepository->find($id);

        $form = $this->createForm(ContactType::class, $message);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em->flush();

            return $this->redirectToRoute('homepage');
        }

        $formView = $form->createView();

        return $this->render('contact/edit.html.twig', [
            'contact' => $message,
            'formView' => $formView
        ]);
    }

    #[Route('/inscription', name: 'inscription')]
    public function inscription(
        Request $request,
        UserPasswordHasherInterface $encoder
    ) {
        //$flashBag->add('info', 'Le formulaire est en cours de développement.');

        $user = new User;
        //getForm + setData
        $form = $this->createForm(UserType::class);
        //analyse request
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

  
            $user = $form->getData();
            $password = $user->getPassword();

            $hash = $encoder->hashPassword($user, $password);
            $user->setPassword($hash);

            $this->em->persist($user);
            $this->em->flush();

            // Lancer un évènement qui permettent aux autres développeurs de réagir à la soumission d'un message
            $userEvent = new InscriptionSuccessEvent($user);

            $this->dispatcher->dispatch($userEvent, 'user.success');

            $this->addFlash('success', 'Inscription réussi.');
            $this->addFlash('success', 'Vous recevrez une confirmation de votre inscription ainsi que le récap des vos accès.');
        }

        $formView = $form->createView();

        return $this->render('contact/inscription.html.twig', [
            'formView' => $formView
        ]);
    }
}
