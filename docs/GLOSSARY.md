# Glossary

Key terms used throughout the manuscript, defined for consistency across chapters.

## AGI

Artificial General Intelligence. A machine intelligence system capable of learning and performing any intellectual task that a human can perform. No AGI yet exists; current AI systems (as of 2026) are narrow — they excel at specific tasks (image recognition, language generation) but cannot transfer knowledge across domains.

## Alignment

The challenge of ensuring an AI system's goals match the goals of its creators and users. A misaligned AI might optimize for a stated objective in ways that harm human welfare. For example, an AI tasked with maximizing a company's revenue might achieve it through fraud if not constrained by other rules.

## Automation

The use of machines or software to perform tasks previously done by humans, with minimal human intervention. Automation reduces labour cost and increases consistency but narrows the range of work available to human workers. The speed of automation varies by task type: routine clerical work automated faster than skilled diagnosis.

## Fine-tuning

The process of retraining a pre-trained AI model on a smaller dataset specific to a new task. An AI trained on billions of words can be fine-tuned on medical texts to specialize in diagnosis, or on legal documents to specialize in contract analysis. Fine-tuning is cheaper and faster than training from scratch.

## Inference

The act of using a trained AI model to generate predictions or outputs on new data. Inference is distinct from training: training costs time and money up front; inference costs compute per query. An LLM performing inference is answering your question; during training, it learned patterns from its training data.

## LLM

Large Language Model. An AI system trained on vast amounts of text to predict the next word in a sequence. LLMs like GPT-4 and Claude can generate coherent prose, answer questions, write code, and translate languages. They do not understand meaning the way humans do; they recognize statistical patterns in text.

## Prompt Engineering

The practice of crafting input text (a "prompt") to elicit better outputs from an AI model. A well-engineered prompt specifies context, constraints, and desired output format. For example: "Summarize this article in three bullet points" is more useful than "Summarize this article," because it constrains the output format.

## Reinforcement Learning from Human Feedback

A training technique where humans rate or rank AI model outputs (good vs. bad) and the model learns to produce outputs humans prefer. This technique is used to reduce harmful outputs and align model behaviour with human values. RLHF is computationally expensive and requires human raters, so it is typically applied only after initial training.

## Transformer

The neural network architecture underlying most modern AI systems, including LLMs. Transformers process text in parallel (unlike older sequential models) and use "attention" mechanisms to identify which parts of the input are relevant to each part of the output. The architecture was introduced in 2017 and has become dominant.

## Zero-shot Learning

The ability of an AI model to perform a task without any training examples of that specific task. A pre-trained LLM can answer questions, write code, and summarize text even though it was not explicitly trained on those tasks. Zero-shot performance is often poor, but it allows rapid adaptation to new domains.

