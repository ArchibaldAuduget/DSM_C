<?php

namespace App\EventSubscriber;

use DateTime;
use App\Entity\Product;
use App\Entity\Category;
use Symfony\Component\String\Slugger\SluggerInterface;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use EasyCorp\Bundle\EasyAdminBundle\Event\BeforeEntityPersistedEvent;

class EasyAdminSubscriber implements EventSubscriberInterface
{
    private $slugger;

    public function __construct(SluggerInterface $slugger)
    {
        $this->slugger = $slugger;
    }

    public static function getSubscribedEvents()
    {
        return [
            BeforeEntityPersistedEvent::class => ['setCategorySlug'],
        ];
    }

    public function setCategorySlug(BeforeEntityPersistedEvent $event)
    {
        $entity = $event->getEntityInstance();

        if (!($entity instanceof Category || $entity instanceof Product)) {
            return;
        }

        $slug = strtolower($this->slugger->slug($entity->getName()));
        $entity->setSlug($slug);
    }
}