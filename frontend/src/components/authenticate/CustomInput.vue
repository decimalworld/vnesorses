<template>
<input 
  class="text-input" 
  :type="inputType" 
  :placeholder="placeholder" 
  :value="inputModel"
  @input="$emit('update:inputModel', $event.target.value)"
>
</template>

<script>
export default {
  name: "customeInput",
  props: {
    inputModel: String,
    inputType: String,
    placeholder: {
      default: "",
      type: String
    }
  }
}
</script>

<style>
.text-input {
  height: 50px;
  width: 80%;
  margin: 0 10%;
  padding: 0 15px;
  border-radius: 5px;
  border: 1px solid #ccc;
  font-size: 18px;
  box-sizing: border-box;
}
</style>
