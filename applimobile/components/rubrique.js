import React from 'react';
import { useState, useEffect } from 'react';
import { Text, View, FlatList, SafeAreaView, Button, StyleSheet, StatusBar } from 'react-native';

const Rubrique = () => {

    const [rubriques, setRubriques] = useState([]);

    const Item = (item) => (
        <View style={styles.item}>
            <Text style={styles.title}>{item.title}</Text>
        </View>
    )

    useEffect(() => {
        fetch('http://alexis.amorce.org/api/rubriques')
        .then( (response) => response.json() )
        .then( (data) => setRubriques(data["hydra:member"]))
        .catch(function(error) {
            console.log('There has been a problem with your fetch operation: ' + error.message);
             // ADD THIS THROW error
              throw error;
    })
    }, [])

    console.log(rubriques);

    return(
        <SafeAreaView>
            <FlatList
                data={rubriques}
                renderItem={({ item }) => <Item title={item.type} key={item.id}/>}
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
        },
        title: {
            fontSize: 20,
            fontWeight: 'bold',
            color: 'cyan',
        },
    });
export { Rubrique }; 