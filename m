Return-Path: <linux-rtc+bounces-6459-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id y7DZCDys92kakwIAu9opvQ
	(envelope-from <linux-rtc+bounces-6459-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 03 May 2026 22:12:44 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422B4B73C8
	for <lists+linux-rtc@lfdr.de>; Sun, 03 May 2026 22:12:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 781E830053EE
	for <lists+linux-rtc@lfdr.de>; Sun,  3 May 2026 20:12:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00465387378;
	Sun,  3 May 2026 20:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOpC/qF6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A10AA26F476
	for <linux-rtc@vger.kernel.org>; Sun,  3 May 2026 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777839160; cv=none; b=KMFQEbGnI0BVYCYw0vSJrYjWctY13o8nfx+99HXJezIQZ5gB1uu0OOrrL6PZc5y21VA1fdNkrMKvFYQffinktYZJyaDM/vJXnOP49bfIzO8DxxBx4QLIHNC/62m6UzQFPsaFoe9zLp7MWfxw1kUmvSZZu67FFVkiTGHXTp2Sqds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777839160; c=relaxed/simple;
	bh=rtrhar0vhABpDRekh8JqIicW/Rn0iSfrma3TyS52bL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=how405FGpF20ZvswnPA+cvtgv/aMRB/ADOlETgYwsUURgK6gY9MbAglEAdAT/Dlm0zsoooiBahwmJWi8KC65IaqOg0CysauDK7si8kZxEaZrmkwL+Vpdyzpt4Ty9ed2/WvIdTA+PWKeSwHEZD3AfGwgjiFRHv42aABzihyVq7pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOpC/qF6; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-682fce74c06so3073223eaf.3
        for <linux-rtc@vger.kernel.org>; Sun, 03 May 2026 13:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777839158; x=1778443958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RbGHm08BxGQD7aCQOyLWw7aVLNNFoqSYxYwfTxucUlU=;
        b=MOpC/qF6iIFji1TeBUEZmOBBp56bV0lXdvBb0oUm4nFDGK5n5+rQbwGnJAWPiuhGal
         0PsaojAn9YMV6WI5bO37sQuvZh4K7E1F80cnwhfGSzNN+0Rv12QOpIlcKJGpunQio9Hr
         1ppSNiTdzCs2kgNlvp33Wq04kOLWYftaS1n1yW+is2IEZN2usW8VB1qsMQTeryUwyEVL
         YPDUN+IQr875eqwHajB6WEUtmvoPZx8cTenMXfvBGFBE4tC8B/tzrIxzen1Lju708ySs
         WbHtmRYNvsOU77TM59XsPT1twFhDo545dDaQDQ3xhQ4UZ07tqoKy9fG5qod6RmhY4sJ0
         AQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777839158; x=1778443958;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RbGHm08BxGQD7aCQOyLWw7aVLNNFoqSYxYwfTxucUlU=;
        b=KmPrhzktGVWK9I6pGSAd0ZzOIyGUnjHUuE702KA7rNwLkSVEhFedig+dj0Ny5ygnFh
         OehMl1u0hCX0W8KclLod+XemjyJLzRWiI4hgDI0heEASc3+hAZBgwcqDLrDFliScIulF
         x1oDbARZp7pWMwdk7TqskHMox+szkhngXfy+W0JE55rzO07I8XkSul0Qcvi8v3mfMwk/
         Yoc3q6uNsc3kDev9beB1BpCRLtZRojiLl4I/v/BuRpbly0Qghp6vE2Mxngf/ex1CQOt+
         4uN0TIrZMEocaXGJ2vH2DI4zE87ia1Ep1YQVgk2aAD2EkhaoRFnVSVuIBUqlid6/bD07
         pP/g==
X-Forwarded-Encrypted: i=1; AFNElJ8DBi7mRKOUNQ+i0gbnIfTxt0XTZbnkwrwxlrrKkWyDMcrO6f+BXqv1QDC9MQIq4MVnKT/wHKlVGWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc9mh0JqbuMTQyrklm0zRsKIsLkskqa0LuiYBPA5dHVeVqxhyr
	WrhALo8XamnxB+yMLKq7RGbKgqzgR2D8Zh4N5oQIIKsudQIcLbl8zoYa
X-Gm-Gg: AeBDiesb2K1fehssJHl844fiMn4QVuD7DhmKRz7k3WqyBhPUQxPDKrws6i3+E8B9+yo
	+WNl1ggKO1Znop2HL/M7cZTcvkXyT6Z0DsFWzTBVK/QUWm60vEDfsV7+6oyIydCF3TDSZI+xiVl
	BuUUXu0JewNC+RdbB8Vy8wp3xsSnQ7XpAZkcEQmjeFfS61NuInlm8bUZ41D/d0S3A7WJKyHW6X6
	Wbk7GDNRqUbs4cO8CV7HJTnzqP7fy9pF/6V+owz+OYJJ1PEmjeowv8+vw1cfnB3vA86IvgA/PF/
	mfxYOzhGtOQEJHerYottlx3XPy2bd7CMmGnW5o1ediVSuyXa+ZYB4kYb5Y5SvVzP8i6zUh7598n
	f1L4nwlHZR3EJKor+W20RBTOegIc44G2PAXZGJo9oyIIBCKSzO7/vs/qisruVvKj0+3CU0Aqgjv
	rUxVGTTrtPVptZlsJ+Cmw1ZcrSvsoyC5SQM6OydPCFHvR7kmC2D1WjrBlqw9eWuOHz/Oxc
X-Received: by 2002:a4a:e90b:0:b0:68a:af54:cb61 with SMTP id 006d021491bc7-69697e1852cmr3063891eaf.60.1777839158605;
        Sun, 03 May 2026 13:12:38 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6968947934esm5194328eaf.8.2026.05.03.13.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 13:12:38 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org (moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES),
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH RESEND] rtc: ab8500: replace sprintf() with sysfs_emit()
Date: Sun,  3 May 2026 15:12:36 -0500
Message-ID: <20260503201236.29685-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6422B4B73C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6459-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

This patch replaces sprintf() with sysfs_emit() to ensure proper
bounds checking. It also simplifies the return logic by directly
returning the error after logging, instead of logging, calling
sprintf(), then returning.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 note 1: original patch can be found here:
 https://lore.kernel.org/linux-rtc/CAD++jLkQD_ZSFPGrx4uL+ezrR1Ai2ddUF9_PpesDG+AEwiDrag@mail.gmail.com/T/#t

 note 2: I rebased this on to v7.1-rc1 to make sure there wouldn't be
 any merge conflicts.

 drivers/rtc/rtc-ab8500.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab8500.c b/drivers/rtc/rtc-ab8500.c
index ed2b6b8bb3bf..c6147837f957 100644
--- a/drivers/rtc/rtc-ab8500.c
+++ b/drivers/rtc/rtc-ab8500.c
@@ -284,11 +284,10 @@ static ssize_t ab8500_sysfs_show_rtc_calibration(struct device *dev,
 	retval = ab8500_rtc_get_calibration(dev, &calibration);
 	if (retval < 0) {
 		dev_err(dev, "Failed to read RTC calibration attribute\n");
-		sprintf(buf, "0\n");
 		return retval;
 	}
 
-	return sprintf(buf, "%d\n", calibration);
+	return sysfs_emit(buf, "%d\n", calibration);
 }
 
 static DEVICE_ATTR(rtc_calibration, S_IRUGO | S_IWUSR,

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0


