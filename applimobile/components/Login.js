import React from 'react';
import { useState, useEffect } from 'react';
import { Text, View, FlatList, SafeAreaView, Button, StyleSheet, TextInput, TouchableOpacity } from 'react-native';





const Login = ({ navigation }) => {

    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    return (
        <SafeAreaView style={styles.container}>
            <View style={styles.page}>
                <View style={styles.inputView}>
                    <TextInput
                        style={styles.TextInput}
                        placeholder='Email'
                        placeholderTextColor="black"
                        onChangeText={(email) => setEmail(email)}
                    />
                </View>
                <View style={styles.inputView}>
                    <TextInput
                        style={styles.TextInput}
                        placeholder='Mot de passe'
                        placeholderTextColor="black"
                        secureTextEntry={true}
                        onChangeText={(password) => setPassword(password)}
                    />
                </View>
                <View style={styles.loginBtn}>
                    <TouchableOpacity onPress={() => {
                        navigation.navigate('HOME')
                    }}>
                        <Text>Connexion</Text>
                    </TouchableOpacity>
                </View>
                <View style={styles.forgot_button}>
                    <TouchableOpacity>
                        <Text>Mot de passe oublié ?</Text>
                    </TouchableOpacity>
                </View>
            </View>
        </SafeAreaView>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: "#fff",
        justifyContent: 'center',
    },
    page: {
        alignItems: "center",
        justifyContent: "center",
        backgroundColor: 'white',
        marginHorizontal: 16,
        borderRadius: 5,
        margin: 15,
        padding: 20,
    },
    loginBtn: {
        width: '80%',
        borderRadius: 25,
        height: 50,
        alignItems: 'center',
        justifyContent: 'center',
        backgroundColor: "cyan",
    },
    forgot_button: {
        height: 30,
        marginBottom: 30,
        marginTop: 20,
    },
    TextInput: {
        height: 50,
        flex: 1,
        padding: 10,
        marginLeft: 20,
    },
    inputView: {
        backgroundColor: "lightgray",
        borderRadius: 30,
        width: '70%',
        height: 45,
        marginBottom:30,
        alignItems: "center",
    }
});

export { Login };
