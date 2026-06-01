Return-Path: <linux-rtc+bounces-6606-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GN2ChPiHWqefgkAu9opvQ
	(envelope-from <linux-rtc+bounces-6606-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 21:48:35 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFBF624C70
	for <lists+linux-rtc@lfdr.de>; Mon, 01 Jun 2026 21:48:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA9BF3034A3E
	for <lists+linux-rtc@lfdr.de>; Mon,  1 Jun 2026 19:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB4AE3806D0;
	Mon,  1 Jun 2026 19:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jb/LIvIQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E237836F8F0
	for <linux-rtc@vger.kernel.org>; Mon,  1 Jun 2026 19:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343183; cv=none; b=eN8Y2RW50M2nBLWWsJsmJrcKfKPCt+BpRaYyqrYMlHNnYvB2E70X6/Fkdj1L+RxGQFzRerl4N9YN198sGQSgAfzMDnOdvBtNPbKrI7zwkRF3OLA4KwKHLskmnIQb/oEYpA8r6iO1/9V/hMQAQNEvPZNyxYMiWt5+ISGUpFl2Xeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343183; c=relaxed/simple;
	bh=SYbNicsBnsUkwiwBDS4klYYJHV9hzXRbOndaThKBeCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BVJB0P0eWNm6MAE+NuVZ3S3isrgIEda9GvuVk+YM3zdNWxSiVDD0qqlBLq3hvQvLvLACEEdx6z3BIvOUlfI/5xkcpSTjRDUS42Z7MRZo6UTejlMdw0ytMhku64ggRLX9ZC5U7yTWqnDK76Xp+6llsT5vsfIHwS/9pQR9rX42WQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jb/LIvIQ; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-91550eca866so266091585a.1
        for <linux-rtc@vger.kernel.org>; Mon, 01 Jun 2026 12:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780343181; x=1780947981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i0+VXzI7NS71oC73bVDjfQq/NKaDSZiH+AFXgAo6zc8=;
        b=jb/LIvIQiQO5KnxpoAuFZpix657rCNxqgFeZe0z4K8qxk9Te2nxDhZagO7bl09A5K8
         GmH8NkVoNldRLyJQ6h+CHA5Qxjm05tbbWC8apGrDDixZb0QqLV/xsunaq7Ipw+LLgomq
         PLDq3sbgtCtllXjBjfBYvX6FqtZl/QnaMMkz04DqLzvHV4Ih6oSwHkGgmizrWjjsfz1S
         UKN6j6poKxXigYbiMrMeE1TiD73RxlFDh5tS3R1u8cFLPl/5+9yppXybkK14KfYh4koZ
         62yTZ3qYrS3BUzFCOKoC7DisrKWazzEBMtguQlZax3mWSRY7MgzFf4CpYMncGxSjhMhn
         rEUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780343181; x=1780947981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0+VXzI7NS71oC73bVDjfQq/NKaDSZiH+AFXgAo6zc8=;
        b=dx8UwdPLJJ7MowvMfQNHfpoKUhvFvinU3StIZx5L6NVfBvzPBH69ZtTzpCrNOWQUL3
         LerlBqWK34HB8tkMp1Tz5YQ6X2yLB+hJKR09iRjypC+dlrOx8rMkstnZ6ThG8s7KdgKZ
         oBhEj2RH8Jdv7gKJdaM0GW6odBegkf10OlrS0O57YJvOv0kGHB4VJhD93B6isLav4yWS
         zKW82kvcLJIfPdSTIXcr79IJOXb0lX39X0qAEjNHxUaoNu+A60OsC54OyyAutahvh8+k
         w0T1zss7X9qYCO2YSbNaWjtUJQS0DtJfqNkaMzg3F64xCmNoF6tQ/2cYc0lC3iA1aKXp
         rZ+A==
X-Gm-Message-State: AOJu0YyH+k7THUuBebwOxmIiQAY4SzY7m56lXpJaVqBt0cMR1SJqaxus
	OnhHw2FJLvPoBWbm1DqomxZNMp51ATOqHb4ryKxKozY1UqKlEMVguNm7jEAakNfxmDU=
X-Gm-Gg: Acq92OHjQoraCXWgY+EuKeDrvOMir1eBvZ5yEBNO2clAYzGd3wdAYBoNHrQ3mr5thVN
	vycskaDgsj3N8crgd689YGuUMEv4tQGwlsQ1MINAGdvKquUTFTvOx4oVvNFxeHZVPyejfCR0Ang
	D1nAn6wr3VmYLzlvXyRI9PuvAhEGEkHzN9B2mU1UDtLiRqz3xVe3H8Qx1CLuGdHuSAQJAO/1PbP
	+3t96dUgpxCy0BNTfMsNNdTA5usKfnbpdewz2L3mn/zgGNGkEIZT45OeF4sRvlAUUu5oRQ4F95O
	CCMz5g9h56n79o/LbBZ6/6twMX1itUXx58FK334mhe0BppDUMUQFMNKrXI7P1B9/FtnG0XjxXeK
	OdJiOJ29qt0jstTW1EbP31/2EIt4PxZdAihJclONn4k2N8gxIgTDuFXpiQcFDht/BRUf3yTsPW3
	wWdBrlSSio2ZExTHfTQJdAES6CQLdDYCy0UN3VP+NqNy+6uC2tDUJGdcPgn8onoA==
X-Received: by 2002:a05:620a:4454:b0:915:75ba:17aa with SMTP id af79cd13be357-91575ba2b2emr316925485a.35.1780343180770;
        Mon, 01 Jun 2026 12:46:20 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532446403sm1070254785a.2.2026.06.01.12.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 12:46:20 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] rtc: m41t80: clean up watchdog on probe failure
Date: Mon,  1 Jun 2026 15:46:15 -0400
Message-ID: <20260601194615.1979101-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6606-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dbgh9129@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: DEFBF624C70
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

m41t80_probe() registers the watchdog misc device and reboot notifier
before registering the RTC device. If RTC device registration fails,
probe returns without calling m41t80_remove(), leaving the watchdog misc
device and reboot notifier registered.

Both watchdog paths use the global save_client pointer, which can
outlive the failed probe and point at driver state that has been
released by devres.

Unregister the watchdog misc device and reboot notifier before returning
from the RTC registration failure path.

Fixes: 10d0c768cc6d ("rtc: m41t80: fix race conditions")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index b26afef37d9c..f4a30320c6ed 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -1009,9 +1009,17 @@ static int m41t80_probe(struct i2c_client *client)
 
 	rc = devm_rtc_register_device(m41t80_data->rtc);
 	if (rc)
-		return rc;
+		goto err_wdt;
 
 	return 0;
+err_wdt:
+#ifdef CONFIG_RTC_DRV_M41T80_WDT
+	if (m41t80_data->features & M41T80_FEATURE_HT) {
+		misc_deregister(&wdt_dev);
+		unregister_reboot_notifier(&wdt_notifier);
+	}
+#endif
+	return rc;
 }
 
 static void m41t80_remove(struct i2c_client *client)
-- 
2.43.0


