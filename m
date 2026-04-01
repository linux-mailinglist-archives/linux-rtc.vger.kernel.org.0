Return-Path: <linux-rtc+bounces-6279-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0PxiFh5QzWkWbwYAu9opvQ
	(envelope-from <linux-rtc+bounces-6279-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:04:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 052D237E5E3
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Apr 2026 19:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9006F30A3CB2
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Apr 2026 16:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683BC45BD4E;
	Wed,  1 Apr 2026 16:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNR69EBj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F3C331222
	for <linux-rtc@vger.kernel.org>; Wed,  1 Apr 2026 16:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062393; cv=none; b=jx/9+MTvKqzdtNDZw1XrH40NESvsVYnuSx0aa8MAQe9wBmsoefmymvTT9lx3d5Vq+i2TDU7K9KmP9RPDwa2e0TCOWBR0Vxu9PkaqXUB6behmLYqeYb8QdMooBwsbfIUJwcrJH/SqCNx0SmWjIlvYErbIQJqjvm+EWHmfY5S05uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062393; c=relaxed/simple;
	bh=Ve51WP6cVxKz17pxUE82lk3fCQgaxq/g/bnQpcF8MAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3/A3NrL9bfROYvLshTHmjTFUSWMQcGsL/BDvxlIMR1/RKEigbfsrJWsdTygMwKiQFgrSLK8wVu/u8Ec3Onj8Or//wRHd3pRl/i8BgFmGkb0RxXlhd0m/nVNuKJYA275p6aSq7zyqtDXwgfRdmC3YqA/Q0oavbPZ5VvDfoM/c4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNR69EBj; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a2ad56dbb2so5172811e87.3
        for <linux-rtc@vger.kernel.org>; Wed, 01 Apr 2026 09:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775062390; x=1775667190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2KNq2ivP8nzesdhiA2XS5qsIBhXXhkjWO1Pauc/XfY=;
        b=NNR69EBjDfWrRuAVd2J/1iT0btBUEm2lmnYpJjSvDuAohUTmYN3G/QzFAkCxVOMZ9Y
         MJljQyv7SEmmYXL9P+0Cj333Bez41dC3VqlWkL5p+4X5BETRJG2KWrnTE6y2UrWYAZTN
         nrXS7crrSJtqBe1vA+AZnAZs6M31142Awqo0f8XsR9pjfezpeFrexLRzkzvEXVsw7wHM
         wkrZGINjegRmgyKcFflgbPFws+eahDHzRfPM3R9MmnS+gWjDLTxtSBNg3AVKnXVFk30E
         jLeMFOfvQQN+epmFqeLtq1oQHp1vOIPxsFbD0NIf+70g+cQ678R4mIXA15Py7GmUNC9W
         5QwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062390; x=1775667190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z2KNq2ivP8nzesdhiA2XS5qsIBhXXhkjWO1Pauc/XfY=;
        b=psNENZHOXfCmXwVMtXReQaOd6IpIXk1TqyOhOAf1EGZ3VjJB8lbr3QpUOOeWPURjGi
         lJRW5FzOIxvRgYsz9OerG+DNHzvEyY3S2ogdv//CSxGUR3QrxbiGQvCLA4ITvQDhtVtt
         1pzenhc0fb0x6SFp8X1Zty13ZwL7He0cJ1+K86J5QndLIYqa7Gj1ykF9eVkHI7GyEIXC
         X6BmE8WC/FeaoKz4P8SiXRp/3/+FqDMrgp2qZuZkwWg2TAGBnxwic+MW54KQAKmPMD5x
         SzgCum4NslCz1if5j55AVldxaO2Aj52l/3NHchMpkzs0OWptokz5+k6FOZAcz0ihEAqt
         uygw==
X-Gm-Message-State: AOJu0YyfNw9DvgQE8wJoDvlbrDtetLS9/HCfM1wtTo/kfjbsiI5VtCte
	pIim7xtZkFSC8wKc8CI8Cq6afWp2BpjUY+5Sce8+97pLkjCnvvjU1fDvjpPWRgofnlHNsg==
X-Gm-Gg: ATEYQzz7iVzR0r9icJfWH+N+1rO1K/iUm3BuTKpuFDchAtSX2q4LsH/6i9GWPMD99PO
	K333MODCQWWXZVHHELE/it7qcTzRQMT04dfErOzlwrKTlrYGZkQWptfj7PSv0dTaR8Ewdv7q+mI
	CnHJhPZPmPOdFLQLA/KQj1J34vvQzkVYpDwsNuqeLTRPHvLEWm+S/k3sMj/1mqSMwx4f32lQa/w
	+wCsMyRYFIz+WWkprXZNr7fGFm0lBtQ5RP3+RUfK2Jctn9E3QfRIhy64UZCprhrZLDb5154y47T
	IiKs0mvusfKFKZVn8FusltH5vuXajhX9x1+73VPbmsiVMWzguXRAKYd6LqYlbdRov/mxRe+qXrj
	06OSsGgTrOBluJMhvdFGBU5nV18HbCzo3seJgW37qGqWRNf5tsSoEi1P7cc0e0RcqE9sxnn2k7q
	jepuUa14AZGEcEs9eGRZvkUwQtTHbO8hZscLe3AQ4QqJqxWkLbZw==
X-Received: by 2002:a05:6512:1291:b0:5a2:7a31:9194 with SMTP id 2adb3069b0e04-5a2c1ef9aa4mr1590948e87.19.1775062389453;
        Wed, 01 Apr 2026 09:53:09 -0700 (PDT)
Received: from gentoo.sknt.ru ([95.161.221.172])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm63358e87.62.2026.04.01.09.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:53:08 -0700 (PDT)
From: Alexander Shiyan <eagle.alexander923@gmail.com>
To: linux-rtc@vger.kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"Steven A . Falco" <sfalco@harris.com>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Shiyan <eagle.alexander923@gmail.com>
Subject: [PATCH 6/6] rtc: m41t80: Fix typo: WTD -> WDT
Date: Wed,  1 Apr 2026 19:52:45 +0300
Message-ID: <20260401165245.936428-6-eagle.alexander923@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260401165245.936428-1-eagle.alexander923@gmail.com>
References: <20260401165245.936428-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6279-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,harris.com,mba.ocn.ne.jp,towertech.it,linux-foundation.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eaglealexander923@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 052D237E5E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Correct a typo in the watchdog identity string that contain "WTD"
instead of "WDT".

Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
---
 drivers/rtc/rtc-m41t80.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 5ba714b25e4d..91b919c7940f 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -748,7 +748,7 @@ static int wdt_ioctl(struct file *file, unsigned int cmd,
 		.options = WDIOF_POWERUNDER | WDIOF_KEEPALIVEPING |
 			WDIOF_SETTIMEOUT,
 		.firmware_version = 1,
-		.identity = "M41T80 WTD"
+		.identity = "M41T80 WDT"
 	};
 
 	switch (cmd) {
-- 
2.52.0


