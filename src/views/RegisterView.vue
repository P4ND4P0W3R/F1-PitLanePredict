<script lang="ts">
import { defineComponent } from 'vue';
import RegisterComponent from '../components/Register.vue';

export default defineComponent({
    components: {
        RegisterComponent,
    },
});
</script>

<template>
    <div>
        <register-component />
    </div>
</template>

<style scoped>
/* Add view-specific styles here if needed */
</style>
