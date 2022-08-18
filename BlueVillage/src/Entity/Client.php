<?php

namespace App\Entity;

use App\Repository\ClientRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: ClientRepository::class)]
class Client
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(type: 'integer')]
    private $id;

    #[ORM\Column(type: 'string', length: 255)]
    private $categorie;

    #[ORM\Column(type: 'string', length: 255)]
    private $adresseLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $cpLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $villeLivraison;

    #[ORM\Column(type: 'string', length: 255)]
    private $adresseFacture;

    #[ORM\Column(type: 'string', length: 255)]
    private $cpFacture;

    #[ORM\Column(type: 'string', length: 255)]
    private $villeFacture;

    #[ORM\Column(type: 'string', length: 255)]
    private $modePaiement;

    #[ORM\Column(type: "decimal", precision: 5, scale: 2, nullable: true)]
    private $reduction;

    #[ORM\Column(type: "decimal", precision: 5, scale: 2)]
    private $coefficient;

    #[ORM\Column(type: "string", length: 255, nullable: true)]
    private $numeroSiret;

    #[ORM\Column(type: 'string', length: 255)]
    private $nom;

    #[ORM\Column(type: 'string', length: 255)]
    private $prenom;

    #[ORM\Column(type: "string", length: 255, nullable: true)]
    private $nomEntreprise;


    #[ORM\OneToMany(targetEntity: Commande::class, mappedBy: "client")]
    private $commandes;

    #[ORM\ManyToMany(targetEntity: Commercial::class, mappedBy: "client")]
    private $commercials;

    #[ORM\OneToOne(mappedBy: 'client', targetEntity: User::class, cascade: ['persist', 'remove'])]
    #[ORM\JoinColumn(nullable: true)]
    private $user = null;



    public function __construct()
    {
        $this->commercial = new ArrayCollection();
        $this->commandes = new ArrayCollection();
        $this->commercials = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(INT $id): self
    {
        $this->id = $id;

        return $this;

    }

    public function getCategorie(): ?string
    {
        return $this->categorie;
    }

    public function setCategorie(string $categorieClient): self
    {
        $this->categorie = $categorieClient;

        return $this;
    }

    public function getAdresseLivraison(): ?string
    {
        return $this->adresseLivraison;
    }

    public function setAdresseLivraison(string $adresseLivraisonClient): self
    {
        $this->adresseLivraison = $adresseLivraisonClient;

        return $this;
    }

    public function getCpLivraison(): ?string
    {
        return $this->cpLivraison;
    }

    public function setCpLivraison(string $cpLivraisonClient): self
    {
        $this->cpLivraison = $cpLivraisonClient;

        return $this;
    }

    public function getVilleLivraison(): ?string
    {
        return $this->villeLivraison;
    }

    public function setVilleLivraison(string $villeLivraisonClient): self
    {
        $this->villeLivraison = $villeLivraisonClient;

        return $this;
    }

    public function getAdresseFacture(): ?string
    {
        return $this->adresseFacture;
    }

    public function setAdresseFacture(string $adresseFactureClient): self
    {
        $this->adresseFacture = $adresseFactureClient;

        return $this;
    }

    public function getCpFacture(): ?string
    {
        return $this->cpFacture;
    }

    public function setCpFacture(string $cpFactureClient): self
    {
        $this->cpFacture = $cpFactureClient;

        return $this;
    }

    public function getVilleFacture(): ?string
    {
        return $this->villeFacture;
    }

    public function setVilleFacture(string $villeFactureClient): self
    {
        $this->villeFacture = $villeFactureClient;

        return $this;
    }

    public function getModePaiement(): ?string
    {
        return $this->modePaiement;
    }

    public function setModePaiement(string $modePaiementClient): self
    {
        $this->modePaiement = $modePaiementClient;

        return $this;
    }

    public function getReduction(): ?string
    {
        return $this->reduction;
    }

    public function setReduction(string $reductionClient): self
    {
        $this->reduction = $reductionClient;

        return $this;
    }

    public function getCoefficient(): ?string
    {
        return $this->coefficient;
    }

    public function setCoefficient(string $coefficientClient): self
    {
        $this->coefficient = $coefficientClient;

        return $this;
    }

    public function getNumeroSiret(): ?string
    {
        return $this->numeroSiret;
    }

    public function setNumeroSiret(?string $numeroSiretClient): self
    {
        $this->numeroSiret = $numeroSiretClient;

        return $this;
    }

    public function getNom(): ?string
    {
        return $this->nom;
    }

    public function setNom(string $nomClient): self
    {
        $this->nom = $nomClient;

        return $this;
    }

    public function getPrenom(): ?string
    {
        return $this->prenom;
    }

    public function setPrenom(string $prenomClient): self
    {
        $this->prenom = $prenomClient;

        return $this;
    }

    public function getNomEntreprise(): ?string
    {
        return $this->nomEntreprise;
    }

    public function setNomEntreprise(?string $nomEntrepriseClient): self
    {
        $this->nomEntreprise = $nomEntrepriseClient;

        return $this;
    }


    /**
     * @return Collection<int, Commande>
     */
    public function getCommandes(): Collection
    {
        return $this->commandes;
    }

    public function addCommande(Commande $commande): self
    {
        if (!$this->commandes->contains($commande)) {
            $this->commandes[] = $commande;
            $commande->setClient($this);
        }

        return $this;
    }

    public function removeCommande(Commande $commande): self
    {
        if ($this->commandes->removeElement($commande)) {
            // set the owning side to null (unless already changed)
            if ($commande->getClient() === $this) {
                $commande->setClient(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Commercial>
     */
    public function getCommercials(): Collection
    {
        return $this->commercials;
    }

    public function addCommercial(Commercial $commercial): self
    {
        if (!$this->commercials->contains($commercial)) {
            $this->commercials[] = $commercial;
            $commercial->addClient($this);
        }

        return $this;
    }

    public function removeCommercial(Commercial $commercial): self
    {
        if ($this->commercials->removeElement($commercial)) {
            $commercial->removeClient($this);
        }

        return $this;
    }

    public function getUser(): ?User
    {
        return $this->user;
    }

    public function setUser(?User $user): self
    {
        // unset the owning side of the relation if necessary
        if ($user === null && $this->user !== null) {
            $this->user->setClient(null);
        }

        // set the owning side of the relation if necessary
        if ($user !== null && $user->getClient() !== $this) {
            $user->setClient($this);
        }

        $this->user = $user;

        return $this;
    }

   
}
