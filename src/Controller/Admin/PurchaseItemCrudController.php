<?php

namespace App\Controller\Admin;

use App\Entity\PurchaseItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;

class PurchaseItemCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return PurchaseItem::class;
    }

    public function configureActions(Actions $actions): Actions
    {
    return $actions
        ->disable(Action::NEW, Action::DELETE)
        ->disable(Action::NEW, Action::EDIT)
    ;
    }

    /*
    public function configureFields(string $pageName): iterable
    {
        return [
            IdField::new('id'),
            TextField::new('title'),
            TextEditorField::new('description'),
        ];
    }
    */
}
