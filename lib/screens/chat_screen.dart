import React, { useState, useRef } from 'react';
import {
  View,
  Text,
  FlatList,
  TextInput,
  Button,
  StyleSheet,
  KeyboardAvoidingView,
  Platform,
} from 'react-native';

const ChatScreen = ({ route }) => {
  const { dosen } = route.params;
  const [messages, setMessages] = useState(dosen.messages);
  const [input, setInput] = useState('');
  const flatListRef = useRef();

  const handleSend = () => {
    if (input.trim() !== '') {
      const newMsg = { sender: 'mahasiswa', text: input.trim() };
      setMessages([...messages, newMsg]);
      setInput('');
      // Scroll ke bawah akan otomatis lewat onContentSizeChange
    }
  };

  const renderItem = ({ item }) => (
    <View
      style={[
        styles.chatBubble,
        {
          alignSelf: item.sender === 'mahasiswa' ? 'flex-end' : 'flex-start',
          backgroundColor: item.sender === 'mahasiswa' ? '#00C2CB' : '#444',
        },
      ]}
    >
      <Text style={styles.chatText}>{item.text}</Text>
    </View>
  );

  return (
    <KeyboardAvoidingView
      style={{ flex: 1 }}
      behavior={Platform.OS === 'ios' ? 'padding' : undefined}
      keyboardVerticalOffset={90}
    >
      <View style={styles.container}>
        <FlatList
          ref={flatListRef}
          data={messages}
          keyExtractor={(_, index) => index.toString()}
          renderItem={renderItem}
          onContentSizeChange={() =>
            flatListRef.current?.scrollToEnd({ animated: true })
          }
          onLayout={() => flatListRef.current?.scrollToEnd({ animated: true })}
        />
        <View style={styles.inputContainer}>
          <TextInput
            style={styles.input}
            placeholder="Ketik pesan..."
            value={input}
            onChangeText={setInput}
            onSubmitEditing={handleSend}
            returnKeyType="send"
          />
          <Button title="Kirim" onPress={handleSend} />
        </View>
      </View>
    </KeyboardAvoidingView>
  );
};

export default ChatScreen;

const styles = StyleSheet.create({
  container: { flex: 1, padding: 10, backgroundColor: '#121212' },
  chatBubble: {
    marginVertical: 5,
    padding: 10,
    borderRadius: 10,
    maxWidth: '80%',
  },
  chatText: { color: '#fff' },
  inputContainer: {
    flexDirection: 'row',
    alignItems: 'center',
    paddingHorizontal: 10,
    paddingVertical: 5,
    backgroundColor: '#1f1f1f',
  },
  input: {
    flex: 1,
    backgroundColor: '#333',
    color: '#fff',
    borderRadius: 5,
    paddingHorizontal: 10,
    marginRight: 10,
  },
});
