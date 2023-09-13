import { initializeApp } from "firebase/app";

const firebaseConfig = {
  apiKey: "AIzaSyDWrHOz-7C2r6h6yqhtyY6P2a4T_AGU6dU",
  authDomain: "vnesorses.firebaseapp.com",
  projectId: "vnesorses",
  storageBucket: "vnesorses.appspot.com",
  messagingSenderId: "385261181840",
  appId: "1:385261181840:web:bde1dee04c82f714fa3115",
  measurementId: "G-RCKL6RFQXY"
};

const app = initializeApp(firebaseConfig);
export { app } 
