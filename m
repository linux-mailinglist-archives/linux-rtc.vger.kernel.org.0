Return-Path: <linux-rtc+bounces-4972-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744FB80233
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Sep 2025 16:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4D42189DC49
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Sep 2025 14:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DA32F5473;
	Wed, 17 Sep 2025 14:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfyTGgYl"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8273A2F3625
	for <linux-rtc@vger.kernel.org>; Wed, 17 Sep 2025 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119985; cv=none; b=Bp89pfOMGO6ynTM9kA607H/Vy2LcAIm30sMVX1UKQhP/BsWDfc88liEUNe7S/CE7YvF7DjhRSx3QBPh8L/bM3O7s6e43og7aDnk+iUFKmfSym836qDrUJjKGbDjzIaRghElS7mLZZZ5MsGPY1truG6RytK2MBkjJXuhmykrlmBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119985; c=relaxed/simple;
	bh=DC3rkPlmT4PS3kYRl8k4hFThmj/MELiF/Zcpwvs0sjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2a578GtyiSuytZhTOx2f3pyg/8GDhVAWy0VLiuNRBbBf2TbJzghVB95Lgti/JFuC7OQdYQeEKGEwNGJE03MP5bw3O6HeXWGV485A6LztswokDKUUpnb2HOtrR2tXRaRxUjU6PGWhkTrxZumP++nb8eLvFb+RY0I1vcaOiR5spk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfyTGgYl; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62f277546abso8427209a12.3
        for <linux-rtc@vger.kernel.org>; Wed, 17 Sep 2025 07:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119981; x=1758724781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=GfyTGgYl9mykyvs0ekcBz8gtwf442OqETMtCyXqL2zt5d2N7as164YX2f0yFXtwYAc
         U8O1MEpheD4Aqgr+hFhSa757VtgLb/QO5dWaDICDILCaqvCkcQWN38giaXam//hhKMt1
         A3+95Q0P/hj+nzIjIl7Mfn9dQVl0fOO1ibtRaC7VAHAHUClvxtmtFgzGbLuWh9Cy3Ak2
         h3qSjY+TVwFyiMrxbOQqwUxtW7td3/cFpti2ebZobmJM22XZtZN8SDYyh1FBNy8tgjtN
         iKVz+ZsTHv7qipwgT1Cr0a4Fq/hBrPMbWUh8xQJBCtFn8KR0kEP2PZ8ymZgF++L1tvTI
         /i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119981; x=1758724781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s17kkTaZCcWVE6nRJp54qyDKjcfVsqKmHrTUTerXVQ=;
        b=LbDq4sCLZw6CiiknZ/23U0zRDmEMxFUPMiWD2SAMwTAsVtvdFMcrFZEz8qOvXZwEXE
         wvfa8n9S6R6ob9SL9U/faZqM6ZAHQY5gWrvt5XLckr1e9tfZEos6WBcEdOzXn2afe1RP
         oJskLSXVNXxeJWGLdpwipXOkybjC5oNXECTBOBD9VJAeLZr2LysNby+S3A7fMYL2GzIV
         ir51HQvK8UMkvZUSChmfcM9VAql0MHlbKd3K3bx6hYASZyDHcPd2mnjfjEq048Kk3ctU
         a8PCEaxgcwwazNOXHQ5/1PdsruVkVxOpDJABKBGUluIr/nCjNaW1OLqeIKAx4FZkXXHK
         8ZEw==
X-Forwarded-Encrypted: i=1; AJvYcCVJsISFg8Nj4aYaLxtruJ5VbZHcZfpaIO32GmVxvYuLfb8KXUkM4TsMLmwUAv+24bSNJw5Ju4oAJ6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZjlwBOVSXwvxBev3RE9a4njzkbxTDP/cGAxy+haVF5fDZn1l
	F3JZDxfxgdM5Ez0myAHhQzu7z8qTkFYgIxy7aUjq77HYg9RTOTcgU5fC5ttFhCou9Yw=
X-Gm-Gg: ASbGncu22F2BXr/5bvNPqyzQbKnJFQxltp98JRf40JxOF5QDZfRI49eKRQpDk8jLBKu
	/vwkgFnE4iNSIvRN2LhFuQ0f9yZ4X0CjAHDUJ7uV2APi0DlzY81SLtqAQrrQLbgpp1bV+RRg/qi
	W8BWStCJpuGKu1baL5H2XWwnuvmTB3IkaH9PNw6PhXd6S9eS8k/qiESIibBHSnZJlaFruER6WCB
	caXPIL9WeVbaMX6Q1zKawHkqAKwAnAMRRNWfF0cNxgYKKwpIZ3LmO6rfihaxrm7qOUOdNHgFtNW
	9/FoR5+0TqGzM02d40VQOXrSAAvprcBP+lpF0bvlcGmiTIcEB9txApaBe57Av6WQzNvOVASa1Wv
	nBxpK2qyZHBjSE85qUNqCiCWxaBnFm+6wm3iYzu/KLVjFuZkolb1zfmASO8x7JEOGijyLf0fxKt
	qpvcrMwJepfZsg
X-Google-Smtp-Source: AGHT+IFXXbiZNTejLfG2Ic/gjctCmfZhP6Kg2iU0trw8lOnTpDVinvHQd4P0uv0W+EXh929oDvH+pQ==
X-Received: by 2002:a05:6402:42ca:b0:62f:4dbd:9b6 with SMTP id 4fb4d7f45d1cf-62f83a3c5e6mr2581137a12.14.1758119980663;
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Sep 2025 15:39:32 +0100
Subject: [PATCH RESEND v5 1/2] dt-bindings: clock: samsung,s2mps11: add
 s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-s2mpg10-v5-1-9f9c9c4a44d9@linaro.org>
References: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
In-Reply-To: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
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

The Samsung S2MPG10 clock controller is similar to the existing clock
controllers supported by this binding. Register offsets / layout are
slightly different, so it needs its own compatible.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
index d5296e6053a1881650b8e8ff2524ea01689b7395..91d455155a606a60ed2006e57709466ae8d72664 100644
--- a/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
@@ -25,6 +25,7 @@ description: |
 properties:
   compatible:
     enum:
+      - samsung,s2mpg10-clk
       - samsung,s2mps11-clk
       - samsung,s2mps13-clk # S2MPS13 and S2MPS15
       - samsung,s2mps14-clk

-- 
2.51.0.384.g4c02a37b29-goog


