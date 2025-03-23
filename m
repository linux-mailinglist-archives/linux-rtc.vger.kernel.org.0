Return-Path: <linux-rtc+bounces-3597-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEA8A6D1F6
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 23:41:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34D7C3AA488
	for <lists+linux-rtc@lfdr.de>; Sun, 23 Mar 2025 22:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38D531EE013;
	Sun, 23 Mar 2025 22:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kzuUTZ3y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B731E9907
	for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769591; cv=none; b=AhnLhEy/9vfvSdL0PTSm7FMQgCyu8xu6QaZgYsH2mBOV2QLJd5urGay9jlL1fz0JunX1AH5DOnWGsv8g7K9qs0RacpN2V7KU8yrfFea5KA3YpIzfABMt4T84oMWwJnBFhojBCFwx/P/xC3tsUOjkHWB5cxN9Q/zX5QIaQxBJtzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769591; c=relaxed/simple;
	bh=XTbYOFxDpYMNG8kdQks6GusInksI0MrF0HPSPauW9G0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZpk5dLo0oBMnL5l+IcU5CVocAQe6OaBhaDnPag7ySI8+POPQcglIB0Pi7279KAanTmb5a+FaV4yjeTDYM83mTqeLwJtQNqbx4+CCq9mOg1vpVDCU1Mhipm8GeWQY41JNkMGYL0+ufpBtB5JmD2RSpI/MB0SKShVgKizny3xqEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kzuUTZ3y; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso764039566b.0
        for <linux-rtc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769581; x=1743374381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=kzuUTZ3yS73U19jU458nl4lpuBO+pGkSbFABOeVGkrN/8tYQpXfBQzl0846vbtBIy2
         zEPd2TgwH5Rfswn1yHu9Q6sv8fq9JW/UO+OHxwUChNyDghBi87YKZSjr8Bv1J5Vdsyt+
         ii9B2bT6zydNG71B8paDRSfox2UjOaJk8ykufibzIHfrkKvOqayQVTx/rr8R0DJeHvIN
         TlKk2rjhdfebUsMdhdiAkJSgIgSsnj4QmlU1jn8IB+X4OxHQlV19/Wu8kbvoIXl5Xv7h
         Lrv8UBKbL/E34VKwkyDvSjtUVveplHcvAXTkzxXE+QZqZDauZ68Qu/xQDifqWTIr6M5a
         NCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769581; x=1743374381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WWXWLpvDyb8usGlL8yRG72QzGDtYxB508Wc6qQDfhs=;
        b=OgH1RvbgkI5//IMDEoCDR+vFdFZ8BtnEn3iLJGSlwD+Z6c2t91pIUVU/RptBGRHtKm
         HDjICBqlUDF5Kx+QHaAa7EevL+u/EEjuoi++Hoe67In75Z6MWYd4sbCSBJ7k3XFk0zKk
         e3zAvYB0MVxqAHoUPSgWCff29LGl/rpajsHtM/89fM7bzrSWaoJbtL0deKhe1E0e2MDJ
         +n7xNhSFDnNXr3joVbkfeRYE+ExXBIrf1JZqJLQooLg8qPXj4SrmK8YB+87qR3G5hidR
         vuGlYXhv4JZ8kx+p6rDCeNT1iHCYEmTLy9PNS7VKYIuJDYsuU+zDN25t+OaPZXDOzvUs
         MmFg==
X-Forwarded-Encrypted: i=1; AJvYcCXZdX+7zjfqcyBZl2YbkNTLm2rYCwp6R3oTJDI3EdFAkpr4b6xjJqUBoyGDIkOxeFdB2UW3lhP9XFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yypf7ilRcDnvadqAYwAYGwtq0Ufrg0GVWRe44hjadzaqq7foo0S
	vFx61wQmnENF5DvRFjP6zparhbT5UvqWKBHQPQF6AyTvrdmMQ81RhFh7A2HZFlI=
X-Gm-Gg: ASbGncuLHqqY63KFKyMWzWa9JjS1wBi6Fla7JxcIIknvs3tF3/mO6k2Fn/AdrIfuqzf
	XsCYbBymGqrfeDPeBnIIRI6Fh1d6N6DrfXo2PUZW4r47yJsKnOFaZkQEYoiAW53OFk2/8w9bPw1
	kw4UKPsxCMC11UQeXf8q9DbCTY6AearyxO+WRdirAy8zuAufGX+W0WurapAc8X+3zCHnp8N9vyw
	UCDRpbf+oF0vYREsVv2cVRPG3HnSXHX0h18RuQumfbkNdHHMJQD3z8rUBm1fn/4EyIQkF8yizSM
	BNjkIJz3vHFcw1+v74ZP2WGHb+6msESwBr2XyGBcCxHevMAQh4jRqUHTC8+PaIRvkvW7eY/jzdf
	7C1LZsXmjDGb1bPbIi05k9Q0Dt8Kz
X-Google-Smtp-Source: AGHT+IHUwVqfRBATiENga8y2WvKZVKOrHZpSBd488/sJ0QhrasF7WRCnvzn1JwM0TwTxkLrFTUS5Nw==
X-Received: by 2002:a17:907:1c21:b0:abf:6389:6d19 with SMTP id a640c23a62f3a-ac3f226757amr805060366b.15.1742769581299;
        Sun, 23 Mar 2025 15:39:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:46 +0000
Subject: [PATCH 30/34] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-30-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 0d8783577bab4f4ebe61050dbd68387d970773bd..7b00e65bdd9c25b3426f92355f8ea36e66c3939f 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -243,8 +243,8 @@ static int s5m8767_wait_for_udr_update(struct s5m_rtc_info *info)
 	return ret;
 }
 
-static int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
-		struct rtc_wkalrm *alarm)
+static int s5m_check_pending_alarm_interrupt(struct s5m_rtc_info *info,
+					     struct rtc_wkalrm *alarm)
 {
 	int ret;
 	unsigned int val;
@@ -451,7 +451,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 	dev_dbg(dev, "%s: %ptR(%d)\n", __func__, &alrm->time, alrm->time.tm_wday);
 
-	return s5m_check_peding_alarm_interrupt(info, alrm);
+	return s5m_check_pending_alarm_interrupt(info, alrm);
 }
 
 static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)

-- 
2.49.0.395.g12beb8f557-goog


