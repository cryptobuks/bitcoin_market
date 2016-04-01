<?php 

namespace App\Presenters;

use Nette;
use App\Model\Listings;
use App\Forms\ListingFormFactory;
use App\Forms\VendorNotesFactory;
use Nbobtc\Command\Command;

class ListingsPresenter extends ProtectedPresenter {
    
    protected $URL;
    
    public function __construct(Nette\Http\Request $r){
        $this->URL = $r->getUrl();
    }
    
    protected $listings;
    
    private function returnLogin(){      
        $login = $this->getUser()->getIdentity()->login;       
        return $login;
    }
    
    private function returnId(){
        $id = $this->getUser()->getIdentity()->getId();       
        return $id;
    }
      
    private function formValidateValues($form){
        
        $values = $form->getValues(TRUE);
        
        foreach ($values as $value){
            if (!isset($value) || (is_string($value) && strcmp($value, "") == 0)){
                $form->addError("Formulář nesmí obsahovat prázdné pole.");
            }
        }
    }
    
    private function imgUpload($images, $form){
        
        foreach($images as $image){
        
            if ($image->isOk() && $image->isImage()){
                $filesPath = getcwd() . "/userfiles/" ;
                $username = $this->returnLogin();
                $userPath = $filesPath . $username;

                //get extension for randomized filename
                $imageName = $image->getName();
                $fileExtension = strrchr($imageName, ".");

                //randomness for file name
                $rand = substr(md5(microtime()),rand(0,26),10);

                if (file_exists($userPath)){
                    $image->move($userPath . "/" . $rand . $fileExtension);

                } else {
                    mkdir($userPath);
                    $image->move($userPath . "/" . $fileExtension);
                }

            } else {
                $form->addError("Vámi uploadovaný soubor není povolen!");
            }
        }     
    }
    
    public function injectBaseModels(Listings $list){
        $this->listings = $list;
    }
    
    protected $formFactory;
    protected $vendorNotes;
    
    public function injectListingForm(ListingFormFactory $factory){
        $this->formFactory = $factory;
    }
    
    public function injectVendorNotes(VendorNotesFactory $vendorNotes){
        $this->vendorNotes = $vendorNotes;
    }
    
    public function createComponentListingForm(){
        $form = $this->formFactory->create();
        $form->addSubmit("submit", "Vytvořit");
        $form->onSuccess[] = array($this, 'listingCreate');
        $form->onValidate[] = array($this, 'listingValidate');
       
        return $form;
    }
    
    public function listingCreate($form){
        
        $values = $form->getValues(True);
        $id = $this->getUser()->getIdentity()->login;
        
        $imageLocations = array();
        $images = $form->values['image'];
        
        foreach ($images as $image){
            //get relative path to image for webserver &
            //save relative paths into array
            array_push($imageLocations, substr($image->getTemporaryFile(),
                    strpos($image->getTemporaryFile(), "userfiles/")));     
        }
        
        //serialize img locations to store it in one field in db
        $imgLocSerialized = serialize($imageLocations);
        $this->listings->createListing($id, $values, $imgLocSerialized);
        
        $this->redirect("Listings:in");
    }
    
    public function listingValidate($form){
        
        $this->formValidateValues($form);
        $images = $form->values['image'];
        $this->imgUpload($images, $form);
    }
    
    public function handleVendor(){
        
        $session = $this->getSession()->getSection('balance');
        
        $login =  $this->returnLogin();      
  
        if ($session->balance > 1){
          //  try {
                 $this->listings->becomeVendor($login);
          //  } catch () {
            //    ...
           // }
        } else {
            $this->flashMessage('You dont have sufficient funds!');
        }
    }
    
    public function actionCreateListing(){
        $this->redirect('Listings:create');
    }
    
    public function handleDeleteListing($id){
        $this->listings->deleteListing($id);
    }
    
    public function createComponentEditForm(){
          $frm = $this->formFactory->create();
          $frm->addSubmit("submit", "Upravit");
        
          $frm->onSuccess[] = array($this, 'editSuccess');
          $frm->onValidate[] = array($this, 'editValidate');
        
          return $frm;    
    }
    
    private $actualListingValues;
    private $listingImages;
    private $listingID;
    
    public function actionEditListing($id){
                    
        if ($this->listings->getAuthor($id)['author'] !== $this->returnLogin()){
            $this->redirect("Listings:in");
        } else {
           $this->actualListingValues = $this->listings->getActualListingValues($id);
        }
        
        $listingImages = $this->listings->getListingImages($id);

        $imgSession = $this->getSession()->getSection('images');
        $imgSession->listingImages = $listingImages;
        $listingSession = $this->getSession()->getSection('listing');
        $listingSession->listingID = $id;
    }

    public function handleDeleteClick($img){

        $listingID = $this->getSession()->getSection('listing')->listingID;

        $images = $this->listings->getListingImages($listingID);

        $session = $this->getSession();
        $images = $session->getSection('images');
        $images->toDelete = $img;
         
        $this->redirect("Listings:alert");     
    }
    
    public function handleDeleteImage(){

       $session = $this->getSession()->getSection('images');
       $img =  $session->toDelete;
       $listingID = $this->getSession()->getSection('listing')->listingID;

       $imgs = $this->listings->getListingImages($listingID);
       
       unset($imgs[$img]);

       //reindexed array after unset
       $newArray = array();
       
       foreach ($imgs as $image){
           array_push($newArray, $image);
       }
       
       unset($imgs);
       
       //final array - updated - without deleted images to store in db
       $images = serialize($newArray);
       
       $this->listings->updateListingImages($listingID, $images);
       $this->redirect("Listings:editListing", $listingID);
    }
    
