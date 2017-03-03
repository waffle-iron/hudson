export default function() {

   this.get('users/:id', 'user');

   this.post('/login', () => {
    return {user_id: '1', token: 'secret'};
  });

   this.post('/check', () => {
    return {user_id: '1', token: 'secret'};
  });
}
