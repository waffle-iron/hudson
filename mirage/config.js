import config from 'hudson/config/environment';

export default function() {

   this.post('/login', () => {
    return {user_id: '1', token: 'secret'};
  });
}
