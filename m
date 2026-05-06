Return-Path: <linux-rtc+bounces-6471-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELQfK0Bx+2m7bAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6471-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:08 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE3B4DE4CB
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 790EC303CD11
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 16:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE0B49552D;
	Wed,  6 May 2026 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X36KRS78"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BF7495528
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086161; cv=none; b=o1ayXo8xGFH/LtzThbGlwNzHJf86ISLjfeOR7F5eOCVwl2EICWcVXksoajjhf72EXeCIObav2Jg6WWoof4s3aATLXRJs1LaNpDuj6+RJKu2SKwfp3uI9QbK2ox2CWqjdxFh7JSemFkuPYm305JdAXee0kZpxSkRmbRGB9LX3S7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086161; c=relaxed/simple;
	bh=Ic5kVY6Rq8d1btQ9z3kI93gZws6has0O855jspCPo30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqBZmTaVermuAO+1NZNtf+kGiIwW3HUtu9aR0T1OKvvB4517e3W1b08Kf/H9KQrZbrsjS1W9+6M4aOs5DeM7Mj57P+vjI6qZ1J7HXjtNT3AKymbvQgfFJ/rt1NycAwOuijPKyvc20y/u/S9nHWLPQoG99H2gh4hJoRY8X6yOWLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X36KRS78; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488b0046078so59306395e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 06 May 2026 09:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086159; x=1778690959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxWuPcuF0UKPqeCZ8y2hNLNnCZzaOu2O0vTDxb6yruo=;
        b=X36KRS78W6d7jJr13JyeZ1aOQ3EnhXbTn7VL3+ME9sejDevGEWQKucWQHnttvKmZTy
         nrEB55WREXmiAtUdK7LEN0EY2II9g77XxsYCHFYElpWYpd21s7UmZmot9Uwxhy0RU1Tt
         BQn89d8Xy43iOH8Mr/yFc+AOlYzXLliiydNpydpj0+JhyfstUxVOJ+X/pYlJl7EICegA
         5BxnmQmx0Flq0sbjUfuLQ/wKL2S717o6choYfkU9e7n9ATC+ibKu/MqwM4/XBD0gtzNv
         8RGOhGrX8HzEkD4AsD8sqsYazKYeKP6npzUQDAoLbPHeg9NaXQjQEc51sI6Bh5pOC8fJ
         ZWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086159; x=1778690959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zxWuPcuF0UKPqeCZ8y2hNLNnCZzaOu2O0vTDxb6yruo=;
        b=UTJoSUzqX6UwD3ml0JF/0kAbt+DBl1NeSEDxNingXwc83XvWeCarjYBJ7QE9Bsymyd
         QnzQjZKNMGQApLqm21eNtI+lPpOCqnq7D42GuEC4g18rp3coetX7/5m29pc/yj+3AifM
         Hq9CzGlhGUb096tLJiDDEtJydS2oceSoqY3c7PEtx+k3zu/0YwbF/uRGu71EhcEw5XoO
         L7xOanJW9iEs/lo/6u4xRSU228+yuhzWxQJkQ/1MZ+S0YIPNtahJ3+N9eKlOFu7sCTPU
         HqSrYQvZKhVmYE33Br0bwP7c4ElgH31S7/Q8VuAbzEy7DmryH7SU0EK5HwqGr1IWIvB9
         dMdg==
X-Gm-Message-State: AOJu0YzGwFNJ/02yV03VrMYOXqbnjhk9CF9k19TZHpI8c4rPc1Ji9zBV
	ozsGsW4BcDBmzmFbOOmeFaCnt1YgI4fKe9yb9kK35//Ukm1ycOyCQCWX
X-Gm-Gg: AeBDieve9hAHdp1fX+V53qCz1dfefreHEQhM6zVGNl+uR2w37YIDtsX+NyKg7ZafSGk
	PTfgmqueb+eLlXKfryznE0V/TGXYRMYkPkGEfjs0v540sAEOFnEwVk2EBBDAFq39M7kRH8/h7sO
	HqhrxlhY6OPTJ/ql51Tc2dxGqJH62OVXr4wxPJkYFcRQI/f7spoa9FR4yVMjGfg7W/XjFA6RSpH
	uqye68+pDiLtqyYRlfa+zZon3rGpQFwsvl94RGXrKpxFv90QFk6Yu/oEB+xuC8y7p8szT/7K0Bn
	KTpSlC0kPFrcCRUMpH9juoemM/rubDMyuRV+CuTSY9qLF0j5ysYBcHFyAXUbzT8XDu80M2AUhJh
	qWsayhhpkRdbsFDGVpj2Tr3me5NXg0CyxKVNigKva9cBqOXd0i9vo0cvdUWyH5Ue1lOQtVN12vt
	RaMOXa3tk/eDFVO+f8a716pgB/0wjKbSFASb4/3f9fNgH1rq6y+xGaD5kkfBVMq8pfJgwNVoqI3
	YMrycqIZ9Y1HBjE8jHvNKA0PCciOpoJ4d7ZOZ/JU1DX+d8tt3mMz5T640j6tnK5u+pb
X-Received: by 2002:a05:600c:c082:b0:485:3ec6:e634 with SMTP id 5b1f17b1804b1-48e51f327fbmr52468335e9.15.1778086158703;
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/5] rtc: renesas-rtca3: Check RADJ poll result during initial setup
Date: Wed,  6 May 2026 17:49:11 +0100
Message-ID: <20260506164914.3987293-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260506164914.3987293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2CE3B4DE4CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6471-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_initial_setup(), the driver clears the RTCA3_RADJ register and
waits for it to reach zero using readb_poll_timeout(). Check the return
value of readb_poll_timeout() and propagate the error if the poll fails.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index 2dc080d0eb6c..af2a3878289e 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -634,6 +634,8 @@ static int rtca3_initial_setup(struct clk *clk, struct rtca3_priv *priv)
 	writeb(0, priv->base + RTCA3_RADJ);
 	ret = readb_poll_timeout(priv->base + RTCA3_RADJ, tmp, !tmp, 10,
 				 RTCA3_DEFAULT_TIMEOUT_US);
+	if (ret)
+		return ret;
 
 	/* Start the RTC and enable automatic time error adjustment. */
 	mask = RTCA3_RCR2_START | RTCA3_RCR2_AADJE;
-- 
2.54.0


