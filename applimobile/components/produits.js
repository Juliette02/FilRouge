import React from 'react';
import { useState, useEffect } from 'react';
import { Text, View, FlatList, SafeAreaView, Button, StyleSheet, StatusBar, Image } from 'react-native';


const Produits = () => {

    const [produits, setProduits] = useState([]);

    const Item = (item) => (
        <View style={styles.item}>
            <Text style={styles.title}>{item.title} | {item.price} € | {item.rubrique}</Text>
        </View>
    )
    

    // const getItem = (data, index) => {
    //     return data[index]
    // };


    useEffect(() => {
        fetch('http://alexis.amorce.org/api/produits')
            .then((response) => response.json())
            .then((responseJson) => setProduits(responseJson["hydra:member"]))
            .then(console.log(produits))
    }, []);

    return (
        <SafeAreaView style={styles.container}>
            <FlatList
                data={produits}
                renderItem={({ item }) => <Item title={item.libelleCourt} key={item.id} price={item.prixAchat} rubrique={item.rubrique}/>}
            />
        </SafeAreaView>
    );

}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        marginTop: StatusBar.currentHeight || 0,
    },
    item: {
        backgroundColor: '#ffff',
        padding: 10,
        marginVertical: 8,
        marginHorizontal: 16,
        borderRadius: 15,
        borderWidth: 1,
    },
    title: {
        fontSize: 15,
        fontWeight: 'bold',
        color: 'cyan',
    },
});

export { Produits }; 