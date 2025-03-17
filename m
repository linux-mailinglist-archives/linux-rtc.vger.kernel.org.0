Return-Path: <linux-rtc+bounces-3521-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B60A64BFF
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 12:13:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C012188BC02
	for <lists+linux-rtc@lfdr.de>; Mon, 17 Mar 2025 11:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C234B23314E;
	Mon, 17 Mar 2025 11:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AnbXt7XT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFEE38DD8;
	Mon, 17 Mar 2025 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210015; cv=none; b=oPfS56udmDBGSIEI9BBpCdO/5WmJYBvro2Ff5yvT37lBsa8J3YVzgFFu+Xio7hfmH5+5InFT1uvCgD8wtHZH8KxCcUA5DaZ9qqhE8KW4JE4ogMFUnwSdJAXbDWOht97zYMGQHX9HhUedq3COf24RVUyrX3MHMJ0GWTLRMBOI+RU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210015; c=relaxed/simple;
	bh=IaAKqA+v08qVVOfAgogOgdfb7gIXlHYzqSrSY03hVlU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pimV0JTE680Rs98qpy12fyTAw+2Y1f3rNulLqblxeOyaG6xjgb1m3LGwcBOUjXnxM/ngL9MWNFl0qhAAM9kjVVFtSkRGtcSj5cDhKLOSR1giT5acLfp3jS/5VBxzdHYqVRKbVR/mc7MqGecfDkkA3spb66wPTG89+JMnaZqL+kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AnbXt7XT; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA54844395;
	Mon, 17 Mar 2025 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742210005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6FStxfEl3bohve41RD8RkBjeU0dmNm6zY+w200u/9hk=;
	b=AnbXt7XT9YAEj73XQC9c6gAuZm4Pf09z4dUlM/3oEF5Ap8A1FtwyXlxZOOlsS+HmhTJLj7
	XBTVrL7ooIvD3VbdwaP4Th1O4SUPCruACRcUMQCU/mLPrWR291/OLPU7Um17CZ/6CUhFwb
	KYOqtMssSrYvaIo96BjkVVNBUGUQfAdwUq+7lQcoOerKTcmrRvQ6eeRPg/m9FfV/QwZxQY
	FS9lXt7XpRrwLYfInGmnXLIjA8bSUpY7oQmQjhD5PaW7Ag5qYPghJnoxkQBEyBqLVJn5jR
	UZpX1zL52vMa1o4AhoGxtOS7/T3MEn14Q+bY9VKNQ+8eNWq/buYckmyCcjzT5A==
From: alexandre.belloni@bootlin.com
To: Johan Hovold <johan+linaro@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: pm8xxx: switch to devm_device_init_wakeup
Date: Mon, 17 Mar 2025 12:13:11 +0100
Message-ID: <20250317111312.1518349-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmnecuggftrfgrthhtvghrnhepgedtffeugeeftedtfffhiedtjeefieeuveelffetledvueeludeggedtjefgveevnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehjohhhrghnodhlihhnrghroheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhto
 heplhhinhhugidqrhhttgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Switch to devm_device_init_wakeup to avoid a possible memory leak as wakeup
is never disabled.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pm8xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pm8xxx.c b/drivers/rtc/rtc-pm8xxx.c
index c6241a0c26e9..70cbac76147b 100644
--- a/drivers/rtc/rtc-pm8xxx.c
+++ b/drivers/rtc/rtc-pm8xxx.c
@@ -647,7 +647,7 @@ static int pm8xxx_rtc_probe(struct platform_device *pdev)
 		if (rc)
 			return rc;
 
-		device_init_wakeup(&pdev->dev, true);
+		devm_device_init_wakeup(&pdev->dev);
 	} else {
 		clear_bit(RTC_FEATURE_ALARM, rtc_dd->rtc->features);
 	}
-- 
2.48.1


