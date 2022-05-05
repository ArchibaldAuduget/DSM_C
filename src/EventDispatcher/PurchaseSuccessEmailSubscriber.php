<?php

namespace App\EventDispatcher;

use App\Entity\User;
use Psr\Log\LoggerInterface;
use Symfony\Component\Mime\Email;
use App\Event\PurchaseSuccessEvent;
use Symfony\Component\Mime\Address;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class PurchaseSuccessEmailSubscriber implements EventSubscriberInterface
{
    protected $logger;
    protected $mailer;
    protected $security;

    public function __construct(LoggerInterface $logger, MailerInterface $mailer, Security $security)
    {
        $this->logger = $logger;
        $this->mailer = $mailer;
        $this->security = $security;
    }

    public static function getSubscribedEvents()
    {
        return [
            'purchase.success' => 'sendSuccessEmail'
        ];
    }

    public function sendSuccessEmail(PurchaseSuccessEvent $purchaseSuccessEvent)
    {
        /**
         * @var User
         */
        $currentUser = $this->security->getUser();
        $purchase = $purchaseSuccessEvent->getPurchase();
        $fullName = $currentUser->getFirstName() . ' ' . $currentUser->getLastName();

        $email = new TemplatedEmail();
        $email->to(new Address($currentUser->getEmail(), $fullName))
            ->from('archibald77100@gmail.com')
            ->subject("Votre commande n'({$purchase->getId()}) a bien été confirmée !")
            ->htmlTemplate('emails/purchase_success.html.twig')
            ->context([
                'purchase' => $purchase,
                'user' => $currentUser
            ]);


        $this->mailer->send($email);

        $this->logger->info('Email envoyé');
        $purchaseSuccessEvent->getPurchase()->getId();
    }
}