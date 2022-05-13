<?php

namespace App\Controller\Admin;

use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;
use EasyCorp\Bundle\EasyAdminBundle\Field\TextField;
use EasyCorp\Bundle\EasyAdminBundle\Field\NumberField;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractCrudController;
use EasyCorp\Bundle\EasyAdminBundle\Field\BooleanField;

class UserCrudController extends AbstractCrudController
{
    public static function getEntityFqcn(): string
    {
        return User::class;
    }

    public function configureActions(Actions $actions): Actions
    {
    return $actions
        ->disable(Action::NEW, Action::DELETE)
        ->disable(Action::NEW, Action::EDIT)
    ;
    }

    public function configureFields(string $pageName): iterable
    {
        return [
            TextField::new('email'),
            TextField::new('firstName'),
            TextField::new('LastName'),
            TextField::new('address'),
            TextField::new('city'),
            NumberField::new('postalCode'),
            NumberField::new('phoneNumber'),
            BooleanField::new('isVerified'),
        ];
    }
}
