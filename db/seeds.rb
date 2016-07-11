# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.destroy_all
Company.destroy_all
Project.destroy_all
Projectfile.destroy_all
Job.destroy_all

s0 = Student.create(
    first_name: "The",
    last_name: "Master",
    nick_name: "admin",
    rank: "Master",
    
    semester: "S100",
    field_meca: true,
    field_elec: true,
    field_info: true,
    description: "I am your Master, Obey !",
    email: "admin@enib.fr",
    phone: "3630",
    secu_number: "",
    rib: "",
    admin: true,
    password: "master",
    password_confirmation: "master"
)

s1 = Student.create(
    first_name: "Julien",
    last_name: "Laffont",
    nick_name: "Duracell",
    rank: "prez",
    
    semester: "S5",
    field_meca: true,
    field_elec: true,
    field_info: true,
    description: "Coucou",
    email: "j4laffon@enib.fr",
    phone: "0606060606",
    secu_number: "123456789",
    rib: "1AE2",
    admin: true,
    password: "duracell",
    password_confirmation: "duracell"
)

s2 = Student.create(
    first_name: "John",
    last_name: "Smith",
    nick_name: "Doc",
    rank: "minion",
    
    semester: "S0",
    description: "Pouet",
    email: "3enib@enib.fr",
    phone: "",
    secu_number: "00000000",
    rib: "000",
    admin: false,
    password: "johnsmith",
    password_confirmation: "johnsmith"
)

c0 = Company.create(
    name: "Skynet",
    picture: "documents/companies/1/avatar.png",
    description: "Building better worlds. :)",
    field_meca: true,
    field_elec: true,
    field_info: true,
    address: "Future",
    email: "contact@sky.net",
    siret: "1234567890",
    hidden: false,
    password: "skynet",
    password_confirmation: "skynet"
)

c1 = Company.create(
    name: "Horizon Ingénieurs",
    picture: "documents/logo_big.jpg",
    description: "C'est nous !",
    field_meca: true,
    field_elec: true,
    field_info: true,
    address: "Parvis Blaise Pascal, 29280 Plouzané",
    email: "3enib@enib.fr",
    siret: "1234567890",
    hidden: true,
    password: "horizon",
    password_confirmation: "horizon"
)

p0 = Project.create(
    company_id: c0.id,
    name: "t8000",
    fields: "meca elec info",
    description: "Intelligent robot that looks like Schwarzy.",
    state: "validated",
    end_date: Date.new(3000,12,1)
)

j0 = Job.create(
    project_id: p0.id,
    student_id: s2.id,
    name: "Project Head",
    description: "Manages the project."
)

f0 = Projectfile.create(
    project_id: p0.id,
    name: "Design goal",
    description: "The robot MUST look like Schwarzy !",
    path: "documents/companies/1/projects/t8000/t8000.png",
    mime_type: "png",
    size: 1024
)

f1 = Projectfile.create(
    project_id: p0.id,
    name: "Cahier des charges",
    description: "little pdf",
    path: "documents/companies/1/projects/t8000/cdc.pdf",
    mime_type: "pdf",
    size: 1048576
)