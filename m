Return-Path: <linux-rtc+bounces-4009-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3568A9ED8F
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 12:07:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CFEC1892C81
	for <lists+linux-rtc@lfdr.de>; Mon, 28 Apr 2025 10:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D574B26157A;
	Mon, 28 Apr 2025 10:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kYN4kj7y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE3E25F976
	for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 10:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834833; cv=none; b=YbvLMRZsKmNzojwPZ6dqu9y+Sr2GtxC4LH622vepOcl4ystctKIJKNSpSctMThMikGAwvVLvaQ3rAHm70nMBoMM1Rt7mobURb3oTu+dCV3J1A6bere3MAqNG+ba160VOZH4rSm7V4i23uZ+F8YYHhrQUeW6H/CZ2+pL/lW1mWOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834833; c=relaxed/simple;
	bh=5BXD6w9a8/MMslajqLpys8wbsQV7bV7CuK0Yj8/oSpU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cXryIfEQFU0haTT9W+MOVNkEoulc3IgkMbTQfYD8lLWHzfJQoRdKJKcTDgP/o0M8WIME8nosU1P0XH7thg5WUIi0yAuYOWbTKFk3a0JnFDnSmMwbGdpkwSZJHLPu1hR1z9kZO3Ht3YwMQ9ukZJG/qDXpCLojIaHOysMB4ATjcLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kYN4kj7y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2780607f8f.1
        for <linux-rtc@vger.kernel.org>; Mon, 28 Apr 2025 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745834830; x=1746439630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cF2oeErd2f8CMpAQYPghRdhYfeau0GOqbG/tEe7jF1E=;
        b=kYN4kj7yQ8sDx58ANKKu/BoWRkE1r5Fsqikeg6zf/BBWPwdf1XNaE9/TGRKIcdUHw4
         ecz61iuVD4hk1xu19v5DcyjeVJ1dtsOO0ICLlTadkFqgjepuDVAlGj1sC8Y0Bo7QWEPV
         ZPbyXiComBHYSyvsXxU9dVG9o9hEkNcIKew7f8I18aWpFjuFQcl0daOupBUM7rQEiWIN
         eDPbtim0w9PrG2OqDVXZmfRWHhvGstrkIsZ7qoZAWj3i8Dnal4NhO4kenpzKFiZtcCxn
         QRVT6pbI+JM7W2Jy15a52Prm6LRBV60wLTE+AI/pjhWhZThBev5Pya9LjUIQqWWvp9d/
         7KaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834830; x=1746439630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cF2oeErd2f8CMpAQYPghRdhYfeau0GOqbG/tEe7jF1E=;
        b=m5mlZoWdDYas9Y4VfdG2hD006ttDNbFfB7n42Tklc7taOEs3fXY551Rhl9lubLbxlP
         VQhVU88sjfrRgB/Dle317PTRcX55+rnAO2uZij/bXL4Tl78tZrZAneQIKbHnpxDEyWZx
         XUzUb73masYzav3qj3rhQxg6VnJmrtYy2xk3hmnL3MW8FlDL+pihOmu2Csfz5qKi/uW5
         Ii6Jd1DPtYLiXIV2haw5OUH60QudCxKJsIlPG7pB4TdF9ozO/qNeqmH+GJTQS28LhD5W
         zYpATVXFZdYjGKtH1lYA0SOaKqFr1mb29w0/MvBVz6k7vzfyI4jk4s0wLidFQSRLAhVL
         /FLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEcNZID7I91JfAwPZj5f0TqaEnuy9Hh3w4yj7xpoQfONPTddnpU76Zp9BbB/eJr3vgGSEIgyE4HE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/4+8Nqj+PmES+8T6lLV7Fv924k1/hk45eONV4ldZqFTpW0kd
	/nt6mzZZAIjsqTOzBWdRme973PxuWgsvPnGhHynqxf3MNJHQ7Mhkffq87++hMio=
X-Gm-Gg: ASbGncteZlpEzahAu0mRpEtznvobHxhO4O85B5+nU9ZHEIkFahqTktazOSt/zQksM0J
	mLWU315NqhwSGkJzbnh1EmCM7ohhHsCxC1Nej25YCyzuqBUwR9i+EYWJKBcosqIudOsavCR1m4p
	pUid44zYyhOV3Gzjjjnv/h3iyjAlEPsCcW35IB3IC+2fK9IfKpVqT4cG9FmvGjSlNXhB4MvGFd3
	TVQ+xtjqYR8tI8wnFdyR1yyWIpyumJ8774BCmUC3kDQZeS9s17v/vmZF2qhmLHRTbNPXabNmSDU
	ab3U84t3wpd5maCERRWosJ8Hr2oomoZoj6f+GHUmfTmGhB3lodzWG5Zjqgq1L0pxEGxjfg9vy8E
	+nCuD
