<template>
  <UFormGroup v-slot="{ error }" label="Email" :error="email && '' " >
    <UInput v-model="email" type="email" placeholder="Enter email" :trailing-icon="error ? 'i-heroicons-exclamation-triangle-20-solid' : undefined" />
  </UFormGroup>
</template>

<script setup lang="ts">
const email = ref('')
</script>