# Family Hub

가족 구성원을 위한 통합 관리 웹 앱 (PWA)

## 주요 기능

- 👨‍👩‍👧‍👦 **가족 관리**: 가족 생성, 초대 링크, 구성원 관리
- 📅 **일정 관리**: 가족/개인 일정 등록 및 캘린더 뷰
- 🧹 **집안일**: 할당, 완료 체크, 룰렛 배정
- 💰 **벌금 시스템**: 규칙 설정 및 벌금 관리
- 🗳️ **투표**: 가족 내 의사결정 투표
- 📝 **회의록**: 가족 회의 기록 및 관리
- 😊 **이모티콘**: 가족 간 이모티콘 전송

## 기술 스택

- **Frontend**: HTML, CSS, JavaScript (Vanilla)
- **Backend**: Supabase (PostgreSQL, Auth, Storage)
- **Hosting**: GitHub Pages
- **PWA**: Service Worker, Web App Manifest

## 프로젝트 구조

```
Family/
├── prototype/          # 메인 앱
│   ├── index.html      # 앱 메인 파일
│   ├── manifest.json   # PWA 매니페스트
│   ├── sw.js          # 서비스 워커
│   └── icons/         # 앱 아이콘
├── supabase/          # Supabase 설정
├── docs/              # 문서
├── .env.example       # 환경변수 예시
└── README.md          # 프로젝트 설명
```

## 설치 및 실행

### 로컬 실행
```bash
# 간단한 HTTP 서버로 실행
cd prototype
python -m http.server 8000
# 또는
npx serve
```

### 배포
GitHub Pages에 자동 배포됩니다.
- URL: https://yousam4u.github.io/Family/

## Supabase 설정

### 필수 테이블
```sql
-- families 테이블
CREATE TABLE families (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  family_name VARCHAR(100) NOT NULL,
  family_code VARCHAR(20) NOT NULL UNIQUE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- users 테이블
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  family_id UUID REFERENCES families(id),
  nickname VARCHAR(50) NOT NULL,
  login_id VARCHAR(50) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  role VARCHAR(20) DEFAULT 'member',
  emoticon VARCHAR(10) DEFAULT '😀',
  created_at TIMESTAMPTZ DEFAULT NOW()
);
```

## 업데이트 방법

1. 코드 수정
2. Git 커밋 및 푸시
```bash
git add .
git commit -m "Update: 변경 내용"
git push origin main
```
3. GitHub Pages 자동 배포 (1-2분 소요)

## 라이선스

MIT License
