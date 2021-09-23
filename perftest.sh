host="fabmedical-oct.documents.azure.com"
username="fabmedical-oct"
password=b8yg6NVA2mD2fhZvk1B4oEuiXuNNBRVuflYmI1TnUxsvFea5YbIAuHtRqU56IraqdtBHmkL6ad3aEavZp96O9w==
dbname="contentdb"
port="10255"

for i in {1..250}; do
    mongo $host:$port/$dbname \
        -u $username -p $password \
        --ssl --sslAllowInvalidCertificates \
        --eval 'db.sessions.insert({"title":"Perf Test"})' &
done
