Return-Path: <linux-rtc+bounces-4246-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 034A0AD2EEC
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 09:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3FBA3A932C
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Jun 2025 07:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4461281368;
	Tue, 10 Jun 2025 07:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="u7TpJ0Yq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F8C27AC44
	for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 07:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749540932; cv=none; b=fUSfiZ4Wq9O3tjiwYVPnRGsWKu3rm3Xry13firDx0vJRoTVPYTuBNPS9eGfnN6Y/9CZtmVKGNf5wdI6LuizPOqypScd0pmT8VLK6QBht/YIJNcqabpvL4FlqKdsW2807OQfbmP/BarhBfzf+aMn7xMFtbeDmDpXZfa1grk8apQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749540932; c=relaxed/simple;
	bh=qYWWP+zpjIyMrJlRbwnOtKfwQXnuMdXDuWoMJsoC4D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oukMDyePFioLlLWn7XjIv4Zuq7uFLcf1n+be4Y8mgg+XsgH4wygt6DgSI9lOVFeHEOqmhl2sl99EQ7HaZa9AxLDFL6UQgTBuiIy1fvzukSxYder0CE4wi3dJ4VSsit2ur0QCrBLOInAaJ/3upU+LGu1o6m5adX0yuMcf5c3xXqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=u7TpJ0Yq; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so32802745e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 10 Jun 2025 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749540927; x=1750145727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mwQDB1V1PMK3IYAreD4ugNvP/HNaIrh6csOiogWyt0=;
        b=u7TpJ0Yq1WEymvGqsE7D/Y27s89irCz5pmwCl5/FC6GRhcqoeKJhxlWyk1VvSynTxW
         GjaGEEw43TMcImdDQgsg+T/1GsKxkpG+K9tsoK0zOCh3mOymk71WDCK4jS8US/VJblDH
         MHnPGuMwd5IVUFD56ujeZMYNgxcYwX1QKyMN4Gb7B2/81m/DDYHK5htMtfZc6kGpd1SC
         XdJMFeuSwqsj/mwZsnP/SGR8lmVRsSr9eOVi+EDhlg+n9mlJt7lZdHKiT5QvVYlN57oa
         udku+6jEg5g9gCYtr/W11oL7u+7TtaG7pWkaJvR8Vgprk8b8nQKj/8UH/71kVY5eYiXU
         KZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749540927; x=1750145727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mwQDB1V1PMK3IYAreD4ugNvP/HNaIrh6csOiogWyt0=;
        b=GwZelQ6CVfi/YeWNq5lDQudRcMQ6X7WW61hjMvoTI+kd2QnDH4ptzk0x/S1qGU/UwG
         rq7QsMh2ct/VNdPKH9rYx8oURS1mmHyDCS3vKxzAz/Xt6l1SgDcBvFGYJIfnUFnAaunP
         rHuM7VySehuUKHL5twPrE6yAzdXKpS3xyF8DZ3r7N4CSgw8guqgjn0/vVvXRBw8BgAC1
         XqAePd14+YBWvGWQ8k/qG0MHkzeG803QcXowHHM9lGoLhEzGLFO26701vNc8OkARopY+
         8468lQ/KKJ4Dgj2EHwGECSXBlTTu36AbpG41yLsKD7ybvWnbiyXwjgik6VXtHQOY5Yy1
         DYtA==
X-Forwarded-Encrypted: i=1; AJvYcCWH9b1Sw7AyBLQWafhNso1yFQVniVIoYSZQrgwZUCoc/Ab+1dF7r+EgWEYVqJsshPdaX9Q665P91ko=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYbGdcOyuzUsKmmhjTmsAUPJEPajoBU5HswWpHO9LWVAp6wNl
	WgsD5S3zBpUhaOCUB51Iicer9BD9uvmLpU7MtOcpTv0VAsRIdXwNLheA3exVMLxvRCis9ZC0O6V
	SHPfs
X-Gm-Gg: ASbGncsJEXnCob0/x6zHKNI9Zl3rhSNHwsnQKnWJqBVCdIkC1Rmy3joT31p+6OpgDo5
	GKDq582Oe2iJvf3MvZXENpoUgNytod06q5NlGuzwG3HouLxvczbZYEHb6f+H6lbMkne5moIyuO/
	n7jf8M7+uZ+Dx7N7EN7GfE1aiiPkxLMaOQpeNAjUkyFTTevc0/xQTA/Q0u8SdT6BUwcZrxLWYOO
	YbBAiwcW5sa4SjfSJvNfbhumdMnxZkfz25h4eXDqwLrvFPYapxi8Jf19h85ojIwA9PMGWn3WEsX
	mwoJhaD7EbTanAA7cL9dsz7+nKwJUCcPwSfmsSUeE3+LxByIJMpIWTlX+2MlJBQOPD8z+0nMhWj
	cWYAYcfVVfCZhK1VXXIIGmY++tED1
X-Google-Smtp-Source: AGHT+IGiKgGq2K6bFjJ6JdVvMouVeeMTVCRkqaymJUWuhRWmRgHQPUaaS3Q7GB4qTMvVQt4GfV8udg==
X-Received: by 2002:a05:600c:1e0d:b0:442:f482:c421 with SMTP id 5b1f17b1804b1-4531de6ca66mr9848365e9.22.1749540927446;
        Tue, 10 Jun 2025 00:35:27 -0700 (PDT)
Received: from localhost (p200300f65f13c80400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f13:c804::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4531febf905sm5995905e9.0.2025.06.10.00.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:35:27 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>,
	Cassio Neri <cassio.neri@gmail.com>,
	stable@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5.10.y 3/3] rtc: Fix offset calculation for .start_secs < 0
Date: Tue, 10 Jun 2025 09:35:00 +0200
Message-ID:  <1f965f4886f65e45423f863930ccc7139944272d.1749539184.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
References: <cover.1749539184.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1719; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=X84EWsmN871czU1dFWJrOfrFlJlzjw1vvjrJHqVSPyg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoR+ArQBYeSFSZJ4ktSO5e1eqFAZgtBRzAwzJ4n EhS6OOPI+WJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaEfgKwAKCRCPgPtYfRL+ ToAsCACb/wdMka0BapKkfUDpg9Y9zstN7YdTWY+CZS8Vxb/UPnEpkfGVQ1KYOSfKQZMjf0v3lI7 +sVdYjDqeosq3NFXGd93UH4o6EOFXpcA7htkcgwB9S0STx/KQwdni4y6C7kDtst0NF6aiF+6Fjs bszqk6qEKjp9aEWdnlAyIgkpmuuGvP3E3YrP7lhJP0ChPRXoeY/1nB6pYxBBsjiKCZDvmF/pbrI 4hL6e2cI1CFNoAHBNFAKssJsKmuoQChJZFmWrccJsvFAN1covV8DMCOkVmquhzl7zFCTMxwYfLN pDq6P0xPpidP80QBa8u876FwSqv2jQ+Y+7rQvScBlofdudY+
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
index 625effe6cb65..b1ce3bd724b2 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -314,7 +314,7 @@ static void rtc_device_get_offset(struct rtc_device *rtc)
 	 *
 	 * Otherwise the offset seconds should be 0.
 	 */
-	if (rtc->start_secs > rtc->range_max ||
+	if ((rtc->start_secs >= 0 && rtc->start_secs > rtc->range_max) ||
 	    rtc->start_secs + range_secs - 1 < rtc->range_min)
 		rtc->offset_secs = rtc->start_secs - rtc->range_min;
 	else if (rtc->start_secs > rtc->range_min)
-- 
2.49.0


