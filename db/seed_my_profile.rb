# my personnal profile
  options = {
    handle: 'alexb52',
    email: 'barretalexandre@hotmail.com',
    full_name: 'Alexandre Barret',
    bio: 'Nothing much today',
    password: 'cookie',
    gravatar: Faker::Avatar.image
  }
  User.create(options)