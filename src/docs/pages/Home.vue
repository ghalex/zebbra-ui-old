<template>
  <HomeLayout>
    <div class="p-12 flex flex-col">
      <div class="border p-3 mb-2">
        <h3>Buttons</h3>
        <div class="grid grid-cols-4 gap-2">
          <ZbButton @click="testClick">Default Buton</ZbButton>
          <ZbButton disabled>Disabled Button</ZbButton>
          <ZbButton class="primary">Primary Button</ZbButton>
          <ZbButton class="danger">danager Button</ZbButton>
        </div>
      </div>

      <div class="border p-3">
        <h3 class="">Checkbox</h3>
        <div class="grid grid-cols-5 gap-2">
          <label class="flex items-center mr-2">
            <ZbCheckbox class="small" />
            Checkobx Small
          </label>
          <label class="flex items-center mr-2">
            <ZbCheckbox v-model="chk" />
            Checkobx 1
          </label>
          <label class="flex items-center mr-2">
            <ZbCheckbox class="primary" />
            Checkobx 2
          </label>
          <ZbCheckbox as="ZbButton" v-slot="{ checked }"> Checked: {{ checked }} </ZbCheckbox>
        </div>
      </div>

      <div class="border p-3 mt-4">
        <h3 class="">Radios</h3>
        <div class="grid grid-cols-2 gap-2">
          <div>
            <label class="flex items-center mr-2 mb-2">
              <ZbRadio value="r1" name="r" class="small" />
              Radio 1
            </label>
            <label class="flex items-center mr-2 mb-2">
              <ZbRadio class="primary" value="r2" name="r" />
              Radio 2
            </label>
            <label class="flex items-center mr-2">
              <ZbRadio class="danger" value="r2" name="r" />
              Radio 3
            </label>
          </div>
          <div class="">
            <ZbRadio
              value="apple"
              class="px-8 min200 rounded-r-none"
              :class="{ 'bg-blue-300': fruite === 'apple' }"
              v-model="fruite"
              as="ZbButton"
            >
              A
            </ZbRadio>
            <ZbRadio
              value="berry"
              class="px-8 min200 rounded-l-none -ml-1"
              :class="{ 'bg-red-300': fruite === 'berry' }"
              v-model="fruite"
              as="ZbButton"
            >
              B
            </ZbRadio>
          </div>
        </div>
      </div>

      <div class="border p-3 mt-4">
        <h3 class="">Dialogs</h3>
        <div class="grid grid-cols-4 gap-2">
          <ZbDialogDisclosure :state="dlg1">Open dialog</ZbDialogDisclosure>
          <ZbDialog :autoClose="false" :state="dlg1">
            <h2 class="border-b-2 border-gray-500 px-2 py-2">Hy! this is a dialog</h2>
            <div class="p-8">
              <ZbButton @click="dlg1.close">Click to close</ZbButton>
            </div>
          </ZbDialog>
          <ZbDialogBackdrop class="bg-purple-200 opacity-30" :state="dlg1" />
        </div>
      </div>

      <div class="border p-3 mt-4">
        <h3 class="">Menus</h3>
        <div class="flex">
          <ZbMenu :state="menu1">
            <ZbMenuButton as="ZbButton" class="flex">
              <span>Open menu</span>
              <svg class="w-5 h-5 ml-2 -mr-1" viewBox="0 0 20 20" fill="currentColor">
                <path
                  fill-rule="evenodd"
                  d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                  clip-rule="evenodd"
                ></path>
              </svg>
            </ZbMenuButton>
            <transition
              enter-active-class="transition duration-100 ease-out"
              enter-from-class="transform scale-95 opacity-0"
              enter-to-class="transform scale-100 opacity-100"
              leave-active-class="transition duration-75 ease-out"
              leave-from-class="transform scale-100 opacity-100"
              leave-to-class="transform scale-95 opacity-0"
            >
              <ZbMenuItems>
                <div class="px-4 py-3 border-b-2 border-gray-500">
                  <p class="text-sm leading-5">Signed in as</p>
                  <p class="text-sm font-medium leading-5 text-gray-400 truncate">tom@example.com</p>
                </div>
                <ZbMenuItem v-slot="{ active }">
                  <a class="p-2 block" :class="{ 'bg-purple-400': active }" @click="() => console.log('cliccc')"
                    >Item 1</a
                  >
                </ZbMenuItem>
                <ZbMenuItem disabled class="p-2"> Item 2</ZbMenuItem>
                <ZbMenuSeparator class="bg-gray-300" />
                <ZbMenuItem class="p-2"> Item 3</ZbMenuItem>
              </ZbMenuItems>
            </transition>
          </ZbMenu>
        </div>
      </div>
    </div>
  </HomeLayout>
</template>

<script lang="ts">
import { defineComponent, ref, watch } from 'vue'
import { HomeLayout } from '@/docs/layouts'
import { useDialog, useMenu } from '@/lib/hooks'

export default defineComponent({
  components: { HomeLayout },
  setup() {
    const margin = { top: 0, right: 0, bottom: 0, left: 0 }
    const chk = ref(true)
    const fruite = ref('apple')
    const dlg1 = useDialog()
    const menu1 = useMenu()

    function testClick() {
      chk.value = false
      dlg1.open()
    }

    watch(chk, () => {
      console.log('chk changed:', chk.value)
    })

    return { margin, chk, fruite, console, dlg1, menu1, testClick }
  }
})
</script>

<style lang="postcss">
.min200 {
  min-width: 200px;
}
</style>
