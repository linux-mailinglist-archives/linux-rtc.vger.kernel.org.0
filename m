Return-Path: <linux-rtc+bounces-4006-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961EA9ED8A
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5E9A170A91
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FB625FA0E;
	Mon, 28 Apr 2025 10:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="r6g4TNBK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA225F79E
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834832; cv=none; b=OIBu/TNoG//PDQTBmsCbIRclP96Nfs099rXBZAMAaf5L62ErrinyFK5k+1yujUgELlL1KglXel6jZvEUF6kUZg2lo74ctpIjmnra2H46WZlsvZh9GnOkHRfbZTIWftDpawDoiTi6S1typusHyx2KPSK1/VD/1w7beeGufYbfDmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834832; c=relaxed/simple;
	bh=ayUhcmHaTDDwhww81m9WU4TmIhIrxin8sNOxt58dFLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZGnHlhkG6y2CA4irNOGgcyjt9LjJLyX+AzDBboAIWJLhxYQxhOaf9AOBhzhY+ov5F2Q+gcnRVmpAQQr7FK00QKsDo4uRo7H01W+ndLc+k4+MUFcu6p6aYUPKnBEqwq0A1nFtBUXrLIdkbEvYpK8Jht3aqFTX5gVVpJsYWKiEnxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=r6g4TNBK; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so4274552f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834829; x=1746439629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KlC4XgX6YMsadyvDt4P+GyPh7t4sW7KE0IQlVTJhz+U=;
        b=r6g4TNBKISFuKB0wf+yWGoZIEMg/VJEC4rv+Tl7+SZU7dLA4wto7KrfinHzBCfsqL7
         QBK+bOS3U+3TeQu/TfKZA8yv1LnbrwL2IUKjiRzqpx2xVdtUJJYzls6wt/KerNaytGf0
         RNFGp1miAWZCxuA6VtlMgGKmgBZ5GYPhCe038w7XhS/OTRxsIXCvpB6L0SNj6Zosw3Fn
         e4ABFOiiWYuiQott23AceOV3zij7XMrW5ZThQoxJunbtTAFZTS7klLBr29/+FjYa55Yk
         /xS5bYniZPFrSrUqvrbVMlzkCZ3XvzE4rX/KG9pcBah4uAauKHuuXRe/WFCxM6JUXpjk
         l7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834829; x=1746439629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KlC4XgX6YMsadyvDt4P+GyPh7t4sW7KE0IQlVTJhz+U=;
        b=tM40+UNce7XDk1nt6a69/TONWc+XmU7jV5FvdvO9SftnYOyUJcFNWwLMN4xi1Np2Jb
         umtjMSht4GbZIgsZPPDO9KtTBsw6oVTjJHJvJsP9Yx9zz10Vj6+S/1FqDSOpbZSnA/3G
         1HbMq/ob2Lp4J0Ekp8kWxVVvn2o7G+U/HvTsFjVCTSPGBxzHV/gxbvjhfU+dJkeOrGMV
         uV+TnDU982YukIbJtQhIKsbiMdiY8mf4WqJ78G+hYLlWLdG6IHkbyHK+Od/lRYQF3BS7
         P7Qk8pndh86AJfHu3N7iec5BLbPg0pPo6kt9/foNzuV2l6uUC61F0e7FHhUBWtjhMVik
         xpEg==
X-Forwarded-Encrypted: i=1; AJvYcCXepQcL1QJTDS8SMPwiH5nxucIKrPzfEs23MdsxdNpkn2qXsBVW2qId3em+NHikskiWIqPgZr4fNDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjCdeMnV5wNXfL+zQWry8siYBpsMyOdkArHEbrakjr5cjPR8XN
	RE+PWYh9xsAKBpOSJQNk5EaNzpjoW4+UoyUZ/EtysDVQjtQkoI7vdG02LaBvj10=
X-Gm-Gg: ASbGncu2BOcln2FXxM9wIlYuOP9uOFZr/pAh51DItLeDDKfqgPORcAQtj+mRVvB1Ty3
	cnb/kE/eaSHVozkh36IBspP6Ossun3of9pwIHwbTfGPfDK2+bE+DsFSugIpOZ7b9+UuytFb8ALq
	l6994nPzHtZMJMJHyKzCBUX/dsgTPwm8tVup/Jks0nnIHSZIoaYEcIm42JtV4BuslHmxa93QxET
	W7W8MWAHaeuSsBPBSuAPzBCxR+fK7eswR0Y0pJndlgJm8MmGwjrsXc8hBGqrI4d+oblqHJROEg0
	ki7FcKGNodbVQLjkpLfN8PZ9utW6bBXVWtTkMmmUbRTD7uHKYHK0zqmRbj7UCA8kdbuuHCwRS5P
	x9vt+