X-Google-Smtp-Source: AGHT+IH4Pj+mbE1WOAoufjlp8rWav5+yAYMa+Zf5i/KTiT7A5shkzDX+Sqj9DrcK4mLxd/CD7GoucA==
X-Received: by 2002:a05:6000:1aca:b0:38f:4ffd:c757 with SMTP id ffacd0b85a97d-3a074cdb983mr8433308f8f.2.1745834830173;
        Mon, 28 Apr 2025 03:07:10 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073e5cb16sm10575403f8f.84.2025.04.28.03.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 03:07:09 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 28 Apr 2025 12:06:50 +0200
Subject: [PATCH v4 4/5] rtc: test: Also test time and wday outcome of
 rtc_time64_to_tm()
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250428-enable-rtc-v4-4-2b2f7e3f9349@baylibre.com>
References: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
In-Reply-To: <20250428-enable-rtc-v4-0-2b2f7e3f9349@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2347; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=UnAXFwAglulxq3VvT2LxxQ07u2U9oUPKSME/LEhdx+s=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBoD1NKksIrx47qFXyIWVXw5aRilveyh1MSO+R8dQfi
 BrMmvQCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCaA9TSgAKCRArRkmdfjHURRRwD/
 wKtNV3PpRHNxJhebj7jlb7eL+IGMmi1dGKIooOz9VS+K8GN+zM9bEJpER2HIB2OM9TglIGTazdVeN2
 6BEWLGbYds3KyCpZF1xDJpQejyTyDtcqqCvEhQlU0r299y697Jro2c2iyox13rRQPVNv+svKkZle8g
 S9JnMo9j0db9MuqysB75Ad8D0gdeKVH8gMxTPmUywro7RGvP1+RDsjSs8VjffB0MkRIAxU8D0Sxnbe
 1dmI8YXIujhDA3U2fEd1p5jjwPr+8c6sbiIT3bwlYHw9PblpgAzLgGGggUkVL5/6YsKftbJLAT7EDS
 hrBlm4ZtLLgCNnmN+PxanXNZjUixIK7C+1MzpyW2eA/6jBugk3s5vl88tnSBKjPz2+R+f10X09wKoo
 bLxz8ZeUipNIREDzhGnnZ77lqK8V0ouSRQXAWTq90CEiO1j0scUoXXZjHSOcKSZAXR226bi+Q/6XiH
 Pn0KSZmvR7g5HKVNwcWmZiQAwvkeA3LtnXjo+cjqhjpY2Lt6pALe6ClrRSst6oTRz/IhJidM+zfz20
 xBaa79xWeW/z24TvHdIN6c/PtQrULj4kTu9TfxHliCvBm5UD4in7lfMDjysBAWIO4hmUGSYFAbBrqL
 K0EOKOkjZmowe8/0wwyVthSD3SAaCrdpjTWYfIxm44YOEyNqUoah4Fzu6Dyw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445

From: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

To cover calculation of the time and wday in the rtc kunit test also check
tm_hour, tm_min, tm_sec and tm_wday of the rtc_time calculated by
rtc_time64_to_tm().

There are no surprises, the two tests making use of
rtc_time64_to_tm_test_date_range() continue to succeed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/rtc/lib_test.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index c0faddc04c9bbcd421cbdc030c4a073056c6a9a6..b1ac0701d42e5562b8eae5b191012c8b56a06902 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -6,8 +6,10 @@
 /*
  * Advance a date by one day.
  */
-static void advance_date(int *year, int *month, int *mday, int *yday)
+static void advance_date(int *year, int *month, int *mday, int *yday, int *wday)
 {
+	*wday = (*wday + 1) % 7;
+
 	if (*mday != rtc_month_days(*month - 1, *year)) {
 		++*mday;
 		++*yday;
@@ -43,23 +45,29 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test, int years)
 	int month	= 1;
 	int mday	= 1;
 	int yday	= 1;
+	int wday	= 4; /* Jan 1st 1970 was a Thursday */
 
 	struct rtc_time result;
 	time64_t secs;
+	const time64_t sec_offset = ((1 * 60) + 2) * 60 + 3;
 
 	for (secs = 0; secs <= total_secs; secs += 86400) {
 
-		rtc_time64_to_tm(secs, &result);
+		rtc_time64_to_tm(secs + sec_offset, &result);
 
-		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
-			year, month, mday, yday, secs
+		#define FAIL_MSG "%d/%02d/%02d (%2d, %d) : %lld", \
+			year, month, mday, yday, wday, secs + sec_offset
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
 		KUNIT_ASSERT_EQ_MSG(test, month - 1, result.tm_mon, FAIL_MSG);
 		KUNIT_ASSERT_EQ_MSG(test, mday, result.tm_mday, FAIL_MSG);
 		KUNIT_ASSERT_EQ_MSG(test, yday, result.tm_yday, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, 1, result.tm_hour, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, 2, result.tm_min, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, 3, result.tm_sec, FAIL_MSG);
+		KUNIT_ASSERT_EQ_MSG(test, wday, result.tm_wday, FAIL_MSG);
 
-		advance_date(&year, &month, &mday, &yday);
+		advance_date(&year, &month, &mday, &yday, &wday);
 	}
 }
 

-- 
2.25.1


