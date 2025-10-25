Return-Path: <linux-rtc+bounces-5157-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF9C086FB
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 02:28:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6603AAC66
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Oct 2025 00:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8611E5B73;
	Sat, 25 Oct 2025 00:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4nrRPYA"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6031E5207
	for <linux-rtc@vger.kernel.org>; Sat, 25 Oct 2025 00:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351965; cv=none; b=lNndjwSAKFVVchmzi5E3nXClo9IA6QK3L5S4reei5rcnyA6WRpRvxI+cwtMTGT5OSGIMWZquvXBUjStkVk/pauc8C/7uiRFkmG/tc2Ua8uEcXN2VtqFvZvK2ZxiDj88CT716PRthm/iRGLHjrx6oitIjKt6PIfxiMEX2U1Qm1OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351965; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OnzVE54FGaW4dYANi3dEz/zEloB70hXGBdEzkR5rLLVF7A820I8wnIOR2wOUQ49M7gKXBPJMybL3ADY4OL0N2dZM303spgr4CoGlLiHLS9kKIXjj4Xmfa6AWpJVyB/qH8fAl7pRJoNajAu9YizCJ6ZtVFYIv/DFhgYClMV/JPbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4nrRPYA; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-290ab379d48so25537135ad.2
        for <linux-rtc@vger.kernel.org>; Fri, 24 Oct 2025 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351963; x=1761956763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=m4nrRPYAqpvCSL3yZqRfzxNRxGeBAaJ2TXYKZDbuT43XN5SXQI/ymCC9VrLWsE9nDH
         MsiBtK+gZrxEDoXb1NTsXjdoqa1b0mQvN5kF1oCn5pdlJJIO7zxG/JAZdz2bd55le83R
         5Xc8ESFPlC7704BHUb0JgT8nnZACn3r5ElSTk0cCATWSK6sjDTYbw61tUNxqAznyzVWJ
         eJuB+uTmLwwMh7nQGpPbxDgd9aWtAPGiz6d6tetmS/Y0NFXqNElfro9V+L/xnl83FAwv
         4rhx2ipnVzXGxl+Slmk3vPa4n/jFUwMK2uTxYFNZu4CbaZ5cloh3SBR99Rh+jkv99Tav
         2wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351963; x=1761956763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=qgHJmELzMRHGTmW9Kz8p1t9jJ4PHt80vo7aj8xm2OAaY4AObJWy16ew46DnTsH3xFu
         6IPtQTeUK4Kk8ir9EVvMyrTGzVYybK+4cyyOMcUM5QpL0ybssshGKvbdrvSDR31bMXla
         SwsH0a4Kr2zAUiCbfFyu9AN+WcCgbBkq4TlHWIjLyKMC+qhCB3vVamfPXvYU+P6rHjQn
         qR6/lo+clnvc91yfhlLzONZSdM5KErZaHK/R0tOaZJJV/jPO7A9XgzKeiEN6kKwTdB9i
         pJllc69tzyAQOUiRQbXCoQkkdxcEZ5VgSMPOTHuL/6+++047RR9FSy+cXjyE+cOd+v7A
         Tv7w==
X-Forwarded-Encrypted: i=1; AJvYcCWu23QGpd/0HFhZaorpy7Nhg7NKhb835XWQ1DJAaXndR675jHkDo4MEH8aBSCdD/6M/cRcNUqaYFQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwdNvDPWHfecyF2WpBwA3TqIfEgfZDjSP6ZDSLWqcdFUyOXudU
	2DEB+wmnroOvUYQRdc8XsdJ3o4QOrHFFlnHLY+iG40YzlB8J4bJjvmv8
X-Gm-Gg: ASbGncu8iy/e4e2SjL7gE9xrnSTeQorTBwWD4prT7pdP/dmPL9a9rfO8oQoVvdd1Bgc
	H3R1ccmW8uBS+h+TZJoHheqMtJ+cv2FmrU/saFRdLpltzMmULWNFvTyA1bz0uY4afl4f0fUWCr/
	nZyPD7eODV6DDlLODtHTgr6kAbEhqXQJe3vL6P6EmgYQZlcwW63isebn3WqHtfJX6dd52OUGk29
	+o7p1CnlkRLbrI3Y9jq3vgSGOpgXb6C5G3u8qYdys9ENtEY62P2KwvWxQ5CTrnrrCiZwc0Ud3SX
	olXFilmkB8MHdm5lsuf/W7AJ+nZeMCG7uIFEay1dys27FQdFf+ytoWV2sOzpvCnTSpOtLUMZoL0
	NGXgopcjK0/hBAvEs3EKWXonzgdUx67K74A8h7sP64JxoraYBfwZW7qNWlaIe9tCqAt0wBi4d+f
	S6JBpQLet5EhUhPtzj8GUfLKmlVM3kzZsb4wWklPFGt0XQJSpBiACcdrBKQoLN9Xyh4buWuU/CU
	CSzi6UZLMVEtEOfEOqMAmdU3QRjrY6mKMhHsA7SOB39pHPl65oLlg==
X-Google-Smtp-Source: AGHT+IHSa7MdO+RyudQ13l7ZBDW5YjuDQoXfBKNGzygwW/8ijBbpH54bUrATc3DfIp5eGwuXkgv2HQ==
X-Received: by 2002:a17:902:fc44:b0:26d:58d6:3fb2 with SMTP id d9443c01a7336-290c9c89697mr387774495ad.12.1761351962920;
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:26:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:40 +1000
Subject: [PATCH v4 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-9-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM4d3hJqcNPewfPwlleiK7fkXZLhtVltl2i2UGbKY
 wMxq6iQjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFQ32DP8D1tQvEl5SoUQr3Tpeel9LQEufdveGjjeWpK55erOQgadQ4wMBy1+6wZ
 LhiSptYttjWV5voFZ8fr10xZCNt+PsEww+B/ACgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
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
2.51.0


