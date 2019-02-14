FROM ft-rails:on-build

EXPOSE 3000
CMD [ "rails" , "s", "-b", "0.0.0.0", "-p", "3000"]


##########################################################
# Pour tester 
# docker build -t ex02 -f ft-rails:on-build . 
# docker build -t ex02 -f Dockerfile .
# docker run -it -p 3000:3000 --rm ex02
##########################################################
# https://guides.rubyonrails.org/command_line.html
# s = server
# application starting in development on 0.0.0.0:3000
# -b = Option pour ip FIXE
# p = port
##########################################################
