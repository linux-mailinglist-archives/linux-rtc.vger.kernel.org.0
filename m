Return-Path: <linux-rtc+bounces-4795-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE525B40D14
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Sep 2025 20:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FA081B63808
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Sep 2025 18:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7ADB342CB8;
	Tue,  2 Sep 2025 18:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz0HmcV3"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0250334AAE1;
	Tue,  2 Sep 2025 18:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756837374; cv=none; b=gWf8/+QJMWI7YIQeSj8dENcpFqiyj5ZNiuFawxSIk0MWsTm0TW/I/LHFHQwFdC/P0KJ4tg9D++D3zY0hn8ZHHkw/w169X8I79T+LleXP1hWSWU3KxljaCOmUgYQ9Nj8lMBH2PCqPItrLEx9g+lr/HmA6gS7fiGr/MRWkplpgUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756837374; c=relaxed/simple;
	bh=zeeWJadlJgHk14gsEbJSMLNQQhZLpoRRUKtz+/TtcZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzaOp1aa7ivw47DIhiRMLGLy6VYiZ3QnFPo9tcq9p5RrKsezEZWi+Buh2KdonOTwnNGlCgzkOveYSMyOLeV//6mdWaHimHgiiy0DWb1Mg9N8HUSJK3fB0KKINZuhpEFnL1bnkTVYH3jTN4YruYX5peLWw6+BQo+rIWsaaUKTtSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz0HmcV3; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0454d63802so170718966b.2;
        Tue, 02 Sep 2025 11:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756837369; x=1757442169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=onxf7BI9Q6nHuy72iBEoPKHI9kMyhZuYmF6ufjTnpI4=;
        b=Gz0HmcV3LuRp06HYRCvTu5mj6ojGaKIlq6qAn0Z7320DpNzx/bjeBAX/Z/usLHutHY
         sISlVNBfNb9gX6eNUgVz6ULVGRRsmamu5eJobcuWi9D/aiCifILm4RzZe/+ecq+UJOcj
         m5wCrB6bUCB/ZGlVCbNhaWga5O9upsB3+tg/rodZQfhlZg2MAqdUvPMjbK1EN4OODWfo
         hAPq2RThqUCKhMvZG9GLZ/vxhOvTurDL90XtPP/KmOkzeTNUUVgDY5oXiSRTCG8uzDnk
         jsIIj79SW0iyNmPVwf/pg+APh+PPlycrUGDe8+T5FVYQ8t4EUzL4LvIzfRTJUotD8HU9
         TvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756837369; x=1757442169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onxf7BI9Q6nHuy72iBEoPKHI9kMyhZuYmF6ufjTnpI4=;
        b=N1DXVBkGA0DkF3To+WENlOaVtOAsl2AU+Fvoj2swz/pqK8ALShWllwE02Yq4kDcGaC
         sF7RrRhG2cAHQdIqPAl4+7CNgEEkhhcv0dzz2DlTR1KhgNkGXHmlJhWEESgbypkMmPzr
         TfpOQ/q/CyYYeV6wTvzGpfC0Hc66xzdN9I2eGzZdvQFDK/yqB8nO9JqZF3bzG8K8FLIA
         4ORdnG8tHQGzq8J1lz9wEemfIUrbIJ0EQ6jfY6nl8UC+ekQgLz4Twi+KYkGBMi0/gPEI
         9Jya6h5oIbfgb4ON6iaNG0bW9LKDN/cSad5aUOHM7iHMTQej0zZD+FUNSOdhfgBseN28
         Jfsw==
X-Forwarded-Encrypted: i=1; AJvYcCW2dUVKevSzx5al3vZT0koRgcagF7STxWbNnpjbjfXY9bKPddOeQyXy+TFdnrCsG4pp+lXM5aaMFkvFCxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDBm+Qu2nbLuxJyjclC48uDNwQvmF8YVL+IFtPfYQOOibWFT3b
	7VAo9ApTrUhFZ0xqOUkPupS3wBWPBobhgHUC55jQ1vXO9OrkuSf7jgzwsLJVLN1/
X-Gm-Gg: ASbGncuU/jKM29v6J6qrEISLGfTttNXkZGatpwMNFsqQ7vnutvBggPb/N60sih52FVM
	GUxXX7vWl9c6U0ggKdZu1v4IS5ZuWGvr6UkpHZ5ukXLAFw26HxJFpAySE9yK/AuJPov3TBz+IQn
	tvQUjvFp8JEzQMEIjR/wi4KWtPTGU2GNWak46ehBsgYsoncQ8kJyqR+6QmRHvQZnBTWGAk92q/d
	ut1Lx4X9MTQ5ztNuAJaE0ds9yZXr4Ww7kQYZqYpv0h9vQIBKkywu+CcnE82MJoQECivJaftLbwP
	DK/kpKlxyvE6PpiVzjaGXim37zHm9qjQSz3dxIqRgyR7rDpudkZdy9OTyu73sNWa3ZnWUkJBA5u
	oUh1LYVK2hE5H3OJuM4ptSezHh9VGJH7K4xgqZRSWuS74aK4RJCmXuDvntNy/6BmwTTB4bZpan9
	5fFiYYzwHSxLQqQfM=
X-Google-Smtp-Source: AGHT+IE0w2MWQc5FwmPMrX4rJdQL1Gz7NjcCAmW2jRw68pZqSc5/YgWEliZISbDzH8p7+CxyvjDYSQ==
X-Received: by 2002:a17:907:bb8b:b0:b04:1d07:40de with SMTP id a640c23a62f3a-b041d074816mr875843566b.23.1756837368690;
        Tue, 02 Sep 2025 11:22:48 -0700 (PDT)
Received: from fedora.tux.internal (85.191.71.118.dynamic.dhcp.aura-net.dk. [85.191.71.118])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041cef6b4dsm662698566b.65.2025.09.02.11.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 11:22:48 -0700 (PDT)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH] rtc: pcf2127: fix watchdog interrupt mask on pcf2131
Date: Tue,  2 Sep 2025 20:22:35 +0200
Message-ID: <20250902182235.6825-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using interrupt pin (INT A) as watchdog output all other
interrupt sources need to be disabled to avoid additional
resets. Resulting INT_A_MASK1 value is 55 (0x37).

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 2e1ac0c42e93..5a39c227203a 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -606,6 +606,21 @@ static int pcf2127_watchdog_init(struct device *dev, struct pcf2127 *pcf2127)
 			set_bit(WDOG_HW_RUNNING, &pcf2127->wdd.status);
 	}
 
+	/*
+	 * When using interrupt pin (INT A) as watchdog output, only allow
+	 * watchdog interrupt (PCF2131_BIT_INT_WD_CD) and disable (mask) all
+	 * other interrupts.
+	 */
+	if (pcf2127->cfg->type == PCF2131) {
+		ret = regmap_write(pcf2127->regmap,
+				   PCF2131_REG_INT_A_MASK1,
+				   PCF2131_BIT_INT_BLIE |
+				   PCF2131_BIT_INT_BIE |
+				   PCF2131_BIT_INT_AIE |
+				   PCF2131_BIT_INT_SI |
+				   PCF2131_BIT_INT_MI);
+	}
+
 	return devm_watchdog_register_device(dev, &pcf2127->wdd);
 }
 

base-commit: b320789d6883cc00ac78ce83bccbfe7ed58afcf0
-- 
2.51.0


