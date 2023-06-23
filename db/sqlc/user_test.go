package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateUser(t *testing.T) {
	arg := CreateUserParams {
		Email: "hr454837@gmail.com",
		// Password: 1111,
		IsAdmin: true,
		IsActive: true,
	}

	user, err := testQueries.CreateUser(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, user)

	require.Equal(t, arg.Email, user.Email)
	// require.Equal(t, arg.Password, user.Password)
	require.Equal(t, arg.IsAdmin, user.IsAdmin)
	require.Equal(t, arg.IsActive, user.IsActive)

	require.NotZero(t, user.ID)
	require.NotZero(t, user.CreatedAt)
}