Return-Path: <linux-rtc+bounces-5544-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BDFCBD390
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 10:42:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BBA3F301AD3A
	for <lists+linux-rtc@lfdr.de>; Mon, 15 Dec 2025 09:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5945432AADA;
	Mon, 15 Dec 2025 09:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjkvHY0X"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD83329C55
	for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791538; cv=none; b=Qc0NGFvl/nn5P9cSkx8KthZIgOJ5RGxJUY7Y2cKdQWMt+lsUfFJP3PaAPKt/BAlEodwhE68nRWuXPRqykJrvIKuYEGLiZYAuwor876iB2r3uL3fdIbD/7FWabwKjboy2zswDmj/NiAKEri/GUwLQbKs6BG7HOrEKln8OUKLqi0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791538; c=relaxed/simple;
	bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eWZT+XjTsV1OcnHAEc45Q9FmgNRCknWjulz+gVg79Ezwn2Ih01811WQNtLRrsxGhHXhtkozShKSajisy4PITx6tChu6EnzhgrQw00U7CQ/tT5BENPAlecVo4BQsXdUbvqUurIGMCfu/piy41PWHhP2Qagyp5JilxTBGLN6AkqP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjkvHY0X; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0b4320665so17140795ad.1
        for <linux-rtc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791536; x=1766396336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=UjkvHY0Xq0UJy73I/OqNKpoBSQdfFQq4EqazPhDCvXTFAZv6dXFPgoZ7LizwceY3c4
         nOAcliXa6uoVCLHLEFuzqRNfgpDPG8Ha39dKcYpWxQa0StnCCvmPUUJSmSwGO1oFAgvH
         /RTKri5+BrUcs8ZS6rDZpfhg3GaPiNmQM+jdcabWogNkq1iiuQlFhCBzIKYM7y78CcB+
         1pcj8QvNyOXcebiflMSfvNKtI30AcIvyIW03yPFYi++xHj8ZZaGUqpGIK+WMfa2wg4K5
         8vGFkXxARywAmmovJ1legc+uCwA2nLWrReziRO+93oMUoO/zyS+0/wHyQ3tZhcVghsFz
         t2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791536; x=1766396336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pK6jEIYP2YnHjgeCSwjCYgueG0ykJpebH64ci6c2Og=;
        b=rzMYCILixMJQ6m9+8czIVwtuYJM1yxT6tMTkIm+iz3cncyy2gC9JOu4sODY3he5gNL
         S/2xcMZg5jVg9vhBYXnF5Fi6hZsumVfX68WWmcF0+QmihclV78IkwQcZfVrq/Z8L7Oc3
         Ffj33GSEoi7jqJFurOo5n/jAyXLzVUU6y031J9197Y3SOpYKtgfwvWqjPQhPnEZnrC6t
         51MOEbJ3bAmesB5cO1RaXoylGC9b2H3ZVv59AoyNF04oskNZ5fPAH8cOqExn0/9A9u6U
         5iRMlwGf5JHR4r71S5oxFgpLBVkSJ3W7YT4CQq+Adr5ICKlbm/mSnrZvsSH/k2lu8DPi
         g9aw==
X-Forwarded-Encrypted: i=1; AJvYcCUteY18brXhu1xSz7Zi/hNntgT+K8+yvSsGt9MzSXxMC7x6u1753Zy/KI44h1U4PZ1g/beGRienA7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGlL0fkpaTzD4tG4Cfpf0JQgvAsliUMRkzREekpNk+Iq9ONs1
	cns90jkiNwAeblLc8i9kcKpBuby04KoMmb++SzFZ/wgydQk+oMnv4uIS
X-Gm-Gg: AY/fxX62P3UtHTQa6R9/3GhMIW2yR+zP+HWEl9a9llDnBFXr50loHmiC8mCgF+16e3X
	FEz45FnXb+Jwq6vAN/wrQnUxkyFffNhdrwuizbBtNHdsAygc/kGo0s4ukC2qLrPOAiGFiZMVzoy
	Z8uuZPN8L69+nIOOXCezBLiH+CUgnXGhkIVBll/BqTDeoJ7lDrjRkVL14SHA425nvtXw/2IumcN
	caqWmQu53Fm/92spP3ocrqZVMBFJEy6h2eteN7ciGWTQAAU6TIB96i9UACGC4zxNKi6NzT1riNS
	xj0famUypaqIVZ7092EdM66364ZwweNPLmm80QdSeWjJL+ShslQEFsMCFrWkGuRLDcQ/zw7kl8H
	G8Egm7zVKR6bBQgp3XmkDpSSghRu0hmD2YrP9/qyokVrdTStsgkTHr6hxnQGidXHyJMqf7GCNkt
	Zt/DfhZPcoiDhC2As3oZSvh5jj1p+3nO77BouYxZs8LOQ/nNQeWcNK3jzVtNJ5DO3pmCuBMiCDH
	T5C/OdUZpqcp4XxBaSgAKi9+5aj1fdR/h8qJXr/GxdwoHucDHfrEUasuP/5kgvikBaQoRKiplpD
	4LMcWG0bagxH+gyB298WnU6KX3S13Q1X7srw2nQJ03R/uUZ2TIc=
X-Google-Smtp-Source: AGHT+IE7R5Rq59mcZglu2dMbSmwzQA0DuoEDw9ET7Cf1MleDlYYipJlEUwm/OuRe6KJQVxXlQvBRNA==
X-Received: by 2002:a17:902:f70e:b0:2a0:97be:61a9 with SMTP id d9443c01a7336-2a097be6574mr64303105ad.35.1765791535968;
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:49 +1000
Subject: [PATCH v6 5/7] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-5-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QydWi+DoiY9Z64QzfXeb7huM2KW3vZ6y+zBjHRM0skY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215ktRXclLcr81bZJ/cztR0mm1/JFf93fenKz6+6l8
 py6fnM3dExkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKY6uJGR4amuWV/mXtO6mp0XihoUH5fHRSRaVhe2f+TVfXRAQXC6GyNDh446+7P
 CrSess8xtlknsz/4hc33JghmFvFFfQ2ffZbvLDwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index fa7b822d55bd..85410f357603 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.52.0


