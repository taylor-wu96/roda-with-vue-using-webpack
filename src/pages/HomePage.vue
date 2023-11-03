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
        <button @click="removeTodo(todo)">Remove</button>
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
      this.fetchTodos()
    },
    async removeTodo(todo) {
    await axios.delete(`/todos/${todo.id}`)
    this.todos = this.todos.filter(t => t.id !== todo.id)
    },
    
    async fetchTodos() {
      const response = await axios.get('/todos')
      this.todos = response.data.data.map(todo => todo.data.attributes)  
    }
  },
  
  created() {
    this.fetchTodos()
  }
}
</script>
