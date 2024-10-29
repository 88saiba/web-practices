import os
import time

def run_command(command):
    """Run a command in the terminal."""
    os.system(command)

def start_services():
    """Start Nginx and MySQL."""
    print("Starting The Nginx with MySQL...")
    print("--------------------------------->")
    run_command("sudo systemctl enable nginx mysql.service")
    # run_command("sudo systemctl enable mysql.service")
    
    run_command("sudo systemctl start nginx mysql.service")
    # run_command("sudo systemctl start mysql.service")
    print("---------------------------------")
    run_command("sudo systemctl status nginx")
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")


def stop_services():
    """Stop Nginx and MySQL."""
    print("Stopping The Nginx and MySQL...")
    print("--------------------------------->")
    run_command("sudo systemctl stop nginx mysql.service")
    # run_command("sudo systemctl stop mysql.service")
    
    run_command("sudo systemctl disable nginx mysql.service")
    # run_command("sudo systemctl disable mysql.service")
    print("---------------------------------")
    run_command("sudo systemctl status nginx")
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")

def check_services():
    """Check Nginx and MySQL."""
    print("Checking The Nginx and MySQL...")
    time.sleep(2)
    print("---------------------------------")
    run_command("sudo systemctl status nginx")
    time.sleep(1)
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")
    
def monitor_nginx():
    """Monitoring Nginx using multitail """
    print("Monitoring Nginx...")
    time.sleep(1)
    run_command("sudo multitail /var/log/nginx/access.log /var/log/nginx/error.log")

def main():
    """Main menu of the program."""
    while True:
        print("\n+===========+")
        print("  NMP-Menu")
        print("+===========+")
        print("1. Turn On")
        print("2. Turn Off")
        print("3. Check Engine")
        print("4. View Logs")
        print("5. Bail Out")
        print("+===========+")
        
        choice = input("Choose an option (1/2/3/4/5): ")
        
        if choice == '1':
            start_services()
        elif choice == '2':
            stop_services()
        elif choice == '3':
            check_services()
        elif choice == '4':
            monitor_nginx()
        elif choice == '5':
            print("Exiting the program.")
            os.system('clear')
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
