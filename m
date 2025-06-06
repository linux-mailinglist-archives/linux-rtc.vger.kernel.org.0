Return-Path: <linux-rtc+bounces-4237-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DC6AD0617
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 17:51:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6495417C02A
	for <lists+linux-rtc@lfdr.de>; Fri,  6 Jun 2025 15:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDC228B40E;
	Fri,  6 Jun 2025 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b99U7M+K"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEA31CFBA
	for <linux-rtc@vger.kernel.org>; Fri,  6 Jun 2025 15:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224713; cv=none; b=SBURz1Y/Lg/7jneI3OVToNT4vJrgDXC1xe2o/gN7muaK0Bi3HLiWV1VVQoun813orIEH+0meHu2ItGx4fyLMjNANdYphv9iePHqewRPFFbE1Svn1W9/zcGaaLOT1E/RNIxZZSioV7rT0WfK4GcPHelHQxqiM3mi/0sMXVjbkKS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224713; c=relaxed/simple;
	bh=bg6miEh+iCb361OA/ohJfoY5S4a8QSX064eJ72AIIf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZYeyTqUDWTr3tzxGVpp6mmNeUxep2Zp+IC1Y/6b8TGUw0XMVQy12MlRNGX+QMejr9zVB/P2OqkGS0y4o7K70aR69mLHH413jz/BJHUVm1aDD9mMHFncDyNMuXuGmqxFT/y9j7/pZtD48wV7PKxkHQzYMvcxfK29nwv09A3dVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b99U7M+K; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1797075f8f.1
        for <linux-rtc@vger.kernel.org>; Fri, 06 Jun 2025 08:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749224709; x=1749829509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZizXFoeXcBMD/wt5p6bPEFDEKvQa75O7yJfeKXIgJk=;
        b=b99U7M+K3kP9kFAVPseaX2nUG1axySzRglfk76SlaQSxT0I6vsHHCq5R9vwXCiM/bn
         gQwc63M8EH/QLaFCa3B8+l6N0xHOIT1kr6A/ityZ7YpZhdD4eRuig5K00tuXdBaJAxIX
         0YhbgY0vG492QP+/7tdRN5YYT3SXFem2CjZbiz/PmvS9pWjhB8AjB+vd0Isc/LJzB/H3
         mMNHiycmUovJVsVLnpMtkL4DRKAErOTXP/3iPjCIDReGHGxehwr5N8vPSWudqDo6+BBD
         GRzic8rUfzX7mbD/CRZxPsWYQgq5Udaif3Nnw4fpMtmmsvTpgg9M3ysMRxySIXmRJUSu
         Wjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224709; x=1749829509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yZizXFoeXcBMD/wt5p6bPEFDEKvQa75O7yJfeKXIgJk=;
        b=qj7J+oAbL6xn33kETWaQvdIXse5Y8scj6XMYtvuu8ZE2luJQzs0nO3azUxAz6cbmrp
         T3L/bax/931Mz++ut2lxdGBjJq96xt6YgmGcl40iiCLSJ2qNdYvL7JUZIL3lWcY8L5FX
         ECikHGRjEd1M/tkGP/G0PXe3fkk5xEGHlU/21DUjigtML9UhPz5aijRAedo6QZFckl33
         ZWKQvNncal5va+gVjW6T01l1pN7B91pX9cQaxnYwYZYUF0nipA9RJTvSgORjxKWPpMh/
         s5K4MEPRIAF+aYeyZi59kqGRU9nf5RtANuIS5eIe1/yE5a6fswIh39fobwkADaeXIZT2
         AOSQ==
X-Gm-Message-State: AOJu0YxTOhb3qET9+U7rFPePHB8SM6tQ6MOI2sa+bSQDojpiVSaQQkIE
	9dZZ/+C4kDKF3sXP/MWHiI5nACfqUgXR3Vxo0dyWQ3VQMvLLNTWlYTsOccwqy7OzzKs=
