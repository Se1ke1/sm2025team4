const express = require('express');
const app = express();
const port = 4000; // 기존 8080 포트와 겹치지 않게 다른 포트 사용
// POST 요청의 body(json)를 파싱하기 위해 필요
app.use(express.json());
// URL-encoded 데이터 파싱
app.use(express.urlencoded({ extended: true }));
/**
* ---------------------------------
* 결제 요청 Mock API
* ---------------------------------
* POST /api/mock/payment
*/
app.post('/api/mock/payment', (req, res) => {
  console.log('결제 요청 받음:', req.body);
  const { orderId, userId, amount, paymentMethod, paymentDetails } = req.body;
  // 필수 파라미터 검증
  if (!orderId || !userId || !amount || !paymentMethod) {
    return res.status(400).json({
      status: 'failed',
      message: '필수 파라미터가 누락되었습니다.'
    });
  }
  // 테스트를 위한 간단한 성공/실패 분기 로직
  // 예: 카드 번호가 '0000'으로 끝나면 실패, 아니면 성공
  if (paymentDetails && paymentDetails.cardNumber && paymentDetails.cardNumber.endsWith('0000')) {
    console.log('결제 실패 시나리오');
    res.status(200).json({
      status: 'failed',
      transactionId: `txn_${Date.now()}`,
      message: '카드 정보가 유효하지 않습니다. (Mocked Failure)',
      timestamp: new Date().toISOString()
    });
  } else {
    console.log('결제 성공 시나리오');
    res.status(200).json({
      status: 'success',
      transactionId: `txn_${Date.now()}`,
      message: '결제가 성공적으로 완료되었습니다.',
      timestamp: new Date().toISOString()
    });
  }
});

/**
* ---------------------------------
* 배송 정보 등록 Mock API
* ---------------------------------
* POST /api/mock/shipping
*/
app.post('/api/mock/shipping', (req, res) => {
  console.log('배송 정보 등록 요청 받음:', req.body);
  const { orderId, shippingAddress } = req.body;
  // 필수 파라미터 검증
  if (!orderId || !shippingAddress || !shippingAddress.recipientName || !shippingAddress.streetAddress) {
    return res.status(400).json({
      status: 'failed',
      message: '주문번호 또는 배송지 정보가 누락되었습니다.'
    });
  }
  // 성공 응답 시뮬레이션
  const trackingNumber = `track_${Math.random().toString(36).substr(2, 9).toUpperCase()}`;
  const estimatedDeliveryDate = new Date();
  estimatedDeliveryDate.setDate(estimatedDeliveryDate.getDate() + 3); // 3일 뒤 도착으로 설정
  res.status(200).json({
    status: 'shipped',
    orderId: orderId,
    trackingNumber: trackingNumber,
    estimatedDeliveryDate: estimatedDeliveryDate.toISOString().split('T')[0], // 'YYYY-MM-DD' 형식
    message: '상품이 발송되었습니다.'
  });
});
app.listen(port, () => {
  console.log(`Mock API 서버가 http://localhost:${port} 에서 실행 중입니다.`);
});


/*
* node mock-server.js로 http://localhost:4000에 api 요청 가능
* */