import React from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import dosenData from '../assets/data/dosen_chat.json';
import { useNavigation } from '@react-navigation/native';

const HomeScreen = () => {
  const navigation = useNavigation();

  const renderItem = ({ item }) => (
    <TouchableOpacity
      style={styles.card}
      onPress={() => navigation.navigate('ChatScreen', { dosen: item })}
    >
      <Text style={styles.name}>{item.name}</Text>
      <Text style={styles.lastMessage}>{item.lastMessage}</Text>
    </TouchableOpacity>
  );

  return (
    <View style={styles.container}>
      <FlatList
        data={dosenData}
        keyExtractor={(item) => item.id.toString()}
        renderItem={renderItem}
      />
    </View>
  );
};

export default HomeScreen;

const styles = StyleSheet.create({
  container: { flex: 1, padding: 16 },
  card: {
    backgroundColor: '#222',
    padding: 12,
    marginBottom: 10,
    borderRadius: 8,
  },
  name: { color: '#fff', fontSize: 18, fontWeight: 'bold' },
  lastMessage: { color: '#aaa', fontSize: 14 },
});
