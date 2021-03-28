<template>
  <div class="home-layout">
    <Navbar />
    <div class="border border-blue-600">
      <slot />
    </div>
  </div>
</template>

<script lang="ts">
import { Navbar } from '@/docs/components'
export default {
  name: 'MainLayout',
  components: { Navbar }
}
</script>

<style lang="postcss" scoped>
.home-layout {
  display: flex;
  align-items: stretch;
  flex-direction: column;
  border: 1px solid red;
}
</style>
