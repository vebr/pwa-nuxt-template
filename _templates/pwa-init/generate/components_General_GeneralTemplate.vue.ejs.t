---
to: components/General/GeneralTemplate.vue
---
<template>
  <div v-bind="$attrs" @click="activeMenu ? (activeMenu = false) : ''">
    <div
      :class="
        activeSinglePage && footer
          ? 'single-page footer'
          : activeSinglePage
          ? ' single-page'
          : footer
          ? 'footer'
          : ' ' + { 'full-white': fullWhite, 'no-nav': hideNav }
      "
      class="full-page"
    >
      <app-bar v-if="!activeSinglePage" :logo="QoalaLogo" right-component>
        <Row v-if="!isLogin" style="width: 100%;" justify="flex-end">
          <q-button
            v-if="isHomePage"
            style="height: 26px; margin-left: 10px; padding: 4px;"
            variant="outline-primary"
            @click="topbarAction('login')"
          >Login</q-button>
          <q-button
            v-if="isHomePage || $route.path.indexOf('account') >= 0"
            :style="$route.path.indexOf('account') >= 0 ? 'width: 50%;' : false"
            style="height: 26px; margin-left: 10px; padding: 4px;"
            @click="topbarAction('register')"
          >Register</q-button>
        </Row>
      </app-bar>
      <app-bar-navigation
        v-if="activeSinglePage"
        :background-color="backgroundColor"
        :logo="QoalaLogo"
        :title="titleStat"
        :is-white="isWhite"
        @back="handleBack"
        @right="handleRightClick"
        :rightComponent="rightComponent"
      />
      <general-navigation v-if="!hideNav" :active-menu="activeMenu" :content="content" />
      <div class="content-container">
        <tool-loader v-if="onLoading" :is-loading="onLoading" />
        <slot />
      </div>
    </div>
  </div>
</template>

<script>
import isEmpty from "lodash/isEmpty";
import { AppBar, AppBarNavigation, Button as QButton, Row } from "@qoala/ui";
import GeneralNavigation from "@/components/General/GeneralNavigation";
import ToolLoader from "@/components/tool/ToolLoader";
import QoalaLogo from "@/assets/icons/Logo";

export default {
  name: "GeneralTemplate",

  components: {
    AppBar,
    AppBarNavigation,
    GeneralNavigation,
    ToolLoader,
    QButton,
    Row
  },

  props: {
    content: {
      type: Object
    },
    fullWhite: {
      type: Boolean,
      default: false
    },
    activeSinglePage: {
      type: Boolean,
      default: false
    },
    titleStat: {
      type: String,
      default: "Qoala"
    },
    handleBack: {
      type: Function,
      default: () => {
        window.history.back();
      }
    },
    isWhite: {
      type: Boolean,
      default: true
    },
    backgroundColor: {
      type: String,
      default: ""
    },
    hideNav: {
      type: Boolean,
      default: false
    },
    rightComponent: {
      type: Object,
      default: () => {}
    },
    footer: {
      type: Boolean,
      default: false
    }
  },

  data() {
    return {
      activeMenu: false,
      // menuHide: backIcon,
      QoalaLogo
    };
  },
  computed: {
    isHomePage() {
      const path = "home";
      const activePath = this.$route.path;
      if (activePath.indexOf(path) >= 0) {
        return true;
      }
      return false;
    },
    isLogin() {
      const token = this.$store.getters["user/getUserToken"];
      if (isEmpty(token)) {
        return false;
      }
      return true;
    },
    onLoading() {
      return this.$store.getters["general/getLoadingStatus"];
    }
  },
  methods: {
    handleRightClick() {
      this.$emit("open-modal-shared");
    }
  }
};
</script>

<style lang="scss" scoped>
.full-page {
  padding: 48px 0 60px;
  width: 100%;
  min-height: 100vh;
  position: relative;
  left: 0;
  overflow-x: hidden;
  transition: left 0.5s;
}

.full-page.active {
  // left: 25%;
  overflow-x: hidden;
  pointer-events: none;
}
.single-page {
  overflow-x: hidden;
  padding: 56px 0 0 !important;
  height: 100vh;
}

.content-container {
  overflow-x: hidden;
  overflow-y: auto;
  margin: 0 auto;
  max-width: 480px;
  height: 100%;
  -webkit-overflow-scrolling: touch;
}
.footer {
  height: calc(100vh - 55px);
}
</style>
