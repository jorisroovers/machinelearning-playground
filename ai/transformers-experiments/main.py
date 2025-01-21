from transformers import pipeline, GPT2LMHeadModel, GPT2Tokenizer, AutoTokenizer, AutoModelForCausalLM


def experiment1():

    # Load a pre-trained model and tokenizer for text generation
    generator = pipeline('text-generation', model='gpt2')

    # Generate text based on a prompt
    prompt = "Once upon a time"
    generated_text = generator(prompt, max_length=50, num_return_sequences=1)

    # Print the generated text
    print(generated_text[0]['generated_text'])

def experiment2():

    # Load a specific model and tokenizer for text generation

    model_name = 'gpt2'
    model = GPT2LMHeadModel.from_pretrained(model_name)
    tokenizer = GPT2Tokenizer.from_pretrained(model_name)

    # Encode the prompt and generate text
    prompt = "In a galaxy far, far away"
    inputs = tokenizer.encode(prompt, return_tensors='pt')
    outputs = model.generate(inputs, max_length=50, num_return_sequences=1)q

    # Decode and print the generated text
    generated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)
    print(generated_text)


def experiment3():

    # Load a model and tokenizer using Auto classes
    # There's a few benefits: you don't need to specify the model class, and you can use the same code for different models
    model_name = 'gpt2'
    tokenizer = AutoTokenizer.from_pretrained(model_name)
    model = AutoModelForCausalLM.from_pretrained(model_name)

    # Encode the prompt and generate text
    prompt = "Deep in the forest"
    inputs = tokenizer.encode(prompt, return_tensors='pt')
    outputs = model.generate(inputs, max_length=50, num_return_sequences=1)

    # Decode and print the generated text
    generated_text = tokenizer.decode(outputs[0], skip_special_tokens=True)
    print(generated_text)


if __name__ == '__main__':
    # experiment1()
    # experiment2()
    experiment3()

