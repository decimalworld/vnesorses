<template>
  <div class="footer">
    <div class="nav-and-contact">
      <Navigation class="navigation"/>
      <Contact class="contact"/>
    </div>
    <Branding/>
  </div>
</template>

<script>
import Branding from './branding/Branding.vue';
import Navigation from './Navigation.vue';
import Contact from './Contact.vue';
export default {
  name: "Footer",
  components: { 
    Branding,
    Navigation,
    Contact,
  },
}
</script>

<style lang="scss" scoped>
.footer {
  border-top: 5px solid #eee;
  height: 470px;
  width: 100%;
  margin: 0 3px;
  margin-top: 10px;
  display: flex;
  flex-direction: column;
  .nav-and-contact {
    width: 100%;
    height: auto;
    margin-top: 15px;
    margin-bottom: 23px;
    display: flex;
    .navigation {
      height: 270px;
      width: 76%;
      display: grid;
      grid-template-columns: repeat(5, 1fr);
    }
    .contact {
      margin: 0 5px;
      width: 24%;
      height: 100%;
    }
  }
}
</style>
