# frozen_string_literal: true

Rails.logger.debug 'Seeding category'

data = [
  {
    name: 'Thời sự',
    tags: [
      { name: 'Chính trị' },
      { name: 'Dân sinh' },
      { name: 'Lao động - Việc làm' },
      { name: 'Giao thông' }
    ]
  }, {
    name: 'Góc nhìn',
    tags: [
      { name: 'Bình luận nhiều' },
      { name: 'Chính trị & chính sách' },
      { name: 'Y tế & sức khỏe' },
      { name: 'Kinh doanh & quản trị' }
    ]
  }, {
    name: 'Thế giới',
    tags: [
      { name: 'Tư liệu' },
      { name: 'Phân tích' },
      { name: 'Người Việt 5 châu' },
      { name: 'Cuộc sống đó đây' }
    ]
  }, {
    name: 'Video',
    tags: [
      { name: 'Thời sự' },
      { name: 'Nhịp sống' },
      { name: 'Food' },
      { name: 'Tôi kể' }
    ]
  }, {
    name: 'Podcasts',
    tags: [
      { name: 'VnExpress hôm nay' },
      { name: 'Tiền làm gì?' },
      { name: 'Tài chính cá nhân' },
      { name: 'Giải mã' }
    ]
  }, {
    name: 'Kinh doanh',
    tags: [
      { name: 'Quốc tế' },
      { name: 'Doanh nghiệp' },
      { name: 'Chứng khoán' },
      { name: 'Ebank' }
    ]
  }, {
    name: 'Bất động sản',
    tags: [
      { name: 'Chính sách' },
      { name: 'Thị trường' },
      { name: 'Dự án' },
      { name: 'Không gian sống' }
    ]
  }, {
    name: 'Khoa học',
    tags: [
      { name: 'Khoa học trong nước' },
      { name: 'Tin tức' },
      { name: 'Phát minh' },
      { name: 'Ứng dụng' }
    ]
  }, {
    name: 'Giải trí',
    tags: [
      { name: 'Giới sao' },
      { name: 'Sách' },
      { name: 'Video' },
      { name: 'Phim' }
    ]
  }, {
    name: 'Thể thao',
    tags: [
      { name: 'Bóng đá' },
      { name: 'Lịch thi đấu' },
      { name: 'Asiad 19' },
      { name: 'Trắc nghiệm' },
      { name: 'Các môn khác' }
    ]
  }, {
    name: 'Pháp luật',
    tags: [
      { name: 'Hồ sơ phá án' },
      { name: 'Tư vấn' },
      { name: 'Video' }
    ]
  }, {
    name: 'Giáo dục',
    tags: [
      { name: 'Tin tức' },
      { name: 'Tuyển sinh' },
      { name: 'Tra cứu' },
      { name: 'Diễn đàn' }
    ]
  }, {
    name: 'Sức khỏe',
    tags: [
      { name: 'Tin tức' },
      { name: 'Tư vấn' },
      { name: 'Dinh dưỡng' },
      { name: 'Khỏe đẹp' }
    ]
  }, {
    name: 'Đời sống',
    tags: [
      { name: 'Nhịp sống' },
      { name: 'Tổ ấm' },
      { name: 'Bài học sống' },
      { name: 'Cooking' }
    ]
  }, {
    name: 'Du lịch',
    tags: [
      { name: 'Điểm đến' },
      { name: 'Ẩm thực' },
      { name: 'Dấu chân' },
      { name: 'Tư vấn' }
    ]
  }, {
    name: 'Số hóa',
    tags: [
      { name: 'Công nghệ' },
      { name: 'Sản phẩm' },
      { name: 'Blockchain' },
      { name: 'Kinh nghiệm' }
    ]
  }, {
    name: 'Xe',
    tags: [
      { name: 'Thị trường' },
      { name: 'Car Awards 2023' },
      { name: 'Diễn đàn' },
      { name: 'V-Car' }
    ]
  }, {
    name: 'Ý kiến',
    tags: [
      { name: 'Thời sự' },
      { name: 'Đời sống' }
    ]
  }
]

tags = data.reduce({}) { |result, category| { **result, category[:name] => category[:tags] } }
Rails.logger.debug tags

Category.import!(
  data.each.with_object(:tags).map(&:except),
  on_duplicate_key_ignore: true
)
Tag.import!(
  Category
  .where(name: data.pluck(:name))
  .map do |category|
    category
    .tags
    .build(tags[category.name])
  end
  .flatten,
  on_duplicate_key_ignore: true
)

Rails.logger.debug 'Finished seeding category'