X-Gm-Gg: ASbGnctGVErBouuPNsskq6GH7Fc/YjbKW9JFQ0LPj5KXON/XZO9P9I25Zc8Psczfwr6
	l9nsEypAaPLqjGuTalZvxgPXMMjnCsEl4VkxgBHxPyOWc2n77FpANyiOQNBCd5pfHczgcdtAF7M
	xZxDM0NTc2n0RoedPICYdDvySU36hqrsxAuoiIjkD7K0BQzhu0QHbr5NC7qruteidi9QVsQLyJx
	8F459ZU+SLw1JZ3qqOIV60jkyyh2g0X/FCQD09p4zvtyq99gEElPhAaPHaiKwUDkwxe3CejzPqW
	P0y7QpgsqqkJATzLh00jfzIkRrjErbNAmr+1OsMmKyWhzjOQxxMCzX5PPlI9lGP6/Hiipp7zamG
	35ZEarktOd1c1bO3f6A==
X-Google-Smtp-Source: AGHT+IH2560opVVTWYslchgiaWiKQkm+zzBwIStdZ9KzldE06una1z0Sz+Zcv4rkjm3NlUEOltOCuA==
X-Received: by 2002:a05:6000:24c7:b0:3a4:f71e:d2e with SMTP id ffacd0b85a97d-3a531ce8887mr3425351f8f.56.1749224709606;
        Fri, 06 Jun 2025 08:45:09 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a5323b5147sm2281715f8f.37.2025.06.06.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:45:09 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: linux-rtc@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 6.15.y 2/2] rtc: Fix offset calculation for .start_secs < 0
Date: Fri,  6 Jun 2025 17:44:39 +0200
Message-ID:  <1243af4fd5d2974b4e77e85873b999fd877161e7.1749223334.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
References: <cover.1749223334.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=tb6a1806ds76dx2ZIuVUstCWxxnAgZjj4OhPVhe0dNo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoQwzsv0ZkI6czjWXMl4cAryKMZ4Z/NCk3+CLYg r14uM57CJiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEMM7AAKCRCPgPtYfRL+ Thf/B/4zevmHiaKXalPE2ES5JgEX4xhSzWMktYKBaQBrAzswpGpvmKkSVBMLhgpJn0LmEQDzInq iOyVIyZOYghjsYbh4KNQzVmnMce0/AGA1N22lOs7bTHy+FM+PawdktHLojzEaWJTMAbTH3zuoZo knrTTMLbq/+PnaBTFlFS3azlkldM59hq2V7Oz0qlpfJoi8w2P5PFtjmwr8NQ+rK9oHNXtXQy6cy t+Msnws6X35qVDjfCW3eEDta8DaZZkZ46D7GqlJP1IEWATqgtl3HbC+i6MYGaF0UZ/n/dnTwWd2 574ELvq4qQUJdnolI0rDu49lm25xo2Kr800jZeQJnMlMorCr
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

From: Alexandre Mergnat <amergnat@baylibre.com>

commit fe9f5f96cfe8b82d0f24cbfa93718925560f4f8d upstream.

The comparison

        rtc->start_secs > rtc->range_max

has a signed left-hand side and an unsigned right-hand side.
So the comparison might become true for negative start_secs which is
interpreted as a (possibly very large) positive value.

As a negative value can never be bigger than an unsigned value
the correct representation of the (mathematical) comparison

        rtc->start_secs > rtc->range_max

in C is:

        rtc->start_secs >= 0 && rtc->start_secs > rtc->range_max

Use that to fix the offset calculation currently used in the
rtc-mt6397 driver.

Fixes: 989515647e783 ("rtc: Add one offset seconds to expand RTC range")
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
Link: https://lore.kernel.org/r/20250428-enable-rtc-v4-2-2b2f7e3f9349@baylibre.com
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index b88cd4fb295b..b1a2be1f9e3b 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -326,7 +326,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 *
 	 * Otherwise the offset seconds should be 0.
 	 */
-	if (rtc->start_secs > rtc->range_max ||
+	if ((rtc->start_secs >= 0 && rtc->start_secs > rtc->range_max) ||
 	    rtc->start_secs + range_secs - 1 < rtc->range_min)
 		rtc->offset_secs = rtc->start_secs - rtc->range_min;
 	else if (rtc->start_secs > rtc->range_min)
-- 
2.47.2


