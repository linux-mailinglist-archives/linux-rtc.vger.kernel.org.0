Return-Path: <linux-rtc+bounces-4888-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA268B568CE
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 14:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF3AE17C3D6
	for <lists+linux-rtc@lfdr.de>; Sun, 14 Sep 2025 12:43:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63D9274646;
	Sun, 14 Sep 2025 12:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PuxeCqBj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08F0271479
	for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757853767; cv=none; b=Q+Py24vFkA5r5c4Vt1Pd2Mm5ETpQNlicLubxthcC/gju8ShGJQHOtA38puV7ETS6KU7OUROHOpGPJP7UUk0h6j9b/C1Blse+PHYAhiidC95VhTbCf/Fut/gbp4Xq9M4c4FixDLgCNiJu+JDBZWFWu1yD+dKLJesZcZo3BQLLvvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757853767; c=relaxed/simple;
	bh=D22DQEAI7GUdY0C98ZI2lUt2RWXEbX1YdkY+EOaEysY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ba35+vQKPOAU2VqPsCrMNOZ9RKL9ARiEYtcqpN7KniuuRfcrYCKSZuTPtAArptUZyIxhBJbHlyiLPQc+qJrxezpBHX+GPwmpMZS/vjrsXm51KTheboyGsZu2mLF89zTJGFu1vjmk3nPqLep0qpGLWFvDDVUpk/p8o9N7MKf2FCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PuxeCqBj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so40337435e9.1
        for <linux-rtc@vger.kernel.org>; Sun, 14 Sep 2025 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757853764; x=1758458564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5IkwHpWT3vjOUxYuXQio/Ms33Sg58fY2czp9a5UdkM=;
        b=PuxeCqBjJ3HDaqIFS8HzlHkBE6W6j7uxWv8VYHtczVwYtuUrdp+Ayn1AwxJq85OcFJ
         6pProTdwI7L11VVqbh52KND6ElxLC2osvR+wUYLfiHN0ut48bXBC4moItQfkG88e771f
         W5lssByHXe5oGdCMHFUeSZPngRQxFBELBAJXllrNIXOptLCvpV8iSDz3Bvm+4OfGTVbc
         iVn/Vw+jQ0xfd8b9yoig9/PoPdIBHQuHkUTQFMFpz7sn/iT3xu3diMCCb6BeFql+jyWf
         62XmTSQCaQAbfYXu+RKkS6bT82EfpWeVSlBz2uh75TvMDTyCNBFSSFvJOUtDiiOn3Jkv
         b03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757853764; x=1758458564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5IkwHpWT3vjOUxYuXQio/Ms33Sg58fY2czp9a5UdkM=;
        b=kBrLQpn6xsVufkwwxc24+dDDIP0wKnfGEEP4ic0KMYuDkOgQ63FQiXVfw8B0KwQNLm
         z4dE0acRfRONXdWR9SrDxGvdldGBx1ImL0zPgdd9ZcTsc8hYIkTVNxICfXpF/PJRBY5v
         T4fP9NGyk1BEQEVVjsMd14HgT0fjy9BLvqD1XhZSiJKqtCkFvgEP05YWbRYBW1FXWDzX
         C+ILtHV3sPjN9Myv9DlQfstoeGa3JImRUvq1YsimPnjhYhXhLtyzTs/g2hVFovgOP6QA
         UlOoQX6yKd4xQH7o4nzr+vSfwRXEZJa0MTqSoXq9DaMlQvkiHU6pS0XGl32My4tK4KYS
         i0XA==
X-Forwarded-Encrypted: i=1; AJvYcCWYdtgIHmz8kF28fqzEOTt97HzKbjrjwFLVGkwo8gJJ32VIKwKSt0SQt0DoYV+tdfxUktXJFUh6wlA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwV7f5/tB8KYUmuzFMm5RdqfAgutdKUSrE3kA9mne0+4ALlWb+
	KEgz3XHyHewBtwtDLsGk/NcS4kNwu+UnkxKIpztD+LYpFLeBwcQPOagh
X-Gm-Gg: ASbGncuhnOvrf0fcLal6QlxnZyI23dkIZ3X/mEOA2xakpnEF3PRSbP3L/8etiDfKMQ2
	5VNJ/8rnmRrnjagIwmXleRGtKWhUavf7ks6ytpO3oLS9Q+5rEOgO4Kxw2KX07H2naf3jSneiaHo
	UYyv1XjPbQXJyTf2jJmqLTRw8H2p1bhVT/MeHmPudlHpHOUHemOtiUi8C1A/opQYwT2CC36Basg
	eZLN7BAqQMpnnu14sXPR8Jvl7bygU9Pm31q5z/faI569892IUKy5bPlojWaJ1dLX0UlNwRDra+9
	OH1dsYTn9icSII/RdcID8eYiH8bIcOiFj/myFmDAvd9k7dQRF8dCo5lj1lyPYAXdb2oHcMCoPBx
	2rwbW7y0sZg+QwBxq3tnNo4PIux5kMxlRFP98X5kFTTC1yGR2aFsx27ZS6dsZgN6s2vQeXfkwGF
	Zi5XQnE3yY
X-Google-Smtp-Source: AGHT+IFJplQxPa+oOwiL3HwRMbWnzwzx1xcdaJkdmZixyb1ZQ45I0gzLQ3rbeFTRhbx5TQ6AuRvPjQ==
X-Received: by 2002:a05:6000:2dc8:b0:3e3:921b:659f with SMTP id ffacd0b85a97d-3e765780a76mr8171220f8f.2.1757853763840;
        Sun, 14 Sep 2025 05:42:43 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e9511abbccsm3727773f8f.9.2025.09.14.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:42:43 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/7] clk: s2mps11: add the support for S2MPS16 PMIC clock
Date: Sun, 14 Sep 2025 15:42:25 +0300
Message-ID: <20250914124227.2619925-6-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914124227.2619925-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the support for S2MPS16 PMIC clock, which is functionally the same
as the currently supported ones, with the exception of a different
register.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d4e9c3577..7c766d05d 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
+#include <linux/mfd/samsung/s2mps16.h>
 #include <linux/mfd/samsung/s5m8767.h>
 #include <linux/mfd/samsung/core.h>
 
@@ -149,6 +150,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	case S2MPS14X:
 		s2mps11_reg = S2MPS14_REG_RTCCTRL;
 		break;
+	case S2MPS16X:
+		s2mps11_reg = S2MPS16_REG_RTC_BUF;
+		break;
 	case S5M8767X:
 		s2mps11_reg = S5M8767_REG_CTRL1;
 		break;
@@ -224,6 +228,7 @@ static const struct platform_device_id s2mps11_clk_id[] = {
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
+	{ "s2mps16-clk", S2MPS16X},
 	{ "s5m8767-clk", S5M8767X},
 	{ },
 };
@@ -249,6 +254,9 @@ static const struct of_device_id s2mps11_dt_match[] __used = {
 	}, {
 		.compatible = "samsung,s2mps14-clk",
 		.data = (void *)S2MPS14X,
+	}, {
+		.compatible = "samsung,s2mps16-clk",
+		.data = (void *)S2MPS16X,
 	}, {
 		.compatible = "samsung,s5m8767-clk",
 		.data = (void *)S5M8767X,
-- 
2.43.0


