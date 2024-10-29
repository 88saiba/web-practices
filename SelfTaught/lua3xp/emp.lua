local function run_command(command)
    os.execute(command)
end

local function start_services()
    os.execute("clear")
    print("Starting Nginx and MySQL...")
    print("--------------------------------->")
    run_command("sudo systemctl enable nginx mysql.service")
    run_command("sudo systemctl start nginx mysql.service")
    print("---------------------------------")
    run_command("sudo systemctl status nginx.service")
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")
end

local function stop_services()
    os.execute("clear")
    print("Stopping Nginx and MySQL...")
    print("--------------------------------->")
    run_command("sudo systemctl stop nginx.service")
    run_command("sudo systemctl disable nginx.service")
    print("---------------------------------")
    run_command("sudo systemctl status nginx.service")
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")
end

local function sites_enable_nginx()
    os.execute("clear")
    print("Checking Sites-Enable Config...")
    print("---------------------------------")
    os.execute("sleep 0.5")
    run_command("ls -all /etc/nginx/sites-enabled")
    os.execute("sleep 0.5")
    print("\nChecking Preps...")
    print("---------------------------------")
    run_command("sudo nginx -t")
    print("---------------------------------")
    print(" ")
    
    while true do
        io.write("\27[F Press 'q' to go back to menu: ")
        local sub_choice = io.read()  -- Waits for input

        if sub_choice == 'q' then
            break
        else
            print("\27[F Invalid, Please Try Again....")
            os.execute("sleep 0.7")
        end
    end
end

local function check_services()
    os.execute("clear")
    print("Checking Nginx and MySQL...")
    os.execute("sleep 1.7")
    print("---------------------------------")
    run_command("sudo systemctl status nginx")
    os.execute("sleep 0.8")
    print("---------------------------------")
    run_command("sudo systemctl status mysql")
end

local function monitor_nginx()
    os.execute("clear")
    print("Monitoring Nginx...")
    os.execute("sleep 1")
    run_command("sudo multitail /var/log/nginx/access.log /var/log/nginx/error.log")
end

local function main()
    while true do
        os.execute("clear")
        print("+===========+")
        print("Nginx, Mysql, Php")
        print("-------------")
        print("EMP-Menu")
        print("+===========+")
        print("1. Turn On Engine")
        print("2. Turn Off Engine")
        print("3. Check Preps")
        print("4. Check Engine")
        print("5. View Logs")
        print("0. Bail Out")
        print("-------------")
        print("Always press 'q' to back menu")
        print("+===========+")

        io.write("Choose an option (1/2/3/4/5/0): ")
        local choice = io.read()

        if choice == '1' then
            start_services()
        elseif choice == '2' then
            stop_services()
        elseif choice == '3' then
            sites_enable_nginx()
        elseif choice == '4' then
            check_services()
        elseif choice == '5' then
            monitor_nginx()
        elseif choice == '0' then
            print("Exiting the program.")
            os.execute("sleep 0.4")
            os.execute("clear")
            break
        else
            print("Invalid choice. Please try again.")
            os.execute("sleep 0.4")
        end
    end
end

main()
