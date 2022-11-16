In C# the `System.Runtime.Serialization` class provides some nice attributes like `[DataContract], [DataMember] and [IgnoreDataMember]` 
to help change/ignore properties' names during the serialization processs. The serialization/Deserialization processes we are talking about here is 
from object to byte and vice versa not Json. With that said, the two popular Json serialization libraries `Newtonsoft.Json` and `System.Text.Json` do respect
the previously mentioned attributes when they do their own serialize/deserialize process from object to json and vice versa. 