X-Google-Smtp-Source: AGHT+IEAqGRdEGoeVuHDiyinbhr2Ppalj3tD+HoFJFni3oTADsmywqY2MxcacwtDa7VxS8Ejbb0H+Q==
X-Received: by 2002:a5d:5f4c:0:b0:39c:1429:fa57 with SMTP id ffacd0b85a97d-3a07aa5fe21mr5640555f8f.3.1745834829374;
        Mon, 28 Apr 2025 03:07:09 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:08 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 28 Apr 2025 12:06:49 +0200
Subject: [PATCH v4 3/5] rtc: test: Emit the seconds-since-1970 value
 instead of days-since-1970
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-enable-rtc-v4-3-2b2f7e3f9349@baylibre.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=YkRXXHd+aLLdgJUBqxRycYFTuIReFwljKIM7TbkJxdM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NJQNZkwy20BxUQyLS1XhyX4zVIefYo6C5zJ66y
 IdoAB5eJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSQAKCRArRkmdfjHURcrREA
 CizUV7K5+sddTMzndN6oNrzfe0G8JvQ8gixpWC676Ps8MBabxC0qCb0e37JkHzuaYoUyq4Z3MAhMq5
 dyTTYR1Y7bITGITz5K8d2Bbtxme8UNCaZ4vMUS+FMvTBHfjp2GYh0i9VqCeYru+d+BCU5pBEuJaC2y
 CYPDvruoIQBQnHMp8x9D2UYvcutq2OHCmQv6V+EkuamRERiwB2F9ragXvJmkqBsZBoXHpASJ0fmQ1c
 b4arU0GDk019su7VQpl7uOion9JZx6vAZkHrufQz+70HgqoyDDJQ5vg6f8ly04PrFuurBGsBsENby0
 Cfb9NUWm2zG+KuFN7Ik4sWuPlg/6wFWA2eoimU2zaZ8ppxgW/yY/k6WGeEgtKN6oLRuL/1kEWAJ9u1
 eC/HNiCLpFviwSRCX3p7dT+1TbiV0ZDUcg3ruj+wZ4eRPtZ0JXPARSpkz2ANJTmh8qUlg5u1cwqRxM
 L013WSh1xVI9KQY7LAIh+hvnRGdFEJK1ATQwNE4hhPbk4pR0rTmVHWM/lGFezV5F1YRFKH7GEEse0i
 vp17stqKoS2NjHh9luc9T2QSZAZNWT2hHxRc1A2a44BNMZnuJzuDlnRzNwsguQJBbZ5tG+s8cTTpQB
 yiadTRJSSipdA4Nftngv4dkWicgvVkETGKgOXe1FLPYXL2BjXahVOc25duxA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

This is easier to handle because you can just consult date(1) to convert
between a seconds-since-1970 value and a date string:

	$ date --utc -d @3661
	Thu Jan  1 01:01:01 AM UTC 1970

	$ date -d "Jan 1 12:00:00 AM UTC 1900" +%s
	-2208988800

The intended side effect is that this prepares the test for dates before
1970. The division of a negative value by 86400 doesn't result in the
desired days-since-1970 value as e.g. secs=-82739 should map to days=-1.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib_test.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index c30c759662e39b48e6fedd37073b656e0de1336b..c0faddc04c9bbcd421cbdc030c4a073056c6a9a6 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -46,16 +46,13 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test, int years)
 
 	struct rtc_time result;
 	time64_t secs;
-	s64 days;
 
 	for (secs = 0; secs <= total_secs; secs += 86400) {
 
 		rtc_time64_to_tm(secs, &result);
 
-		days = div_s64(secs, 86400);
-
 		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
-			year, month, mday, yday, days
+			year, month, mday, yday, secs
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
 		KUNIT_ASSERT_EQ_MSG(test, month - 1, result.tm_mon, FAIL_MSG);

-- 
2.25.1


