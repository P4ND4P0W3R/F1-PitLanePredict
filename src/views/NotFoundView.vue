<template>
    <div>
        <h1>404 Not Found</h1>
        <p>The page you are looking for does not exist.</p>
        <router-link to="/">Go to Home</router-link>
    </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue';

export default defineComponent({
    name: 'NotFoundView',
});
</script>

<style scoped>
/* Add component-specific styles here if needed */
</style>
