package com.example.demo.model;

import java.time.LocalDate;

public class Notice {
    private int id;
    private String title;
    private int viewCount;
    private LocalDate createdAt;
    private String content; 
    private static Notice[] notices = new Notice[] {
            new Notice(1, "투어메이트 출시기념 이벤트!", 324, LocalDate.of(2023, 6, 13), "안녕하세요. 믿을 수 있는 여행 상품 사이트 투어메이트입니다! 출시기념으로 여러분을 초대합니다."),
            new Notice(2, "여름맞이 할인 이벤트", 152, LocalDate.of(2023, 6, 15), "더운 여름, 시원한 여행 할인과 함께하세요!"),
            new Notice(3, "가을 여행 주간 안내", 98, LocalDate.of(2023, 9, 1), "가을 여행 주간에 맞춰 특별한 여행지를 소개합니다."),
            new Notice(4, "신규 투어 패키지 론칭", 204, LocalDate.of(2023, 11, 10), "새롭게 준비한 투어 패키지를 만나보세요. 여행을 더 쉽고 재미있게!"),
            new Notice(5, "연말 할인 이벤트", 178, LocalDate.of(2023, 12, 24), "연말을 맞이하여 특별 할인 이벤트를 진행합니다. 이 기회를 놓치지 마세요!"),
            new Notice(6, "겨울맞이 온천 투어", 89, LocalDate.of(2023, 12, 25), "추운 겨울, 온천 여행으로 몸과 마음을 녹여보세요."),
            new Notice(7, "봄꽃 축제 일정 안내", 202, LocalDate.of(2023, 12, 31), "봄을 맞이하여 아름다운 봄꽃 축제의 일정을 공유합니다."),
            new Notice(8, "가족 여행 주간 프로모션", 120, LocalDate.of(2024, 7, 20), "가족 여행을 더욱 특별하게 만들어줄 주간 프로모션을 만나보세요."),
            new Notice(9, "해외 여행 안전 가이드 업데이트", 310, LocalDate.of(2024, 8, 11), "해외 여행을 계획하고 계신가요? 업데이트된 안전 가이드를 확인하세요."),
            new Notice(10, "추석 연휴 특별 할인 안내", 45, LocalDate.of(2024, 9, 10), "추석 연휴를 맞아 특별 할인 이벤트를 준비했습니다. 지금 바로 확인하세요."),
            new Notice(11, "어린이 여행자를 위한 이벤트", 78, LocalDate.of(2024, 9, 15), "어린이날을 맞이하여 어린이 여행자를 위한 특별 이벤트를 준비했습니다."),
            new Notice(12, "산악 트레킹 코스 추가 안내", 65, LocalDate.of(2024, 9, 18), "모험을 즐기는 여러분을 위해 새로운 산악 트레킹 코스를 추가했습니다."),
            new Notice(13, "바다의 날 기념 할인 이벤트", 158, LocalDate.of(2024, 9, 27), "바다의 날을 기념하여 해양 투어에 대한 할인을 제공합니다."),
            new Notice(14, "역사 문화 탐방 투어", 92, LocalDate.of(2024, 10, 15), "역사와 문화를 체험할 수 있는 특별 탐방 투어를 소개합니다."),
            new Notice(15, "환경 보호 캠페인 참여 안내", 83, LocalDate.of(2024, 10, 22), "환경을 생각하는 여행, 우리 함께 참여해보세요. 환경 보호 캠페인에 대해 알려드립니다."),
            new Notice(16, "연말 특별 프로모션", 67, LocalDate.of(2024, 12, 1), "연말을 맞이하여 특별 프로모션을 준비했습니다. 많은 참여 부탁드립니다.")
        };
    
   
    public Notice(int id, String title, int viewCount, LocalDate createdAt, String content) {
        this.id = id;
        this.title = title;
        this.viewCount = viewCount;
        this.createdAt = createdAt;
        this.content = content;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public LocalDate getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDate createdAt) {
		this.createdAt = createdAt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

  
	

	   public static Notice[] getNotices(int start, int total) {
	        Notice[] pageData = new Notice[total];
	        for (int i = 0; i < total; i++) {
	            if(start + i < notices.length) {
	                pageData[i] = notices[start + i];
	            } else {
	                break; 
	            }
	        }
	        return pageData;
	    }
	   public static int getNoOfRecords() {
	        return notices.length;
	    }
	   
	   public static Notice getPrevNotice(int currentId) {
		    for (int i = 0; i < notices.length; i++) {
		        if (notices[i].getId() == currentId) {
		           if (i > 0) {
		                return notices[i - 1]; // Return the previous notice
		            } else {
		                return null; 
		            }
		        }
		    }
		    return null; 
		}

		public static Notice getNextNotice(int currentId) {
		    for (int i = 0; i < notices.length; i++) {
		        if (notices[i].getId() == currentId) {
		            if (i < notices.length - 1) {
		                return notices[i + 1]; 
		            } else {
		                return null; 
		            }
		        }
		    }
		    return null;
		}
	
		public static Notice getNoticeById(int id) {
		    for (Notice notice : notices) {
		        if (notice.getId() == id) {
		            return notice; 
		        }
		    }
		    return null; 
		}

		public static void updateViewCount(int id) {
		    for (Notice notice : notices) {
		        if (notice.getId() == id) {
		            notice.setViewCount(notice.getViewCount() + 1); 
		            break; 
		        }
		    }
		}

}