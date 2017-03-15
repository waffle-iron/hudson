export default function() {

   this.get('users', 'user');
   this.get('users/:id', 'user');
   this.get('/pricings', 'pricing');
   this.get('/pricings/:id', 'pricing');
   this.get('/coupons', 'coupon');
   this.get('/coupons/:id', 'coupon');
   this.get('/files', 'file');
   this.get('/invoices', 'invoice');

   this.post('/login', () => {
    return {user_id: '1', token: 'secret'};
   });

   this.post('/check', () => {
    return {user_id: '1', token: 'secret'};
   });

   this.post('/logout', () => {
    return;
   });

   this.post('/users', () => {
    return;
   });

   this.post('/add_user', () => {
    return;
   });

   this.post('/add_pricing', () => {
    return;
   });

   this.post('/add_coupon', () => {
    return;
   });

   this.delete('/delete_user', () => {
    return;
   });

   this.delete('/delete_pricing', () => {
    return;
   });

   this.delete('/delete_coupon', () => {
    return;
   });
}
