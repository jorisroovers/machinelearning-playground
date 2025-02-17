<template>
  <div id="app">
    <h1>Langchain ChatGPT-like App</h1>
    <div class="chat-container">
      <div class="chat-output">
        <div v-for="(message, index) in messages" :key="index" class="chat-message">
          <span class="user-input">{{ message.user_input }}</span>
          <span class="response">{{ message.response }}</span>
        </div>
      </div>
      <div class="chat-input">
        <input v-model="userInput" @keyup.enter="sendMessage" placeholder="Type your message here..." />
        <button @click="sendMessage">Send</button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      userInput: '',
      messages: []
    };
  },
  methods: {
    async sendMessage() {
      if (this.userInput.trim() === '') return;

      const userMessage = {
        user_input: this.userInput,
        response: ''
      };
      this.messages.push(userMessage);

      try {
        const response = await fetch('http://localhost:8000/chat', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({ user_input: this.userInput })
        });
        const data = await response.json();
        userMessage.response = data.response;
      } catch (error) {
        userMessage.response = 'Error: Unable to fetch response';
      }

      this.userInput = '';
    }
  }
};
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}

.chat-container {
  display: flex;
  flex-direction: column;
  align-items: center;
}

.chat-output {
  width: 80%;
  max-height: 400px;
  overflow-y: auto;
  border: 1px solid #ccc;
  padding: 10px;
  margin-bottom: 20px;
}

.chat-message {
  display: flex;
  flex-direction: column;
  margin-bottom: 10px;
}

.user-input {
  font-weight: bold;
}

.response {
  margin-left: 10px;
  color: #555;
}

.chat-input {
  display: flex;
  width: 80%;
}

.chat-input input {
  flex: 1;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 4px;
}

.chat-input button {
  padding: 10px 20px;
  margin-left: 10px;
  border: none;
  background-color: #42b983;
  color: white;
  border-radius: 4px;
  cursor: pointer;
}

.chat-input button:hover {
  background-color: #369f6b;
}
</style>
