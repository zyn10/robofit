import openai
openai.api_key = "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" 

# def generate_fitness_plan(gender, height, weight, age, goal, body_part, experience, workout_days, equipment):
#     user_message = f"""
#     1- {gender}
#     2- {height} ft
#     3- {weight} kg
#     4- {age} years
#     5- {goal}
#     6- {body_part}
#     7- {experience}
#     8- {workout_days} days a week
#     9- {equipment}
#     """
    
#     res = openai.ChatCompletion.create(
#         model="gpt-3.5-turbo",
#         messages=[
#             {"role": "system", "content": """
#                 I will provide you with
#                 1- Gender
#                 2- Height
#                 3- Weight
#                 4- Age
#                 5- Goal i.e building muscle or keep fit or lose weight 
#                 6- Parts of the body I want to focus
#                 7- Experience with fitness.
#                 8- How often I can work out.
#                 9- Equipment I have.
#                 You need to give me a plan to achieve my goals by keeping in mind conditions.
#                 """},
#             {"role": "user", "content": user_message}
#         ]
#     )
    
#     return res.choices[0].message['content']




def generate_fitness_plan(gender, height, weight, age, goal, body_part, experience, workout_days, equipment):
    user_message = f"""
    1- {gender}
    2- {height} ft
    3- {weight} kg
    4- {age} years
    5- {goal}
    6- {body_part}
    7- {experience}
    8- {workout_days} times per week
    9- {equipment}
    """
    
    res = openai.ChatCompletion.create(
        model="gpt-3.5-turbo",
        messages=[
            {"role": "system", "content": """
                I will provide you with
                1- Gender
                2- Height
                3- Weight
                4- Age
                5- Goal i.e building muscle or keep fit or lose weight 
                6- Parts of the body I want to focus i.e chest, triceps,lats, biceps,shoulder,abs etc
                7- My Experience with fitness i.e totally newbie, beginner, intermediate, advance etc
                8- How often I can work out i.e times a week.
                9- Equipment I have i.e no equipment, dumbbells,access to full gym etc.
                
                You need to give me a fitness plan to achieve my goals by keeping in mind conditions specified above. and please make sure give plan only for number of days specified.
                """},
            {"role": "user", "content": user_message}
        ]
    )
    
    return res.choices[0].message['content']



def get_user_input(prompt):
    return input(prompt).strip()

# Get user input one by one
gender = get_user_input("Enter your gender (male/female): ")
height = get_user_input("Enter your height (in feet): ")
weight = get_user_input("Enter your weight (in kg): ")
age = get_user_input("Enter your age: ")
goal = get_user_input("Enter your fitness goal (building muscle or keep fit or lose weight ): ")
body_part = get_user_input("Enter the body part you want to focus on (chest, triceps,lats, biceps,shoulder,abs): ")
experience = get_user_input("Enter your experience with fitness (newbie, beginner, intermediate, advance): ")
workout_days = get_user_input("Enter how often you can work out (days a week): ")
equipment = get_user_input("Enter the equipment you have: ")

# Generate fitness plan
user_input = {
    "gender": gender,
    "height": height,
    "weight": weight,
    "age": age,
    "goal": goal,
    "body_part": body_part,
    "experience": experience,
    "workout_days": workout_days,
    "equipment": equipment
}

print("\nGenerating fitness plan ...")
result = generate_fitness_plan(**user_input)
# Mock progress bar for demonstration purposes
print("\n\n*********************************************************************************************\n\n",result)
