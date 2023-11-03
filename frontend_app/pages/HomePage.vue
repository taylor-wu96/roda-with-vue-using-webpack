<template>
  <div class="container">
  
    <h1 class="title">Todo List</h1>  

    <form @submit.prevent="addTodo" class="form">
      <input class="input" type="text" v-model="newTodoText" placeholder="Add todo" required>

      <input class="input" type="datetime-local" v-model="dueDate">
      
      <button class="button">Add</button>
    </form>

    <ul class="todo-list">
      <li v-for="todo in todos" :key="todo.id" class="todo-item">

        <input class="checkbox" type="checkbox" v-model="todo.completed">

        <span :class="{ 'completed': todo.completed }">
          {{ todo.name }}
        </span>

        <span class="due-date">
          {{ todo.due_date }}
        </span>

        <button class="delete-btn" @click="removeTodo(todo)">
          -
        </button>

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
        name: this.newTodoText,
        due_date: this.dueDate || null
      })
      this.todos.push(response.data)
      this.newTodoText = ''
      this.dueDate = ''
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


<style>

/* Material design styles */

.container {
  box-shadow: 0 2px 4px rgba(0,0,0,.1); 
  border-radius: 3px;
  padding: 20px;
  max-width: 500px;
  margin: 50px auto; 
}

.title {
  text-align: center;
  margin-bottom: 30px;
}

.form {
  display: flex;
}

.input {
  border: none;
  border-bottom: 1px solid #ddd;
  padding: 8px;
  font-size: 16px; 
  flex: 1;
  margin-right: 15px;
}

.datetime {
  max-width: 30%;
}

.button {
  border-radius: 4px;
  border: none;
  background: #2196F3;
  color: white;
  text-transform: uppercase;
  letter-spacing: .5px;
  padding: 10px 15px;
  transition: background .3s; 
}

.button:hover {
  background: #1976D2;
  cursor: pointer;
}

/* UI/UX */

.todo-item {
  display: flex; 
  align-items: center;
  justify-content: space-between;
  padding: 15px 0;
  border-bottom: 1px solid #eee; 
}

.todo-details {
  display: flex;
  align-items: center;
}

.checkbox {
  margin-right: 10px;
} 

.completed {
  text-decoration: line-through;
  color: #999;
}

.due-date {
  margin-left: 15px;
  color: #999;
  font-size: 14px;
}

.delete-btn {
  border-radius: 50%;
  border: none;
  background: #F44336;
  color: white;
  width: 32px;
  height: 32px;
  display: flex;
  align-items: center;
  justify-content: center;
  transition: background .3s;
}

.delete-btn:hover {
  background: #D32F2F;
  cursor: pointer; 
}

</style>
