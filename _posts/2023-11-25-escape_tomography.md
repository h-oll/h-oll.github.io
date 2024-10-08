---
layout: post
title:  "Quantum Programming: Tomography Based Escape Game"
tag:    Lecture
---

# Context
A group of scientists (you) is locked in a quantum lab. There is a
machine in one corner of the lab. It seems to be alive as the
following command seems to trigger a reply `curl
"https://quantum-26481f83aff0.herokuapp.com/"`.

On one desk there is the manual for the machine. You understand it is
a configurable measurement device that can perform any qubit POVM once
a pure state quantum source is connected to it.

One wall is covered with small boxes labelled by a 16-hex number key
--- `xxxxxxxxxxxxxxxx` where `x`s takes values in
`0,...9,a,b,c,d,e,f`. These are the sources than can be connected to
the machine. One has a special label `sandbox`.

The machine has 4 modes `p`, `m`, `n`, `u` that can be selected. The
manual says: 

The `p` mode performs a POVM measurement on a given source
`xxxxxxxxxxxxxxxx`. The outcome is obtained by sending a `POST` request
to `https://quantum-26481f83aff0.herokuapp.com/p/xxxxxxxxxxxxxxxx`,
where the payload is a `JSON` describing the POVM elements.

The following payload defines a POVM with a single element equal to the identity:
```
{ "elements" : 
    [
      [[[1,0],[0,0]],[[0,0],[1,0]]]
    ]
}
```

The response is a `JSON` looking like:
```
{
'error':   None                 | STRING,
'outcome': SINGLE-ELEMENT ARRAY | None  ,
'trial':   INTEGER              | None  ,
}
```

The number in the outcome corresponds to the index of the corresponding POVM element.

Other modes are accessed in the same way. 

- `m` stands for adding a fixed strength depolarizing noise (i.e. the state is replaced with the maximally mixed state with probability `q`)
- `n` stands for adding classical noise on measurement results (i.e. if there are `n` outcomes with probability `1-p` it does not change and with probability `p/(n-1)` it is being sent to any of the other `n-1` outcome.
- `u` is unfortunately covered under some big coffee stains, but you can still see that:
    1. it first performs a unitary on the states produced by the source, 
    2. it will add some low strength depolarizing noise 
    3. it adds the same classical noise on the measurement results as when the selector is on `n`. 

# Challenge 

Your task is to recover the unitary, the strength of the depolarizing noise and the probability `p` for the classical noise... knowing that when you use the `u` mode, it will destroy the source after 100 trials, making it useless for any further experiment. The scientists with broken sources will remain forever in "salle R".

# Additional information

- You might find a way to cheat. Don't hesitate to use it.
- You can partner and team up, but choose your firends wisely as they might use your source to make sure you will not escape.

# Sample code 

For accessing the machine with your source: 

```
import json
import requests

key = 'sandbox'
endpoint = 'p' # 'p', 'm', 'n', 'u'
url = 'http://127.0.0.1:8000/' + endpoint +'/' + key

def get_outcome(url):
    response = requests.post(url, json={
        "elements":[
            # element 1: (real, imaginary),
            # element 2: (real, imaginary),
            # ...
            ([[1,0],[0,0]], [[1,-1],[0,0]]),     # This corresponds to [[1+1j, 0-1j],[0+0j, 0+0j]]
            ([[0,0],[0,1]], [[-1,1],[0,0]])      # This corresponds to [[0-1j, 0+1j],[0+0j, 1+0j]]
            ]
        })
    error = response.json()["error"]
    trial = response.json()["trial"]
    outcome = response.json()["outcome"]
    print("Error: ", error)
    print("Trial: ", trial)
    print("Outcome: ", outcome)

get_outcome(url)
```
