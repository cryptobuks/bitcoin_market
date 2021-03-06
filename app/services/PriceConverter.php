<?php

namespace App\Services;

use App\Model\Configuration;
use App\Model\Wallet;

/**
 * 
 * @what Currency data getter and converter
 * @author Tomáš Keske a.k.a клустерфцк
 * @copyright 2015-2016
 * 
 */

class PriceConverter {
    
    private $connection, $configuration;
    
    const cryptoCompareAPI = "https://www.cryptocompare.com/api/data/price?";
    const quandlFiatAPI = "https://www.quandl.com/api/v3/datasets/BOE/";     
    const quandlApiKey = "?api_key=c_eQGizpwssh1RUjy8EG"; 
    const CZK = "XUDLBK27";
    
    public function __construct(Configuration $conf){
        $this->connection = curl_init();
        $this->configuration = $conf;
    }
    
    private function request($api, $fiat, $coin = NULL){
        
        $url = "";
        
        if ($api == "cc"){
            $url = self::cryptoCompareAPI . "fsym=". $coin . "&tsyms=". $fiat;
        }
        
        if ($api == "qa"){
            $url = self::quandlFiatAPI . $fiat . self::quandlApiKey;      
        }

        curl_setopt($this->connection, CURLOPT_URL, $url);
        curl_setopt($this->connection, CURLOPT_REFERER, "");
        curl_setopt($this->connection, CURLOPT_USERAGENT, "MozillaXYZ/1.0");
        curl_setopt($this->connection, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($this->connection, CURLOPT_TIMEOUT, 10);
        
        $result = curl_exec($this->connection); 
        
        return json_decode($result); 
    }
	
    public function getBtcToUSD(){
        $req = $this->request("cc", "USD","BTC");
        sleep(2);
        $price = $req->Data[0]->Price;
        
        return $price;
    }
    
    public function getCzkToUSD(){
        
        $data = $this->request("qa", self::CZK);
        $date = $data->dataset->data[0][0];
        $price = $data->dataset->data[0][1];
        
        return $price;
    }
    
    public function getPriceInCZK($btcPrice){
        $usdPerBTC = $this->getBtcToUSD();
        $priceInUSD = $btcPrice * $usdPerBTC;
        $czkPerUSD = $this->getCzkToUSD();
 
        return $priceInUSD * $czkPerUSD;
    }
    
    public function getCommision($price){
        $commPerc = $this->configuration->valueGetter("commision_percentage");
        return ($commPerc / 100) * $price;
    }
    
    public function getCommisioned($price){
        return $price - $this->getCommision($price);
    }
    
    public function getMarketProfit($price){
        return $this->getCommision($price);
    }
    
    public function convertCzkToBTC($czkPrice){
        $usdPerBTC = $this->getBtcToUSD();
        $czkPerUSD = $this->getCzkToUSD();   
        $czkToUSD = $czkPrice / $czkPerUSD;
        
        return $czkToUSD / $usdPerBTC;
    }
    
    public function __destruct(){
        curl_close($this->connection);
    }
}