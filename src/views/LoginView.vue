<script lang="ts">
import { defineComponent } from "vue";
import LoginComponent from "../components/Login.vue";

export default defineComponent({
  components: {
    LoginComponent,
  },
});
</script>

<template>
  <div>
    <login-component />
  </div>
</template>

<style scoped></style>
