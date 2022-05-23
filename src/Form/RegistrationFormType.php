<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Type;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            // label et placeholder de email et password directement dans la vue register.html.twig
            ->add('email')
            ->add('plainPassword', PasswordType::class, [
                // instead of being set onto the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'attr' => [
                    'autocomplete' => 'new-password',
                    'placeholder' => 'Votre mot de passe'
            
            ],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Veuillez renseigner un mot de passe',
                    ]),
                    new Length([
                        'min' => 8,
                        'minMessage' => 'Votre mot de passe doit faire 8 caractères minimum',
                        // max length allowed by Symfony for security reasons
                        'max' => 4096,
                    ]),
                ],
            ])
            ->add('firstName', TextType::class, [
                'label' => 'Prénom :',
                'attr' => ['placeholder' => 'Votre prénom'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre prénom.',
                    ]),
                    new Length([
                        'min' => 2,
                        'minMessage' => 'Votre prénom doit faire au moins deux caractères.'
                    ]),
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Nom :',
                'attr' => ['placeholder' => 'Votre nom de famille'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre nom de famille.',
                    ]),
                    new Length([
                        'min' => 2,
                        'minMessage' => 'Votre nom de famille doit faire au moins deux caractères.'
                    ]),
                ]
            ])
            ->add('address', TextType::class, [
                'label' => 'Adresse :',
                'attr' => ['placeholder' => 'Votre adresse'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre adresse',
                    ]),
                ]
            ])
            ->add('phoneNumber', IntegerType::class, [
                'label' => 'Numéro de téléphone :',
                'attr' => ['placeholder' => 'Votre numéro de téléphone'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre numéro de téléphone',
                    ]),
                    new Type([
                        'type' => 'integer',
                        'message' => 'Le numéro de téléphone n\'est pas valide'
                    ])
                ]
            ])
            ->add('country', TextType::class, [
                'label' => 'Pays :',
                'attr' => ['placeholder' => 'Votre pays'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre pays',
                    ])
                ]
            ])
            ->add('postalCode', IntegerType::class, [
                'label' => 'Code postal :',
                'attr' => ['placeholder' => 'Ex : 75000'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre code postal',
                    ]),
                    new Type([
                        'type' => 'integer',
                        'message' => 'Le code postal n\'est pas valide'
                    ])
                ]
            ])
            ->add('city', TextType::class, [
                'label' => 'Ville :',
                'attr' => ['placeholder' => 'Votre ville'],
                'constraints' => [
                    new NotBlank([
                        'message' => 'Vous devez renseigner votre ville',
                    ])
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
