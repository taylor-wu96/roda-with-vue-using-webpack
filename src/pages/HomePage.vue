<template>
  <div>
    <h1>Todo List</h1>
    
    <form @submit.prevent="addTodo">
      <input v-model="newTodoText" placeholder="Add todo">
      <button>Add</button>
    </form>
    
    <ul>
      <li v-for="todo in todos" :key="todo.id">
        <input type="checkbox" v-model="todo.completed">
        {{ todo.name }}
      </li>  
    </ul>

  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      newTodoText: '',
      todos: []
    }
  },
  methods: {
    async addTodo() {
      const response = await axios.post('/todos', {
        name: this.newTodoText
      })
      this.todos.push(response.data)
      this.newTodoText = ''
    },
    
    async fetchTodos() {
      const response = await axios.get('/todos')
      console.log('response',response.data.data)
      console.log('response2',response.data)
      console.log('response3',response.data.data[0])
      this.todos = response.data.data[0]
    }
  },
  
  created() {
    this.fetchTodos()
  }
}
</script>
