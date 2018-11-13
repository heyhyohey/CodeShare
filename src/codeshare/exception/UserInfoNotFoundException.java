package codeshare.exception;

@SuppressWarnings("serial")
public class UserInfoNotFoundException extends ServiceException {
	public UserInfoNotFoundException(String message) {
		super(message);
	}
}
