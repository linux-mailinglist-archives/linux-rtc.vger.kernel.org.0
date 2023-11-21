Return-Path: <linux-rtc+bounces-334-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684737F292F
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 10:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F3BF1C20DAF
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Nov 2023 09:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15E23C06F;
	Tue, 21 Nov 2023 09:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dIGe7189"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16B1C1;
	Tue, 21 Nov 2023 01:46:47 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6cb55001124so1815392b3a.0;
        Tue, 21 Nov 2023 01:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700560007; x=1701164807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo9/VOIG19hh7iNX6wZ64Gh6cIWZUBNjjynlsiQtTkk=;
        b=dIGe7189M6gsyKf1XCkYj4rl04y2gtvBvaK0FogUX28qQ7AApREE/ZEReGMKvrCT7m
         zstfw9rwruINFN2KcoaERzZx2EkIeAfgjD6SiZZsnQwNIW1qHDs8Ro0CbBAj5w3L/xwE
         989u0Maz6qwU337R2wRh9kPccDKYw+t1Q/qIwndN+wj+DGb1QRc6/U48J2EI6uD8cP1e
         4jMmdKM/588PVOuih+ot1ZRVBsrrzIlQCn+x5p7AKigYdT20mGWTx4qEZUS1BnrDsX1K
         J9RaH+jl2cPWx6csHn9Csq8hbMnsxJsOVdTRE2OHvofU9GZydddXmKTCarv8F8bSUPEz
         X9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700560007; x=1701164807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qo9/VOIG19hh7iNX6wZ64Gh6cIWZUBNjjynlsiQtTkk=;
        b=luHJbHgt2QKiige24Mh0Zv8gjk5RilpZJkbSpnLOcSzT7wBKW68S8Kw4AkgBu1rFqE
         aWtmwRp/mGBojgQCmsnZV15P7p4YxFzxg52h1uKmdFI5UFDyHj8gi/TUNnzggBvN4+Xp
         wpxTNT9zt4mWOy+hmQIsdDcZIo9fPJeFm9MPmoNYXStLLOQiE5JV+Xmm9CdypptmAlcE
         f8p7uEQSExbQMh9Rfbpcsy7xH3S/GErl887NL5NZUmDKYoVf99/jt26pLfHo3T71Uco7
         3LTJxMRarzZs83fyFL7sHO6EZmEZ06W7TOjJOsR0OsZ1DsyeIUH4gytLGn7Nu+oYpdn1
         5IjA==
X-Gm-Message-State: AOJu0Yyx10U0MWZNvMnXCQly3ANJ6+GiKRLMmnGrWO4DhNBXPrQDKnz0
	p95fqqFlq6FYmNtDST+0U8E=
X-Google-Smtp-Source: AGHT+IHS9fuH+VAeejTqULbKOvKrRWCK+Pqp4LFcZo9FRZm/ym82Y2lX4UKSB4Y7yIPuDLI9COauNw==
X-Received: by 2002:a05:6a20:7f94:b0:17e:8dfa:f37f with SMTP id d20-20020a056a207f9400b0017e8dfaf37fmr3334255pzj.18.1700560007158;
        Tue, 21 Nov 2023 01:46:47 -0800 (PST)
Received: from localhost ([2404:7ac0:49a7:269c:2894:5c86:a553:ed6c])
        by smtp.gmail.com with ESMTPSA id fa17-20020a056a002d1100b006cb907e8059sm3680101pfb.9.2023.11.21.01.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 01:46:46 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	krzysztof.kozlowski+dt@linaro.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH 0/3] riscv: sophgo: add rtc support for CV1800B
Date: Tue, 21 Nov 2023 17:46:39 +0800
Message-Id: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds rtc controller support for Sophgo CV1800B.

Jingbao Qiu (3):
  dt-bindings: rtc: add binding for Sophgo CV1800B rtc controller
  rtc: add rtc controller support for Sophgo CV1800B SoC
  riscv: dts: sophgo: add rtc dt node for CV1800B

 .../bindings/rtc/sophgo,cv1800b-rtc.yaml      |  37 +++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |   8 +
 drivers/rtc/Kconfig                           |  10 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-cv1800b.c                     | 293 ++++++++++++++++++
 5 files changed, 349 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800b-rtc.yaml
 create mode 100644 drivers/rtc/rtc-cv1800b.c

-- 
2.25.1


