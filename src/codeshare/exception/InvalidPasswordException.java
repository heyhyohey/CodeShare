package codeshare.exception;

@SuppressWarnings("serial")
public class InvalidPasswordException extends ServiceException {
	public InvalidPasswordException(String message) {
		super(message);
	}
}
