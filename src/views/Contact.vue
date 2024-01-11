<template>
    <div class="container mt-3">
        <h2>Contact Us</h2>
        <form @submit.prevent="submitForm">
            <div class="row">
                <div class="col-6 form-group">
                    <label for="name">Name:</label>
                    <input type="text" class="form-control" v-model="formData.name">
                </div>
                <div class="col-6 form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" v-model="formData.email">
                </div>
            </div>
            <div class="form-group">
                <label for="message">Message:</label>
                <textarea class="form-control" v-model="formData.message" rows="4"></textarea>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <Alert v-if="showAlert" :type="alertType" :message="alertMessage" />
        </form>
    </div>
</template>
  
<script>
import Alert from '@/components/Alert.vue';
export default {
    name: 'Contact',
    components: {
        Alert,
    },
    data() {
        return {
            formData: {
                name: '',
                email: '',
                message: '',
            },
            showAlert: false,
            alertType: '',
            alertMessage: '',
        };
    },
    methods: {
        displayAlert(type, message) {
            this.showAlert = true;
            this.alertType = type;
            this.alertMessage = message;

        },
        submitForm() {
            if (this.formData.name === '' || this.formData.email === '' || this.formData.message === '') {
                this.displayAlert('danger', 'Please fill out all fields.');
                return;
            } else {
                this.displayAlert('success', 'Your message has been sent.');
                this.formData.name = '';
                this.formData.email = '';
                this.formData.message = '';
            }
        },
    },
};
</script>
  
<style scoped>
.container {
    border-radius: 10px;
    border: 1px solid #e6e6e6;
    padding: 20px;
    margin: auto;
}
</style>
  