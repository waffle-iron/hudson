export default function() {

   this.get('users', 'user');

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
