Return-Path: <linux-rtc+bounces-3758-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB73A79F6A
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 11:03:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81AB11893296
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 09:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C1A24FC08;
	Thu,  3 Apr 2025 08:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sKCadj3y"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8C3243364
	for <linux-rtc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670771; cv=none; b=rcIz3X9N6WuCrzmgZ7RhqnXqBUj7PxIPPPFIwK3rT0IFgT2YX3mA/Ez/JqNgsC0O3DuLzbYkJ5Xup7Usz8TKLk8qWPjjVcNeBBCNMHpTluLtmAbTVKNbh0RU7kEZlerPo8c9OiWwPN13YSzOAreF2vxsdk7TgeLxhY0eHReu+Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670771; c=relaxed/simple;
	bh=+fAAJ/+/3MbgFo3bOsjQzn5S6tmp2xnmlCT4juP9rJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tWX8JaAxNermv4Gi3OsLG8KOSwUE7EPYo0gBTzOWLBJWAtjojmNMyL7jfmfvcC5Uthb8sL/t5NCQZOI+2ig7OrJwWbjnXkMghgn6n9TvzhvTCwAWJSeARR/QoNOsxoTEwK1O2EhzXmAyXMcRUzwziw6bINdzw2ahd9uaLOoy1Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sKCadj3y; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9eb1eso1220916a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670759; x=1744275559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=sKCadj3yJo3JCJcQbG8ljCh98ao0jmPNWJjFoo/83PbHsIxh1WRJrXCyEFNnjHnnaE
         dUnPsC5DCafvc49EySVtc6597ytJncgH42PRCo04bQmbkSfbIK8oOz1gxmGqWtISnEP9
         Y81Do0JzErnbwsdNRiAub5aQmyDszrvT6IHnEJrMu+1HIThiYzIVbUWrNYO/s0sU7+qz
         K+J2UMlFbL96hqJRIuonbrQU/oO/dJBnij6zsYA7161bz6kXiOSV0cWg/KcDTunezmP2
         ZrjZDHF2uyeROZ/8ugTOmcsHo+sKLhOhcfPy82/jB/eKIoaIUD0ra9VN+O58Y+igJE2w
         fdYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670759; x=1744275559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IvD3NPE37fI+ZqUrH7EmoQBagetQaG70If7tawsO/t4=;
        b=LlvZ2Gh8qvarv6IvtKVTlIShuwoSMHUmqwmz3obUJxPZM/4S29x688mHgck2YW4oTa
         CCzzFirTPeP0xaFg5LqDAxXPzl4oAYWJ1CR6PlZ/eX/VI2wvqfsfKdpnM1wPf0KR8wny
         0PrNHwJ6B3vCiGa7bNyzP2THpX4moruHBOwksKR8jt3n/nUjwKMX9igqDdpL4Effny7H
         O6Ir9eXaa0EDWyqPDzzzTZtQzaNhMOOUpkzpiD6mtsoX5+Qwsy4YiqVj+S9h5nd2SL1X
         33WukzODkuxJb0x2KRODWWFcXn/SJpMuU1Hc/YZPgayo7t50mTHgJ2t65hTpyKZyUgHE
         rtgA==
X-Forwarded-Encrypted: i=1; AJvYcCXHk3z1pEkXxRt3bbOHRFv+J4KnXEy/4hdIgWuXF5Mkh8q+SymeZ2mXVu8YStX477C0JkvGSjQSmZg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYhQUNOHf78roDkBRdZcJZuZ5b/4YaV7pa2vaqviYtR74yPphY
	KBkJce5V08wHvgyyAgMFLOHW/s1tR3m+tlazba+FxdPA5b0ehXeo+/jnioVMNAs=
X-Gm-Gg: ASbGncuQq0Ep3Ce5bHLnoOwlV1K45o5iJKCy2kaVUj0clVsUgDnbQ/A2ncMYqaVNWdP
	PjC9PgTdkbDWxebVso2ClpkxOhjHP/gjOqLGnYoK6sTjSG+v0QwHKIAOOIN9ndNmKDljKAGu5LN
	csIpgoT6+eh7L3o/7q21YLu69zCfrpDaxookn5L69Y5ykJTQDjE5yLWJVKDj11b34p9IYN68alR
	h4OMYlh3i/7HIRR7a1YrRfVclATyK9NjRGQ0CiTNqBIxfxgO15394cv4OqvkEgYmzGqHdsLZPy5
	ADn9HOXWg5f3alvQl0iIAydgXxcveIphGuc27NpWI/dBlBinMIg1LG530fJUXvGNb7sK9wsdn/a
	m8a852S6lVyN9zigafcTI40BTu23+pSZ3/nBQCAU=
X-Google-Smtp-Source: AGHT+IFW856PFsje+adb2s76FgPUdBl97yj4uiiEZ9rOztAG85/+V2CgHnNshHz2zvEqYifTEoo+Rw==
X-Received: by 2002:a05:6402:1d55:b0:5ed:5cf6:e168 with SMTP id 4fb4d7f45d1cf-5f084177cb9mr2170046a12.9.1743670759408;
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:19 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:24 +0100
Subject: [PATCH v3 32/32] MAINTAINERS: add myself as reviewer for Samsung
 S2M MFD
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-32-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

I'm working on a Samsung device which includes this MFD and would like
to be Cc'ed to further contributions and help on reviewing them. Add me
as reviewer.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d4d577b54d798938b7a8ff0c2bdbd0b61f87650f..9f05af52b062d8cab0f8b48b2625432108604c3e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21397,6 +21397,7 @@ F:	drivers/platform/x86/samsung-laptop.c
 
 SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS
 M:	Krzysztof Kozlowski <krzk@kernel.org>
+R:	André Draszik <andre.draszik@linaro.org>
 L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained

-- 
2.49.0.472.ge94155a9ec-goog


