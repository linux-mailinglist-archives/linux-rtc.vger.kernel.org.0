Return-Path: <linux-rtc+bounces-6470-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMZHITVx+2m7bAMAu9opvQ
	(envelope-from <linux-rtc+bounces-6470-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:49:57 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF34DE4AC
	for <lists+linux-rtc@lfdr.de>; Wed, 06 May 2026 18:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDFBA3016833
	for <lists+linux-rtc@lfdr.de>; Wed,  6 May 2026 16:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5D64963B3;
	Wed,  6 May 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuflnOgR"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1831D375
	for <linux-rtc@vger.kernel.org>; Wed,  6 May 2026 16:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086161; cv=none; b=S6E+4a4jZZw79cvw7x4Wt2nJn04maajrUNhJR/a1N1XoCOHNa5h1jhZU2OIuTol2PWjo95J5olZ+4fptw4Yb7Ha7A9RJ7aqC1BR6RziZKnZlpbewuzFrxUmRPnHrHWrQGJh+7YqizhjknUiYdDXivRepk3XbwP8rDpEBClzbxCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086161; c=relaxed/simple;
	bh=ydCT1/JE/JPYLI+J+iW6pMlD2xEDI2Bd5yteqX85Pl8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xn4Dmk5fmg2rB4o0b1xXupx41cyaM03caDjZ/cqW+gfr5yCaYph++No9CokSpDEyGQ4l6ZyYB9IZuRj+nDEeN9wQzt5wErf0AY6yXMIiNczBAzWBuB3AyUM7KxHPdIvNR7Yzi3jXTO2yvuTex9l4WKUKdNlvPjTzC/9AvxCuCys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuflnOgR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4891b0786beso44068615e9.1
        for <linux-rtc@vger.kernel.org>; Wed, 06 May 2026 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086158; x=1778690958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM+K0gilZXjULIrmHaDGvw/aYGEN7GMhe5rYaCexhFI=;
        b=GuflnOgRZpE4oGmRzQdVTRTQipqZOw50zLhrOZq7SOY9SbfXfiy/+A/HHVUEKXynGh
         pPafotKB6d4A/7LZUYg0j+jXd6AxnNeErBenhIzpOaftJSSmx8knYR249+LDBTKYntNv
         ry7+rleU2M9Wg8a1PO7PZCdHJfN0YWloVpjDKS2AnxXwRMNGdAfLoH4lh82fLw7O7DLd
         j5emGSKn8U+BOnXU3m2PTMb+POJU32+9488H3ZFRY8/ILcrye7O1VR/GIQo2DoUACq7q
         MmkViZeNl0U7XzN/jLEpOfAovgH8Jq7ui6XkSYeQI0yLRUY0gOQ9LJ5nfbclVBi7nkKs
         iMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086158; x=1778690958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WM+K0gilZXjULIrmHaDGvw/aYGEN7GMhe5rYaCexhFI=;
        b=QsSiyQIwZQJY8/bk99FZxC/5/lHKsUg99qxkmr6u+a/36CZYcF4b9I+fySIZnOIQ4n
         viTjxaHyghBfIcLBWWYqWnvKoC3cWvpXfcnRWgk9NBxgahZZAw/rzvt0uG/rNmgaNBAA
         S60XgvKFvv8EmOWB+ti/+wqdyg2xVTm+UkQq71uiIjGzsN76Fszr3SarVNzdxRjqmthG
         kEkksM7fnu9H2Ncat+c1d9ISwfDCIvQD2aOAnfYxaYfkUxgBRapFltP7mD9IH2cKJJm6
         tpdpiK/P7bR7ZP+2+0gvBOlROqINlk0nNPGgVwspKbhSQiF4dRCyp3BQLla7rTa5xVqc
         bbuQ==
X-Gm-Message-State: AOJu0YyHfTBDI00muvGyDXvOA4kR05sPd7HIdOrY9c3cs+Ky0DBEna38
	LwiDVM6XlTd2lu0BiZwlKC1lwHFNN+Sart2xkSZAF0OcvhAIBNh4GmXO
X-Gm-Gg: AeBDievIg9k2jo+48fbmxty43VtVLYpaZ8+FNSPRLn2rRGh8CNTrCBTv78T9UPNVUjO
	O7WvsvbRu61KMvyQECfI0pXDqiPJVkC8uVt94O7TzHfMhBsHlepDjT9RQNpiTZ+tnTJNUUx8tPw
	6M9riXE4/ouIwtSMKC+8Z/6LHTFmK5x+TCrvuvFpqqdNddL9LiFnFDEhIPBNcHuC23p4Bi05uj4
	RFjuw5S3jAHTrSKQmWC9qrNw96ENVaBElvgflqatzqgeouTKvf7YfTAWunl/CKQPj8onRPfWack
	F4/DT60YJUP2JBFPfg+IWFW8fdebt/5lbwgHyq8JT2S3W5anirG2ZCmbl+FTuH4g9hnFFuPblwg
	TRJQAWO0CpB80e4rfAJhdTrPTx4gr7aWkYwiIcFqynLst4PAvMQ+aq4cXljMyDzaG6+99bPihVn
	vds9XOh6V+M3C8Ju+wRY3Iy0z9+8kM6YQnM8WKLLyU0QN+LqKkgAs59jrg5J/PizA5jP7VUytE6
	JsWvHGW5iGmvIp7jl59QPyGu2pZ6H/LYcnJjBC0rNhJDt8HQ4hUqt4ZA0kucq/ZCyQ/
X-Received: by 2002:a05:600c:6d7:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-48e51e0bc19mr45621445e9.5.1778086158014;
        Wed, 06 May 2026 09:49:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3dcb:40a8:a5b9:2327])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530fdc50sm33060795e9.5.2026.05.06.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:49:17 -0700 (PDT)
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
Subject: [PATCH 1/5] rtc: renesas-rtca3: Fix PIE clear polling condition in alarm setup error path
Date: Wed,  6 May 2026 17:49:10 +0100
Message-ID: <20260506164914.3987293-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
X-Rspamd-Queue-Id: 21DF34DE4AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-6470-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In rtca3_set_alarm(), the setup_failed path attempts to disable the
Periodic Interrupt Enable (PIE) bit and wait until it is cleared.
However, the polling condition passed to readb_poll_timeout_atomic()
uses an incorrect expression:

    !(tmp & ~RTCA3_RCR1_PIE)

