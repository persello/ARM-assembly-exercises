unsigned int isprime(unsigned int x) {
    if (x <= 1)
        return 0; // zero and one are not prime
    
    unsigned int i;
    for (i = 2; i * i <= x; i++)
    {
        if (x % i == 0)
            return 0;
    }

    return 1;
}