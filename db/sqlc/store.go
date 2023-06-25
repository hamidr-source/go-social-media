package db

import (
	"context"
	"database/sql"
	"fmt"
)

type Store struct {
	*Queries
	db *sql.DB
}

func NewStore(db *sql.DB) *Store {
	return &Store {
		db: db,
		Queries: New(db),
	}
}

func (store *Store) execTx(ctx context.Context, fn func(*Queries) error) error {
	tx, err := store.db.BeginTx(ctx, nil)
	if err != nil {
		return err
	} 

	q := New(tx)
	err = fn(q)
	if err != nil {
		if rbErr := tx.Rollback(); rbErr != nil {
			return fmt.Errorf("tx err: %v, rb err: %v", err, rbErr)
		}
		return err

	}

	return tx.Commit()
}

type SubscriptionTxParams struct {
	Subscriber 	 int32 `json:"subscriber"`
	Target 		 int32 `json:"target"`	
}

type SubscriptionTxResult struct {
	Subscription 	Subscription `json:"subscription"`
	Subscriber 		User `json:"subscriber"`
	Target 			User `json:"target"`
}

// func (store *Store) SubscriptionTx(ctx context.Context, arg SubscriptionTxParams) (SubscriptionTxResult, error) {
	
// }