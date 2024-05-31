<template>
<div class="overflow-y-auto p-4">
    <div class = "flex flex-col py-3">
      <div class = "grid grid-cols-4">
          <!-- <button @click = "check">check</button> -->
          <input class = "col-span-2" type="file" @change="handleFileChange">
          <div class = "col-span-2">
            <img  v-if="image" class = "max-w-[200px] max-h-[100px]" :src="image" alt="Image preview" style = "margin: 0 !important;"/>
          </div>
      </div>
      <div class = "item-center py-3 w-[1177px]">
        <UInput v-model = "blog.name" class = "" placeholder="Tên blog" size = "xl"></UInput>
      </div>
      <div class = "item-center py-3 w-[1177px]">
        <UInput v-model = "blog.description" class = "" placeholder="Mô tả" size = "xl"></UInput>
      </div>
    </div>
    <div v-if="editor" class = "nav-button py-3 flex  overflow-x-auto w-[1177px]">
      <button
        @click="editor.chain().focus().toggleBold().run()"
        :disabled="!editor.can().chain().focus().toggleBold().run()"
        :class="{ 'is-active': editor.isActive('bold') }"
      >
        bold
      </button>
      <button
        @click="editor.chain().focus().toggleItalic().run()"
        :disabled="!editor.can().chain().focus().toggleItalic().run()"
        :class="{ 'is-active': editor.isActive('italic') }"
      >
        italic
      </button>
      <button
        @click="editor.chain().focus().toggleStrike().run()"
        :disabled="!editor.can().chain().focus().toggleStrike().run()"
        :class="{ 'is-active': editor.isActive('strike') }"
      >
        strike
      </button>
      <button
        @click="editor.chain().focus().toggleCode().run()"
        :disabled="!editor.can().chain().focus().toggleCode().run()"
        :class="{ 'is-active': editor.isActive('code') }"
      >
        code
      </button>
      <button @click="editor.chain().focus().unsetAllMarks().run()">
        marks
      </button>
      <button @click="editor.chain().focus().clearNodes().run()">
        nodes
      </button>
      <button
        @click="editor.chain().focus().setParagraph().run()"
        :class="{ 'is-active': editor.isActive('paragraph') }"
      >
        paragraph
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 1 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 1 }) }"
      >
        h1
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 2 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 2 }) }"
      >
        h2
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 3 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 3 }) }"
      >
        h3
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 4 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 4 }) }"
      >
        h4
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 5 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 5 }) }"
      >
        h5
      </button>
      <button
        @click="editor.chain().focus().toggleHeading({ level: 6 }).run()"
        :class="{ 'is-active': editor.isActive('heading', { level: 6 }) }"
      >
        h6
      </button>
      <button
        @click="editor.chain().focus().toggleBulletList().run()"
        :class="{ 'is-active': editor.isActive('bulletList') }"
      >
        bullet 
      </button>
      <button
        @click="editor.chain().focus().toggleOrderedList().run()"
        :class="{ 'is-active': editor.isActive('orderedList') }"
      >
        ordered 
      </button>
      <button
        @click="editor.chain().focus().toggleCodeBlock().run()"
        :class="{ 'is-active': editor.isActive('codeBlock') }"
      >
        code 
      </button>
      <button
        @click="editor.chain().focus().toggleBlockquote().run()"
        :class="{ 'is-active': editor.isActive('blockquote') }"
      >
        blockquote
      </button>
      <button @click="editor.chain().focus().setHorizontalRule().run()">
        horizontal 
      </button>
      <button @click="editor.chain().focus().setHardBreak().run()">
        break
      </button>
      <button
        @click="editor.chain().focus().undo().run()"
        :disabled="!editor.can().chain().focus().undo().run()"
      >
        undo
      </button>
      <button
        @click="editor.chain().focus().redo().run()"
        :disabled="!editor.can().chain().focus().redo().run()"
      >
        redo
      </button>
    </div>
    <div class = "py-3 grid grid-cols-3 items-center">
      <div class = "col-span-2">
        <input type="file" id="imageInput" accept="image/*">
        <UButton @click = "addImage()" class = "rounded-lg">Thêm Hình Ảnh</UButton>
      </div>
      <div class="flex justify-end">
        <UButton color = "green" class = "col-span-1 mr-5" @click = "createBlog">Thêm Blog</UButton>
      </div>
        
    </div>
    <TiptapEditorContent :editor="editor" />
</div>
</template>

<script setup>
import Image from '@tiptap/extension-image';
import { useBlogStore } from '~/stores/admin/useBlogStore';

const blogStore = useBlogStore()
const blog = ref({
  name:'',
  description:'',
})

// Biến này sẽ lưu trữ URL để xem trước hình ảnh
const image = ref(null);

function handleFileChange(event) { 
  const file = event.target.files[0];

  if (file) {
    // image.value = URL.createObjectURL(file);
    image.value = "/img/" +file.name;
  }
}
const editor = useEditor({
  content: "",
  extensions: [
    TiptapStarterKit,
    Image.configure({
      HTMLAttributes: {
        class: 'mx-auto',
      },
      }),
  ],
  editorProps: {
    attributes: {
      class: 'p-5  h-[1000px] w-[1177px] flex flex-col ',
    },
  },
});

const createBlog = () => {
  
  const data = {
    image: image.value,
    name:blog.value.name,
    description: blog.value.description,
    content:editor.value.getHTML()
  }
  blogStore.createBlog(data)
}

// const addImage = () => {
//   const url = prompt('URL của hình ảnh:');
//   if (url) {
//     editor.value.commands.setImage({ src: url });
//   }
// };

const addImage = () => {
  const input = document.getElementById('imageInput');
  if (!input.files || input.files.length === 0) {
    alert('Vui lòng chọn một hình ảnh.');
    return;
  }
  const file = input.files[0];
  const reader = new FileReader();

  reader.onload = (e) => {
    // Tạo URL tạm thời từ file
    // const src = URL.createObjectURL(file);
    const src = "/img/" + file.name;
    // Sử dụng lệnh setImage của Tiptap để thêm hình ảnh vào trình soạn thảo
    editor.value.commands.setImage({ src });
  };

  reader.readAsDataURL(file);
};

const check = () => {
  console.log(image.value);
}
onBeforeUnmount(() => {
 unref(editor).destroy();
});
</script>
<style scoped>
button {
  margin-right: 10px;
}
.custom-image {
margin-left:200px !important;
}
img {
  margin: auto !important;
}
.nav-button button {
    height: 30px;
    width:200px !important;
    display: flex;
    
    align-items: center; /* flex-grow, flex-shrink, flex-basis */
    background-color: rgba(255, 255, 255, 0.2);
    color: black;
    border: 2px solid #1d1d1d;
    border-radius: 0.4em;
    text-align: center; /* Đảm bảo văn bản được căn giữa */
    padding: 3px 15px; /* Điều chỉnh khoảng cách bên trong nút */
    box-sizing: border-box; /* Đảm bảo kích thước bao gồm padding và border */
}

.nav-button::-webkit-scrollbar {
    height: 4px; /* Đặt độ cao của thanh cuộn ngang */
}

.nav-button::-webkit-scrollbar-track {
    background: #f1f1f1; /* Màu nền của track thanh cuộn */
}

.nav-button::-webkit-scrollbar-thumb {
    background: #888; /* Màu của thumb thanh cuộn */
}

.nav-button::-webkit-scrollbar-thumb:hover {
    background: #555; /* Màu của thumb khi hover */
}
</style>
