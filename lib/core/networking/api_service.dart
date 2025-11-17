// import 'dart:typed_data';

// import 'package:dio/dio.dart';

// part 'api_service.g.dart';

// //flutter pub run build_runner build
// @RestApi(baseUrl: ApiConstants.baseUrl)
// abstract class ApiService {
//   factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

//   // ----------------------- Auth -----------------------

//   //Login
//   @POST(ApiConstants.login)
//   Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

//   //Register.
//   @POST(ApiConstants.register)
//   Future<RegisterResponse> register(
//     @Body() SignUpRequestBody signUpRequestBody,
//   );

//   //Resend otp verification
//   @POST(ApiConstants.resendOtp)
//   Future<RegisterResponse> resendOtpRegisterVerification(
//     @Body() ResendOtpRequistBody resendOtpRequistBody,
//   );

//   //Resend Reset Password
//   @POST(ApiConstants.resendResetOtp)
//   Future<RegisterResponse> resendResetOtp(
//     @Body() ResendOtpRequistBody resendOtpRequistBody,
//   );

//   //Send Reset Password Otp verification
//   @POST(ApiConstants.forgetPassword)
//   Future<ResendPasswordResponse> sendResetPasswordOtp(
//     @Body() ResendOtpRequistBody resendOtpRequistBody,
//   );

//   //Reset Password to change password  send (email-new password-otp code)
//   @POST(ApiConstants.resetPassword)
//   Future<ResendPasswordResponse> sendBodyOfResetPassword(
//     @Body() ResetPasswordRequestBody resetPasswordRequestBody,
//   );

//   //Resend otp verification
//   @POST(ApiConstants.verifyEmail)
//   Future<String> verifyEmail(
//     @Body() VerifyEmailRequistBody verifyEmailRequistBody,
//   );

//   //Refresh Token endpoint
//   @POST(ApiConstants.refreshToken)
//   Future<LoginResponse> refreshAccessToken(
//     @Body() RefreshTokenRequestBody refreshTokenRequestBody,
//   );

//   // ----------------------- Profile -----------------------

//   //Fetch user info
//   @GET(ApiConstants.fetchUserInfo)
//   Future<UserInfoRespnse> fethcUserInfo();

//   //Fetch subscription info
//   @GET(ApiConstants.fetchSubscriptionInfo)
//   Future<List<SubscriptionResponse>> fethcSubscriptionInfo();

//   //create new subscription
//   @POST(ApiConstants.createSubscription)
//   Future<SubscriptionPaymentResponse> createSubscription(
//     @Body() SubscriptionPaymentRequestBody initiateSubscriptionPayment,
//   );

//   //create new subscription
//   @GET(ApiConstants.getPaymentStatus)
//   Future<SubscriptionPaymentResponse> getPaymentStatus(
//     @Path() String paymentId,
//   );

//   ///Sends an invitation code to the server to be redeemed.
//   @POST(ApiConstants.invitationCodes)
//   Future<InvitationResponse> sendInvitationCode(
//     @Body() InvitationCodeRequist invitationCodeRequist,
//   );

//   ///Cancels the current user's active subscription
//   @POST(ApiConstants.subscriptionsCancel)
//   Future<void> cancelUserSubscription();

//   //Update User name
//   @PATCH(ApiConstants.updateUserInfo)
//   Future<void> updateUserName(
//     @Body() UpdateNameRequestBody updateNameRequestBody,
//   );

//   //Update User image
//   @PATCH(ApiConstants.updateUserInfo)
//   Future<void> updateUserImage(
//     @Body() UpdateImageRequestBody updateImageRequestBody,
//   );

//   //Change User Password
//   @PATCH(ApiConstants.updateUserInfo)
//   Future<void> changeUserPassword(
//     @Body() ChangePasswordRequestBody changePasswordRequestBody,
//   );
//   //fetch Certificate data
//   @GET(ApiConstants.certificateInfo)
//   Future<CertificateModel?> fetchCertificateInfo();
//   @GET(ApiConstants.certificatePdfDownload)
//   @DioResponseType(ResponseType.bytes)
//   Future<Uint8List?> certificatePdfDownload(@Query("data") String encodedData);

