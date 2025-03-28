Return-Path: <linux-rtc+bounces-3669-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C912A74AD7
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 14:40:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD423189D81E
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Mar 2025 13:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DFE02135BB;
	Fri, 28 Mar 2025 13:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwZQMzbQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCD519C553
	for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168660; cv=none; b=BaOLh8CazTuN/JQ6R9rkwUlxdI7UBYsHpt8RmRFYiC6dXVNnuONx5VYq3yXm6YrftcDca3g9Ry7p71QdsyTPCxXX6oFAItLYfnb4XW5RriLUxzUsurKgZqB32d/gMF/cjK58in4E/7blqEbaz0uQgNT0ArXYxERPVoYvdlHuolw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168660; c=relaxed/simple;
	bh=GY5aflUP8HyQZVCvYH781i7uGwHWsWCKLpX/UgZ7jiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nhk2QGIwnZtWrlXNJGykQX2XEV6pztRS3KfqGvFQ6OrXgKpdW6e9r6aa4trxAiF+b9qedMw3fHFzKk+vntAmL/lqgbXrS0Rgcj7QUvtY1cU4i/RBaEXBt71wxJPyI2rCvwlFjoEAiyR24t30Gq229P86HHa1xhYadsiDZHuHzzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IwZQMzbQ; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e677f59438so3356387a12.2
        for <linux-rtc@vger.kernel.org>; Fri, 28 Mar 2025 06:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168654; x=1743773454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=IwZQMzbQ4UoYCS7reOD2Sr1a1Dpzik0SCnLknyGcbCU4VFuq4DTmeCYQ1RB+eRSwtn
         o9pvnWYHuQDyupsms3umIbLY5ybOpPTMbFDf/85CV1GClcCL68Q5PG+Tx+ih5rWyC4hf
         imb36fhw6AL62JSZQ/X2VTo4t/bx0w5PMMYPiMXUAsBpHxjpsafCHvsjbgxYFWjT7IP3
         +R1G+qqdouHP815bRbiZCdWJdM6vyHl9xHCb47SG30f+RJWY5cJVoGZOyhXLAwik0++3
         BDRHAjNzoR0Q4Kfr7kzRIgvVD98AVtvSo/uBzB/5jOyrbykuHdCpH90JdfLupufu91oU
         6bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168654; x=1743773454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r/wEh4QmLnuluQvbcZ6Yqq9yXOMvoeHgrUwhyH2g5L8=;
        b=gOm44WyJ23h4r4C+Xc5LRz8mpgFu4Uk0tpTTlAmQmIr2EzmSip4Isb4HAAM8tV8sGF
         4dq7xeGHoE/XbE7zIBE1Y49mE9rAb25HmxmKZmNJT5F9UN73HFhR3+uYMztJqw0C8hne
         bNx+tZn2x/IuWtxFwvl2lLKPgZmdpnkS1fQun47MjC+GmUyn+q/axQvf4U7v51cPK2/s
         49/U4NpdRXZOtH2urV89qnaVDx4ddqnRIL+YY22ydIpwqP8aU4ZFLXMY/8AQ3QDYggUw
         Hkax2k5tfpuXGalchVpf+hv42qUD1nOc/2xfvYgqePWn6VedmMsQOLJpvZGOqOSV5AbV
         oVQg==
X-Forwarded-Encrypted: i=1; AJvYcCXNWijLgpljcHhXepip4jdpVZBXogVd98qMIxa4/EYKy9YFDDouR7rzYYmBrHzS+fG56lYqkdDNLsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH075sIEq9N2Pc3eO4RgwQ6hFKqgQ7KwjZM/LQWS6NjpJ21Ql9
	/z/fRXW/PaUlA//5SukmpyD8HQv/cZ/jr8b03nWhc4Lm1DARgnPpK5tUqlUjqRU=
X-Gm-Gg: ASbGncsYXWRXFqiuSABqJvnuaXSRm/l1pfvAoKVJwp1M562TyY97EqwxG9aSPb/bdOy
	LoRVv7mwIaFv4QQmVsriKhhuf5WSF3nlFGbKOe6L2i2vo59PMi/L6v6kGpsJZu8U2raQZl2nwiS
	LPAkfv3Y1tk9EAklGdAc0aI9WgTBAcIAMsIHjMBCWYZuONlcCwV6G+vpML2EvqKDBMZEkthetgr
	eNPCVGu0Ede3wx0MOKey+Fv12tMC0LnNHkOM2ul61UZ+BGkf1fHrCv/Pe27RpIJjIM386PgU0yS
	pohIzYAswWTh+f/U48zZSgirG0ekSkZfpyzSDpFuDwgQZ5SOeSSGnYqPg0yrrvnjNqoUy1jS78a
	rk5/fSOp3JiLa85KP4L0hm7eWwpKL
X-Google-Smtp-Source: AGHT+IFNlBH/xFV1TxcoV9Ofat0bwBhbNapLP3kxW0K3XFCOMqRnzn5sDn6+P7lNxf9DYLlCo5zX1A==
X-Received: by 2002:a05:6402:3492:b0:5e7:73ad:60a2 with SMTP id 4fb4d7f45d1cf-5ed8f901fb3mr7761660a12.30.1743168654052;
        Fri, 28 Mar 2025 06:30:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:30:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:28:48 +0000
Subject: [PATCH v2 02/32] dt-bindings: clock: samsung,s2mps11: add s2mpg10
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-2-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
2.49.0.472.ge94155a9ec-goog


