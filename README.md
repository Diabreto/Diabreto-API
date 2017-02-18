# Readme

####Register user

- POST /api/users
- Body example:
```
{
	"user": {
		"email": "olaaaaa@oale.com",
		"password": "asdasasad",
		"username": "olla"
	}
}
```

####Login user

- POST /api/users/sign_in
- Body example:
```
{
	"user": {
		"email": "olaaaaa@asfasoale.com",
		"password": "asdasasad"
	}
}
```

####Login user

- PUT /api/users/\<id\>
- Body example:
```
{
	"full_name": "Ola ole",
	"glycemia_unit": 0,
	"carbohydrates_to_unit": 1,
	"glycemia_target": 100,
	"insulin_to_unit": 1,
	"correction_factor": 2,
	"hyperglycemia_threshold": 130,
	"hypoglycemia_threshold": 20 
}
```
