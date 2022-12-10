/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import React from 'react';
import { useState, useEffect } from 'react';
import { Rubrique } from './components/rubrique';
import { Text, View, FlatList, SafeAreaView, Button, StyleSheet } from 'react-native';
import { Login } from './components/Login';
import { Produits } from './components/produits';
import { Home } from './components/Home';

const Stack = createNativeStackNavigator();

const App = () => {
  return (
      <NavigationContainer>
        <Stack.Navigator>
          <Stack.Screen
            name="Connexion"
            component={Login}
          />
          <Stack.Screen
            name='RUBRIQUES'
            component={Rubrique}
          />
          <Stack.Screen
            name='PRODUITS'
            component={Produits}
          />
          <Stack.Screen
            name='HOME'
            component={Home}
            options={{ title: 'BLUE VILLAGE' }}
          />
        </Stack.Navigator>
      </NavigationContainer>
  );
};

const styles = StyleSheet.create({
  title: {
    fontSize: 1,
    fontWeight: 'bold',
    color: 'cyan',
  },

});

export default App;