    public function handleDeleteAbort(){
        $listingID = $this->getSession()->getSection('listing')->listingID;
        $this->redirect("Listings:editListing", $listingID);
    }
    
    //stores actual listing values into session
    private function setListingSession($id){
        $listingDetails = $this->listings->getActualListingValues($id);
    	$session = $this->getSession()->getSection('listing');
    	$session->listingDetails = $listingDetails;
    }
    
    public function actionView($id){
    	
        $this->setListingSession($id);
    }

    public function actionBuy($id){
        
        $this->setListingSession($id);
    }

    public function createComponentVendorNotesForm(){
        
       $form = $this->vendorNotes->create();
       
       $form->onSuccess[] = array($this, 'vendorNotesSuccess');
       $form->onValidate[] = array($this, 'vendorNotesValidate');
       
       return $form;
    }
    
    public function vendorNotesSuccess($form){
        //redirect user to his order list 
        //after item succesfully bought
        
        $this->flashMessage('Operace proběhla úspěšně.'); 
        $this->redirect('Orders:in');
    }
    
    public function vendorNotesValidate($form){
        
          if ($form['zrusit']->submittedBy) {

          $listingID = $this->getSession()->getSection('listing')->listingDetails->id;   
          $this->redirect('Listings:view', $listingID);
          
          $values = $form->getValues(TRUE);
  
        }

        //is submitted data PGP? method placeholder
        //TODO
    }
    
    public function handleSetMainImage($imgNum){
        $listingID = $this->getSession()->getSection('listing')->listingID;
        
        $this->listings->setListingMainImage($listingID, $imgNum);
    }
    
    public function createComponentBuyForm(){
        $form = new Nette\Application\UI\Form;
        
        $form->addSelect("postage", "Postage options:", array("Stub1", "Stub2"));
        $form->addSelect("quantity", "Product quantity:", array("Stub1", "Stub2"));
        $form->addSubmit("koupit", "Koupit");
        
        $form->onSuccess[] = array($this, 'buyFormOnSuccess');
        
        return $form;
    }
    
    public function buyFormOnSuccess($form){
        $listingID = $this->getSession()->getSection('listing')->listingDetails->id;
        $this->redirect("Listings:Buy", $listingID);
    }
    
    public $id;
    
    public function editSuccess($form){
        $id = $this->actualListingValues['id'];
        $listingID = $this->getSession()->getSection('listing')->listingID;
        $values = $form->getValues();
        
        $form_images = $form->values['image'];
        $imageLocations = array();
        
        foreach ($form_images as $image){
        //get relative path to image for webserver &
        //save relative paths into array
            array_push($imageLocations, substr($image->getTemporaryFile(),
                    strpos($image->getTemporaryFile(), "userfiles/")));     
        }
       
        $existingImages = $this->listings->getListingImages($listingID);
        $new_images = serialize(array_merge($imageLocations, $existingImages));
        
        $this->listings->updateListingImages($listingID, $new_images);    
        $this->listings->editListing($id, $values);
        $this->flashMessage("Listing uspesne upraven!");
        $this->redirect("Listings:editListing", $listingID);
    }
    
    public function editValidate($form){

        $this->formValidateValues($form);
        $images = $form->values['image'];
        $this->imgUpload($images, $form);
    }
    
    public function beforeRender(){
        
        $login = $this->getUser()->getIdentity()->login;
        $id = $this->returnId();

        //query bitcoind, get response
        $btcClient = $this->btcClient;
        $command = new Command('getbalance', $login);             
        $response = $btcClient->sendCommand($command);
        $result = json_decode($response->getBody()->getContents(), true);

        $section =  $this->getSession()->getSection('balance');
        $section->balance = $result['result'];

        //render edit form with actual values from database
        $component_iterator = $this->getComponent("editForm")->getComponents();
        $componenty = iterator_to_array($component_iterator);

        if ($this->actualListingValues != null){

            foreach ($componenty as $comp){
                switch($comp->name){
                    case 'product_name':
                        $comp->setValue($this->actualListingValues['product_name']);
                        break;
                    case 'product_desc':
                        $comp->setValue($this->actualListingValues['product_desc']);
                        break;
                    case 'price':
                        $comp->setValue($this->actualListingValues['price']);
                        break;
                    case 'ships_from':
                        $comp->setValue($this->actualListingValues['ships_from']);
                        break;
                    case 'ships_to';
                        $comp->setValue($this->actualListingValues['ships_to']);
                        break;
                    case 'product_type':
                        $comp->setValue($this->actualListingValues['ships_to']);
                        break;        
                }
            }

        } else {

        }
        
        //send variables to template - depends on actual URL

        $urlPath = $this->URL->path;

        if ($urlPath == "/listings/"){
            $this->template->isVendor = $this->listings->isVendor($id);
            $this->template->listings = $this->listings->getListings($login);    
            $this->template->currentUser = $this->returnLogin();          
        }

        if ( strpos($urlPath, "edit-listing" )|| strpos($urlPath, "view") || strpos($urlPath, "buy")){
            $this->template->listingImages = $this->getSession()->getSection('images')->listingImages;
            $this->template->listingID = $this->getSession()->getSection('listing')->listingID;

            //for single listing view action
            $this->template->listingDetails = $this->getSession()->getSection('listing')->listingDetails;
        }
    }
}
