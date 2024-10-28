import os
import time

def run_command(command):
    """Run a command in the terminal."""
    os.system(command)

def start_services():
    """Start Nginx and MySQL."""
    print("Starting The Nginx with MySQL...")
    run_command("sudo systemctl enable nginx")
    run_command("sudo systemctl enable mysql.service")
    
    run_command("sudo systemctl start nginx")
    run_command("sudo systemctl start mysql.service")
    print("---------------------------------")
    run_command("sudo systemctl status nginx")
    print("---------------------------------")
    run_command("sudo systemctl status mysql.service")


def stop_services():
    """Stop Nginx and MySQL."""
    print("Stopping The Nginx and MySQL...")
    run_command("sudo systemctl stop nginx")
    run_command("sudo systemctl stop mysql.service")
    
    run_command("sudo systemctl disable nginx")
    run_command("sudo systemctl disable mysql.service")
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
    

def main():
    """Main menu of the program."""
    while True:
        print("\nMenu:")
        print("1. Turn Engine On")
        print("2. Turn Engine Off")
        print("3. Check Engine")
        print("4. Bail Out")
        
        choice = input("Choose an option (1/2/3/4): ")
        
        if choice == '1':
            start_services()
        elif choice == '2':
            stop_services()
        elif choice == '3':
            check_services()
        elif choice == '4':
            print("Exiting the program.")
            os.system('clear')
            break
        else:
            print("Invalid choice. Please try again.")

if __name__ == "__main__":
    main()