As ~RTCA3_RCR1_PIE evaluates to a mask of all bits except PIE, the
condition effectively waits for all non-PIE bits to become zero, which
is unrelated to the intended operation and is unlikely to ever be true.
This causes the poll to time out unnecessarily.

Fix the condition to check for the PIE bit itself being cleared:

    !(tmp & RTCA3_RCR1_PIE)

This correctly waits until PIE is deasserted after being cleared.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/rtc/rtc-renesas-rtca3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-renesas-rtca3.c b/drivers/rtc/rtc-renesas-rtca3.c
index cbabaa4dc96a..2dc080d0eb6c 100644
--- a/drivers/rtc/rtc-renesas-rtca3.c
+++ b/drivers/rtc/rtc-renesas-rtca3.c
@@ -455,7 +455,7 @@ static int rtca3_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
 		 * specified timeout for setup.
 		 */
 		writeb(rcr1 & ~RTCA3_RCR1_PIE, priv->base + RTCA3_RCR1);
-		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & ~RTCA3_RCR1_PIE),
+		readb_poll_timeout_atomic(priv->base + RTCA3_RCR1, tmp, !(tmp & RTCA3_RCR1_PIE),
 					  10, RTCA3_DEFAULT_TIMEOUT_US);
 		atomic_set(&priv->alrm_sstep, RTCA3_ALRM_SSTEP_DONE);
 	}
-- 
2.54.0