//   //Get Bookmarks Chapters
//   @GET(ApiConstants.fetchBookmarks)
//   Future<List<BookmarksBody>> fetchBookmarkedChapters();

//   //Delete Bookmarked Chapters
//   @DELETE("${ApiConstants.fetchBookmarks}/{chapterId}")
//   Future<String> deleteBookmarkedChapter(@Path("chapterId") String chapterId);

//   //delte user accoint by id
//   @DELETE(ApiConstants.deleteUserAccountById)
//   Future<void> deleteUserAccount(@Path("userId") String userId);

//   // ----------------------- Home -----------------------

//   //fetch learing progress
//   @GET("${ApiConstants.learingProgress}/{userId}")
//   Future<LearningProgressResponse> learingProgress(
//     @Path("userId") String userId,
//   );
//   //fetch  All Ressons
//   @GET("lessons")
//   Future<List<Lesson>> fetchAllLessons(@Query("chapterId") String chapterId);
//   @GET("${ApiConstants.fetchLessonById}/{id}")
//   Future<Lesson> fetchLessonById(@Path("id") String lessonsId);

//   //Fetch User lessons Progress
//   @GET("${ApiConstants.fetchUserLessonProgress}/{userId}")
//   Future<List<LessonProgress>> fetchUserLessonProgress(
//     @Path("userId") String userId,
//   );

//   //update User lessons Progress
//   @POST(
//     "${ApiConstants.fetchUserLessonProgress}/{userId}/lesson/{lessonId}/start",
//   )
//   Future<LessonProgress> updateLessonToStart(
//     @Path("userId") String userId,
//     @Path("lessonId") String lessonId,
//   );

//   @POST(ApiConstants.lessonBookmark)
//   Future<LessonBookmark> createLessonBookmark(
//     @Body() Map<String, dynamic> lessonId,
//   );

//   @GET(ApiConstants.lessonBookmark)
//   Future<List<LessonBookmark>> lessonsBookmark();
//   @DELETE("${ApiConstants.lessonBookmark}/{lessonId}")
//   Future<String> deleteBookmarkedLesson(@Path("lessonId") String lessonId);

//   //update User lessons Progress
//   @POST(
//     "${ApiConstants.fetchUserLessonProgress}/{userId}/lesson/{lessonId}/complete",
//   )
//   Future<LessonProgress> updateLessonToComplete(
//     @Path("userId") String userId,
//     @Path("lessonId") String lessonId,
//   );
//   //fetch all chapters
//   @GET(ApiConstants.fetchChapters)
//   Future<AllChaptersResponse> fetchChapters({
//     @Query("page") required int page,
//     @Query("limit") required int limit,
//   });
//   //fetch chapter by Id
//   @GET(ApiConstants.fetchChaptersById)
//   Future<Chapters> fetchChapterById({@Path("id") required String id});

//   @PUT(
//     "${ApiConstants.chapterProgress}/{userId}/chapter/{chapterId}/recalculate",
//   )
//   Future<Chapter> recalculateChapterProgress(
//     @Path("userId") String userId,
//     @Path("chapterId") String chapterId,
//   );

//   @PUT("${ApiConstants.chapterProgress}/{userId}/chapter/{chapterId}")
//   Future<Chapter> updateChapterProgress(
//     @Path("userId") String userId,
//     @Path("chapterId") String chapterId,
//     @Body() String progressStatus,
//   );
//   // ----------------------- Home -----------------------
//   //fetch lesson by keyword
//   @GET(ApiConstants.fetchLessonByKeyWord)
//   Future<LessonsResponse> fetchLessonByKeyWord({
//     @Query("keyword") required String keyword,
//     @Query("page") required int page,
//     @Query("limit") required int limit,
//   });

//   // ----------------------- Plans -----------------------

//   //fethc plans
//   @GET(ApiConstants.fetchPlans)
//   Future<List<PlanResponse>> fetchPlans({
//     @Query("type") required String type,
//     @Query("minSeats") int? minSeats,
//     @Query("maxSeats") int? maxSeats,
//   });

//   //fethc plans by id
//   @GET(ApiConstants.fetchPlansById)
//   Future<PlanResponse> fetchPlansById(@Path("planId") String planId);
// }
