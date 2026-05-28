Return-Path: <linux-rtc+bounces-6583-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOduFq3lF2pLUwgAu9opvQ
	(envelope-from <linux-rtc+bounces-6583-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:50:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC675ED664
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 08:50:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB8A0313C886
	for <lists+linux-rtc@lfdr.de>; Thu, 28 May 2026 06:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7DD344DBB;
	Thu, 28 May 2026 06:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="D63Ay0DX"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA20344D82
	for <linux-rtc@vger.kernel.org>; Thu, 28 May 2026 06:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779950916; cv=none; b=LHJp0U+hQdPOKCncxFLYAPuB7D5J95QXCOiRuD6VVlORdEvBnCNley0dBeGWynXYEuDM5HWewQyJubIX9yYxsnFYY0nweXaLSp355hbou6UUjQxegVyc+gSx6CORGrJgQdwFn5FDUaqDHJMxggA6Y8YAqwvMEqx+quEZnzon0bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779950916; c=relaxed/simple;
	bh=+LFo9k0HRw6kn4T7KNhnuPjSjM4RFi9qqPjEn5O+x7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FwmLJJpk6P78kAo7oUC9AqYzSBszwscZ4X9C5S96VYq6dFw37y4LK+8L0TgdKIm0RST+dqBSBdgNAmfHLoIUyqfLX53nwkhL/pvUVmwLjjqBCjuip0Z3pKRfBkg3oOgBF9X3/10uqAJqpGhI+IQxg6lSOstwbXftp7AM46ehUUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=D63Ay0DX; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so131465375e9.3
        for <linux-rtc@vger.kernel.org>; Wed, 27 May 2026 23:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779950913; x=1780555713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYxVUhwHI2nEFsfXbSdXyjPj9ZySNu+edEc+McQzGxc=;
        b=D63Ay0DXqO1RBlTrnoGFvolYVtSqnI7yhkZBRwWh3j7h/HVE6bMtsfWgx5Z8ctXe99
         WscIMISh8m7vHaI+2ZkdlZrw3aqmV+EcgJLq0JTQdWJFzO9al2nOZzs+PjomER2hLpf1
         gaCVcNXluIFTCHejxS31SUeFUmAzm4/KFvFGf8I19AB9MWoaOgmHZeusqrZqxAeiZnf5
         FycvCgwhFOpUKOk5O1BttTW02NVSjDYVGwVl3CuvnatBkxYoUjNC8r/k2E0+gfbGRv4G
         zhsXqHx4jY8z2OmoBmpPcpcHS5yJjoRQE5mRTVqefbdZqki2IiXoZtoCvjLhx+PqLkxk
         Xwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779950913; x=1780555713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYxVUhwHI2nEFsfXbSdXyjPj9ZySNu+edEc+McQzGxc=;
        b=K179zN+69uo3N7XkvjvIGpg/dJehMIc7nvwqRjnv3MM861IfKOiU6+KqU8JWH8QQxI
         1NMso/92mvBppXp6PKFJErSs4drUsno1Yk05AN8XrDQ20/IqIrU2iCWdwjHqln8TSUXp
         ehQXY+IcJUde2jpNhf4aBekAqlFPyDgTTTkkk5h98TFpQEpkHE0GNeaDY+BYx2rqfrZm
         O4e3g3YpUhetAKLLkONZBUKqotEdFe6ZvrUplSZo/8ivjoouiugs5raKzMAcu1FyvPdF
         90q3KcQNNRwYIkz1rsSuHGivSZt/6OMAOC4EkAjAYD8P+H+2hQe0/BIRgbxhMXeg2VnI
         AyVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8MBJ6BThCi0pmyyJgb8T0MqlLTMgCjIfnmK3ubOcKjkKgyHAQ0Pxi1D+SDwaOxBPEg35+LGkmD8LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ/3vkBkBLM19MTZyxlhq98ebHDEz8vXkGFle7d3o8O42Ek/i8
	OxhD3rTaegH1TnaMuV9PzRJLCiEa6K/o9MHpR9Yg49tpM9drDm0OGL8dC4IMTz6heVQwnLM4/ZA
	cFidbipI=
X-Gm-Gg: Acq92OHsulTHYQZG7ICQ2CW9TBmIdL70s/JaRNwBPRYAlXBShxtjSGqi7q1qXJcOw4h
	TQOD2E2H7KhF51QPVk1//HEC1+MwGyewZq1RSK1uCR+mfsFEx8zWsDIZsh2qfQPHCUjrY91ItCb
	xaUmgJr0QWpIflJLQEMXBWYdrhdRj26+psBvmJuS7jnXIN30qpG6FxUwUzDGkPkgqn2JH81X3l9
	Bz6bNmpXq0qdZNNSWlFk25tF3z6ijv5lQ34J53GJZzI0hn/KSMEsWaVo1SXAumUYmvIyqr+EZoW
	flcpJnV0jrxIEL1X7YpoFDy6Y3QK+Ezms+9ocRlgZG2/lR+tj8kr33jriJj45pQwopg4tfQU7dQ
	53FCtGhlcVWvavFSm9AXoJXwLP3P0TmeiAzQp12NI3u6lCPz9rssJSxgP4HUSXQYMsZlMndwbk3
	J/dNUoxNaV6SZK53FK1RI2mOyyzoY3gmecSlluogxADijMHRYyNK+MS5o9IIp1ZGtW2Ygcs25zA
	7D6hiAoZRqfIF80r04Ts0Rfxg==
X-Received: by 2002:a05:600c:4e0c:b0:489:1a63:509c with SMTP id 5b1f17b1804b1-490422608cemr452566715e9.0.1779950913231;
        Wed, 27 May 2026 23:48:33 -0700 (PDT)
Received: from localhost (p200300f65f47db04e95e43453a0d1648.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e95e:4345:3a0d:1648])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4909284a895sm18273545e9.8.2026.05.27.23.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:48:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] rtc: ab8500: Simplify driver_data handling
Date: Thu, 28 May 2026 08:48:11 +0200
Message-ID:  <a909d3c59d00756130ac16051ceedbec0ce9cec7.1779950275.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
References: <cover.1779950275.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1388; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=+LFo9k0HRw6kn4T7KNhnuPjSjM4RFi9qqPjEn5O+x7M=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqF+Uwjb5Zt6bEszHD/2bPr4HPlfNN3mjVxrfUr es8Vgtfxb2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCahflMAAKCRCPgPtYfRL+ Th0yB/0fjMTB1KsWQAaZ8hKob+FUqrGTK0+dYFaX+dUyoSiXtEFRkroO75lmMsOl39ZxuxuKEVe xxNoDKBn5NCGuNT2QX9iP0V9qgBynD326FNGrGql0U9qwIU7VeznyahzOA7MuHRXZIjsETfAZH7 E9qsYUWL3TCaBmk/OdB6gywuf17lX5LTV0BoaYu7RMAmIWJhVWXI5l1vOaVHoEdaDAoJx7+ypkS zBArVkbSbz4CfPXaMW7GSVpOLrV9PtKUIEMApiysY7TbaFX9L1wYbi8g0x53xNf9/FMtx6dG8Ux bh2oJBH0LsiC/uIeEIvE901zr8hH9GfbTWUsMYh+vTD9Vm9N
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6583-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: AEC675ED664
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Instead of hiding the rtc ops for the only supported device behind an
abstraction for multi-device support, hardcode the used ops which gets rid
of the need to call platform_get_device_id and two casts.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/rtc/rtc-ab8500.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index c6147837f957..0978bd0a3393 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -323,14 +323,13 @@ static const struct rtc_class_ops ab8500_rtc_ops = {
 };
 
 static const struct platform_device_id ab85xx_rtc_ids[] = {
-	{ "ab8500-rtc", (kernel_ulong_t)&ab8500_rtc_ops, },
+	{ .name = "ab8500-rtc" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, ab85xx_rtc_ids);
 
 static int ab8500_rtc_probe(struct platform_device *pdev)
 {
-	const struct platform_device_id *platid = platform_get_device_id(pdev);
 	int err;
 	struct rtc_device *rtc;
 	u8 rtc_ctrl;
@@ -366,7 +365,7 @@ static int ab8500_rtc_probe(struct platform_device *pdev)
 	if (IS_ERR(rtc))
 		return PTR_ERR(rtc);
 
-	rtc->ops = (struct rtc_class_ops *)platid->driver_data;
+	rtc->ops = &ab8500_rtc_ops;
 
 	err = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 			rtc_alarm_handler, IRQF_ONESHOT,
-- 
2.47.3


