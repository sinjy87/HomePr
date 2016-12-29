package image;

public class ImageTest {

	public static void main(String[] args) {
		ImageDAO dao = new ImageDAO();
		read(dao);

	}

	private static void read(ImageDAO dao) {
		ImageDTO dto = dao.read(1);
		p(dto);
		
	}

	private static void p(ImageDTO dto) {
		p(dto.getFilename());
		p("번호: "+dto.getNo());
		p("이름: "+dto.getName());
		p("제목: "+dto.getTitle());
		p("내용: "+dto.getContent());
		p("등록날짜: (목록)" +dto.getWdate());
		p("조회수: (목록)"+dto.getViewcnt());
		
	}

	private static void p(String string) {
		System.out.println(string);
		
	}

}
