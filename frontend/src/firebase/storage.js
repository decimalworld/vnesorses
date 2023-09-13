import { 
  getStorage, 
  ref, 
  uploadBytes,
  getDownloadURL
} from "firebase/storage";
import { v4 as uuid } from 'uuid';
import { app } from "./app";

const storage = getStorage(app);
const uploadFile = async (dir, file) => {
  const fileName = new Date().getTime() + uuid();
  const storageRef = ref(storage, `${dir}/${fileName}`);
  await uploadBytes(storageRef, file);
  return storageRef;
} 
export { storage, ref, uploadBytes, getDownloadURL, uploadFile };
