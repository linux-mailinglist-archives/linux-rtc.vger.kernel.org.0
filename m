Return-Path: <linux-rtc+bounces-5373-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BD05CC5CEBD
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 12:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 03D56353C3D
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Nov 2025 11:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC48E3148D9;
	Fri, 14 Nov 2025 11:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tV0ie2uu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F82D94B7
	for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 11:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763120846; cv=none; b=TOtOCqk0whqxsi+Humf5irbipsblt6/51uKZB0pEsfXh+X2kKvvN0gEYdj361KljdvLA+f+PplavnjqXAfxdpZPMggDlZha6v+2skXTUPl3+eSwITGqk5a1d1aIfyZ5+T3QcD+AcU3vqjGtw/f7+JUSxCjzG08bvC8x3houvBIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763120846; c=relaxed/simple;
	bh=FmJLj2gjTlRUIVzX5Hg5p/BaNu3xSopsXsqdTo3WKhw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eeYy7IzQxpqRsaH0YWqWYv4OvzPstNff9TRnsockQ3irXVcX2r7zivtSZnmnnwzdymldhFPnU0WJMSWSW/gwOuiNybeJWqedlIZBvscJesWhvE51pFFgaRBjCISVvvu+lcoEJqgskKQofHfVvTboyhX65hBzh4xhJcixrlUwQbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tV0ie2uu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so2652343a12.3
        for <linux-rtc@vger.kernel.org>; Fri, 14 Nov 2025 03:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763120843; x=1763725643; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3+s27uAymnJrt4l84jxnUee+ZrUHMdiTsQjpcnX2dO0=;
        b=tV0ie2uuzIES5zySImNmsXvlzhnoAoEz46ppIqlH6bQTPZoAhrtOPzABj66ai8FNAA
         QNZGIGP8uQFY+cf1LAER8qhhPkY9Rj8bnPEfdcYKQHRAzUTFf7rSds9rW20V5FIQxx6e
         UQBQ5j63OpnVRJRw9rG29OgY6nGU1GXMN7XeDU3ffW/i0+W/JxjtdarOw6QWMPOxnRFW
         Ju4FDDBnjexjCb885teG5lGI8hWCQTh7ctiAWoYyjNAxv9Y+Fz7+Qq3aTiSIx1d6fj/o
         a4pQao168QBcTq65u460EDyL5tKTlEKQti++5bByRS4zJL3yHKJcU/FjEEhe0GAoHoP0
         7Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763120843; x=1763725643;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3+s27uAymnJrt4l84jxnUee+ZrUHMdiTsQjpcnX2dO0=;
        b=JoJI0D6vCDQSlr3gog7ryWH7bkSw8867qjyvs7OhaV/pMJQixhlKhwEBlhg6RYY31H
         qDVsWYalRUZzt+t/F80iBQ7otu+aZpRcDwzptGeU3jPqT6/R9E4gGSoRZ3FIyS5xrUsI
         r017OPrMGJvTJkJlp3pBnopoiqWnz14atjyrbqBfa3LRwE+VSkaHqeR7UqG2Z3/X1xSS
         n/PMiZIULHOtAeaX0+pvaNXtXCWmxkN/hmx8F8aBzSUhBmxh4dVF/pxkHdedzVCQbRng
         33LKx5bnZMwD9BFnn1/w19rEg2Z0+B7+iXgwlsDwPfkVJ/6hTfHZBcdyBSWg/0QGxFxK
         ADiw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ok/JkSy1hBNUyxw5d4XuavDx49vCUGK7WDp5kWtB9iOUbNbTe5BfyeETRdJZB+QnZBb91+od5w4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyB7Q5D2E1eeWC1jxbTBdsEWGCHsPQDd0e8HtZHzwe5pQwd1Dhm
	YduFXHuKan6yqWW0jAva1OKz2Auuqx02J2IMHY14thW7+rMGbHHdcW2R1L1vm1CrK50=
X-Gm-Gg: ASbGncvPmkCI+CsaUHu0FsiEERmWjsEaJ1F/70tSJY2by5jn8UGOjAiIK0+BnLfPlVu
	2hEaIJ6LQ2s8j0BjmxeXuyG2ABI0/RWDPNrs5YIIe309aNqHPLBGpMG/s3C9CQzEqopra4RC31/
	ZgVfsv4NmhhfeJsgtI8jVZDTD8F2EiYDeEcK61BNERo0tcA/IlGJr4W77TJ0hQpV0xXgeSPa1jL
	EF53hV/9p4B6qsy2QXlPUQeFr+8Ny09TDLFPQkNXS3UO9P7ja+WCzxn07ucssQOQrS2oj5U+QoJ
	Ze5D3j/gU0LOLJt42nVPxVEcmnYO2dRoffUvtu6gTXzVBW7cnbqsSB4WCotNJQr2GWAbZdC9kyR
	BXyXsGpioS0KLizxkLnZw0EfkN7/R7PlajkEtkp3TUulaJduzMZ6w/+D1Rdeh+FMHmeK9uHNLRr
	+780OAfxHf0fKsTO2K/z++Ta24QK+KdVwPQMOjzTRgUqHU3ZEWWJtx+UNCcWyOcDYlsAA9C5mpO
	gB49g==
X-Google-Smtp-Source: AGHT+IHPnTCBO5JG9atXjpC3DFDHuSHqyX6Plx6mhaARcdXOJUR8ud7LCgaahGyg0RloR+HqZ+3boQ==
X-Received: by 2002:a17:907:7f20:b0:b72:5983:db0a with SMTP id a640c23a62f3a-b736780c56emr277846466b.15.1763120843119;
        Fri, 14 Nov 2025 03:47:23 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb11d94sm372950166b.30.2025.11.14.03.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 03:47:22 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Date: Fri, 14 Nov 2025 11:47:20 +0000
Message-Id: <20251114-s5m-alarm-v1-0-c9b3bebae65f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMgWF2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3WLTXN3EnMSiXF3jlFRzA9PURFPj5FQloPqCotS0zAqwWdGxtbU
 AZD0St1sAAAA=
X-Change-ID: 20251114-s5m-alarm-3de705ea53ce
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 Douglas Anderson <dianders@chromium.org>, kernel-team@android.com, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Hi,

With the attached patches the Samsung s5m RTC driver is simplified a
little bit with regards to alarm IRQ acquisition.

The end result is that instead of having a list of IRQ numbers for each
variant (and a BUILD_BUG_ON() to ensure consistency), the RTC driver
queries the 'alarm' platform resource from the parent (mfd cell).

Additionally, we can drop a now-useless field from runtime data,
reducing memory consumption slightly.

The attached patches must be applied in-order. I would expect them all
to go via the MFD tree. Alternatively, they could be applied one after
another during multiple kernel release cycles, but that seems a
needless complication.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      mfd: sec: add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: drop now unused struct sec_pmic_dev::irq_data

 drivers/mfd/sec-common.c         | 41 ++++++++++++++++++++++++++++++----------
 drivers/mfd/sec-core.h           |  2 +-
 drivers/mfd/sec-irq.c            | 10 ++--------
 drivers/rtc/rtc-s5m.c            | 21 ++++++++------------
 include/linux/mfd/samsung/core.h |  1 -
 5 files changed, 42 insertions(+), 33 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251114-s5m-alarm-3de705ea53ce

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


