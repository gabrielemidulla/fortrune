program fortrune
    implicit none
    integer :: num_fortunes, random_index, i
    real :: rand_num
    character(len=256) :: fortune
    character(len=256), allocatable :: fortunes(:)

    ! Open the fortunes file and count the number of fortunes
    open(unit=10, file='fortunes.txt', status='old')
    num_fortunes = 0
    do
        read(10, '(A)', iostat=i)
        if (i /= 0) exit
        num_fortunes = num_fortunes + 1
    end do
    close(unit=10)

    ! Allocate array to store fortunes
    allocate(fortunes(num_fortunes))

    ! Read fortunes from the file
    open(unit=10, file='fortunes.txt', status='old')
    do i = 1, num_fortunes
        read(10, '(A)') fortunes(i)
    end do
    close(unit=10)

    ! Initialize the random number generator
    call random_seed()

    ! Generate a random index
    call random_number(rand_num)
    random_index = int(rand_num * num_fortunes) + 1

    ! Display the selected fortune
    print *, trim(fortunes(random_index))

    ! Deallocate the array
    deallocate(fortunes)
    
end program fortrune
