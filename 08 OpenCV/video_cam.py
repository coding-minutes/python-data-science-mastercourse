import cv2

cam = cv2.VideoCapture(1)

while True:
    ret, frame =  cam.read()
    
    if ret == False:
        continue
        
    cv2.imshow("My frame", frame)
    
    # waiting for user to pressed a key
    # if user presses 'q' then terminate
    key_pressed = cv2.waitKey(1) & 0xFF
    if key_pressed == ord('q'):
        break

    
cam.release()
cv2.destroyAllWindows()