    program main
    ! module usge
    use tecplotwrite ! use tecplotwrite module
    implicit none
    integer :: n,k,j,i
    real, dimension(4,3,2,5), target  :: dataPresent ! already present data set
    type(tecplotDataTemplate) :: data2Write ! create tecplotDataTemplate type
    do k = 1, 2
        do j = 1, 3
            do i = 1, 4
                dataPresent(i,j,k,1)=0.1*i
                dataPresent(i,j,k,2)=0.1*j
                dataPresent(i,j,k,3)=0.1*k
                dataPresent(i,j,k,4)=(i+j+k)
                dataPresent(i,j,k,5)=(i+j+k)**2
            end do
        end do
    end do
    
    data2Write%inunit = 100 !define file number
    data2Write%datatitle = "./tecplotwrite.plt" ! output file directory
    data2Write%Nvars = 5 !number of values (including coordinates x, y, c)
    data2Write%IMax = 4 ! I-ordered dimensions
    data2Write%JMax = 3 ! J-ordered dimensions
    data2Write%KMax = 2 ! K-ordered dimensions
    !allocate(data2Write%varNames(data2Write%Nvars),data2Write%data(data2Write%Imax,data2Write%Jmax,data2Write%KMax,data2Write%Nvars)) !allocate tecplotDataTemplate varNames and  data
    allocate(data2Write%varNames(data2Write%Nvars),data2Write%data(data2Write%Imax,data2Write%Jmax,data2Write%KMax,data2Write%Nvars))
    data2Write%varNames = ["xc","yc","zc","temperature","pressure"] ! initialization
    data2Write%data => dataPresent 
    
    call tecplot_write_binary(data2Write) ! µ÷ÓÃdata2Write
    !call tecplot_write_ascii(data2Write)
    end program
