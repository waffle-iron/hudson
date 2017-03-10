export default function() {

   this.get('users', 'user');
   this.get('/pricings', 'pricing');
   this.get('/pricings/:id', 'pricing');
   this.get('/coupons', 'coupon');
   this.get('/coupons/:id', 'coupon');

   this.post('/login', () => {
    return {user_id: '1', token: 'secret'};
  });

   this.post('/check', () => {
    return {user_id: '1', token: 'secret'};
  });

   this.post('/logout', () => {
    return;
  });
}
