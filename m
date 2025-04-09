Return-Path: <linux-rtc+bounces-3878-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34589A83289
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 22:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AD32460BB0
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Apr 2025 20:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D4A2206B1;
	Wed,  9 Apr 2025 20:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vm497A+j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469FB21B185
	for <linux-rtc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231072; cv=none; b=VZwDF1Zr/X3Q5qp/EQ8z6gv99DzEL2T0ge9kJeijxmw8JW+PLSBR7EZUlqq1FJw8z7wR47xP/I64uVRzBr/5wnpPP8lyAI9HDS8+1OODtsv5XxCmNOXcr7pIkR14/rhY7UReZ0yOWeNe4v5Q4tIcLgQCZVBdJtDCbStx20yfj0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231072; c=relaxed/simple;
	bh=MOwN2YKQRpsoNetHBGgHFyjhqmCGn2sEj3wN4XKb40M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XWQpD1P7trWykKl6D+VKmwan1yCnLZXdu12BM3t6xRb+5s6pP78mwUZsWYh2ZmebHmeAbPQbn/MyN91D+XtmuepJEG4ugULc1XT7iqcAqRHHg5QjgN5/8FRNmetEc3Emq9BiisOHc36DSk83uG09YmXUr/bLWLVZ2Sm1i82mvk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vm497A+j; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25520a289so17179966b.3
        for <linux-rtc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=Vm497A+jx1EVsnEcAwNyYtILjLg/h8AtRd4f8kz3krTaccpoQpSFgQFyjb5fRM3mnu
         0gREPRuSqIVeGcsgrcw5Xjc2QgboErF/SfDeNoHSve8QPuTEK8tF5hNodZGTTELP2QvZ
         7P2svcFnz9I3kFpga/CWKZxHjMGLSxbi6siT+q6BPTrchYpvUaRyJVXOyiQNwApfnUGP
         XEK9wBVfX1O8dugaFuFEbCzl01Dq61xTdCVfzW5kPLJ61905qEVZu2gYHdUBuF9jCa/x
         eeYJ0e3UzHObjvCJrc6gthnoulEtuZj10SZejvZtfJvhnTlFi44dVYXI/8vpD3AVY/ZG
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKIEGv3zVsS/tvIgE0OLlPL/FateDyHpIQVfqm7tXaQ=;
        b=uoF3GkfA+j3HiT3/L5kgAnpZvxdxMRzVbzaGDfHrdOuoKBa3AR2umJ3gnG17HyyiE0
         tQ3jSU8uKxCo0C0N7pX8C+O+jndtn2Vxeam9GaOv2c6gwyFowVcfZvP3rUrzEfHnGLIC
         HlqNGS/cEQtSrMqBG+j/yUB5+HFIHopzxWPxkUiNeC0XL1sekl7MnS94thTK+oCeXQE8
         EHPIc5OuZd61bxtMz1aXdrhniO410zS/CndMPyffECNukX/BeoCCWrGQrxSk7BzXd+PX
         ckIBPHOp1dmhqRON9qZcYX/w9C5U0U3CYM4Ds1ONanMNKiWuf86uH6c7tEAOLdXClJeT
         aD8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTgYgedJ48nB9hfe7KjueJnkmH8fcYzTTz58d+Y3EVulHb9YyNR8l23r3YCuVq4QzjtonolMEdlP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgonIyFKJeirIU0hPfL3Bc4v0WjWaAy9nOUYccZSkNwdl0jjQi
	LjKtT0AQzjN8VEmUrd0UVq6OAIm15rCLeUxqQ5rdv6RWPrvXlbcoEd6m6wsKquevM+WoPhoqUBA
	Y1FyS2A==
X-Gm-Gg: ASbGncsC+ltkwtcGa/GwL+9YNXdRF/Vy7k1f2MVZIN0IBsuIJOOFqnWDH6U8Di0I5+B
	PF/qa9IK7GIy80yeBgTEnWNRTS8wx4tw9jDTkNLWWxTxeYh+9WEnN9G3RQJuoE3l4CBj/GktoEy
	llHupRR8P3fteN7BmjWbK4Sfsfycm1fJaJLmAEmUvXKP/p01ipi7AMwIAV59Jg7BdAb/AqEFqy8
	EmpNQb3/MXfK5dLN7MwSvCTgtWH6qo2bXcHWnJJ7iClKwSQ/QyU6WUbwomdM1a7MSX46qap2KIg
	z80FRyyCTm+qdgDtPslpjgB+FK0xRHJun3pyFd0K9lhqx5Ew4WGiOsbkDTnuiF6D/Dn23OKtg9O
	LD9hZCVwcEmLGWEYTkBUOMPNGPJ4vKUfNG3JfAg==
X-Google-Smtp-Source: AGHT+IG1YTLblK2ZacnQ+muHHFTtW2fsPo4+YsM4khlJQ2EKJXJA7UZyAbkh8L9PKTjc8rDv/I4VCQ==
X-Received: by 2002:a17:907:7da3:b0:ac2:cae8:e153 with SMTP id a640c23a62f3a-acabd126d26mr9987066b.4.1744231063960;
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:43 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:49 +0100
Subject: [PATCH v4 28/32] rtc: s5m: fix a typo: peding -> pending
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-28-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Fix this minor typo, and adjust the a related incorrect alignment to
avoid a checkpatch error.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index c6394faaee860427e8b84e9c6df2d8229cf06d93..095b090ec3949e0e8074cc344105daa00b795245 100644
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
2.49.0.604.gff1f9ca942-goog


