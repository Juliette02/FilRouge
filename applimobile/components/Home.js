import React from 'react';
import { Text, StyleSheet, SafeAreaView, View, Button } from 'react-native';

const Home = ({navigation}) => {

    return (
        <SafeAreaView>
            <View style={styles.fixToText}>
                <View style={styles.button}>
                    <Button
                        title="Aller aux rubriques"
                        color={'white'}
                        onPress={() =>
                            navigation.navigate('RUBRIQUES')
                        }
                    />
                </View>
                <View style={styles.button}>
                    <Button
                        title="Tous les produits"
                        color={'white'}
                        onPress={() =>
                            navigation.navigate('PRODUITS')
                        }
                    />
                </View>
            </View>        
        </SafeAreaView>
    )
}

const styles = StyleSheet.create({
    title: {
        fontSize: 1,
        fontWeight: 'bold',
        color: 'cyan',
    },
    fixToText: {
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    button: {
        backgroundColor: '#00bfff',
        borderWidth: 1,
        borderRadius: 5,
        margin: 15,
    },

});


export { Home }