Return-Path: <linux-rtc+bounces-6645-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l5raI8uJLGrmSAQAu9opvQ
	(envelope-from <linux-rtc+bounces-6645-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2026 00:35:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D0D67CC6E
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Jun 2026 00:35:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=MPd4Nuev;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6645-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6645-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6884032251AA
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Jun 2026 22:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84473D3D02;
	Fri, 12 Jun 2026 22:35:44 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7376613959D
	for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2026 22:35:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781303744; cv=none; b=QzsmKebnQoa688Hmd7Wf4KrNYbscbq8A6Hg3hVeyJarfcCP5+ixl0sox3YDNqinqqxGI5QYSn7xk05lrI1p+VGuy7pDJBJqFNtkK/oLVib2HUlbCtHJP9jt0zuxdwHJHYlooe2e94pMAJywPXmU+bhSNme+83oF5h27cDG9DdAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781303744; c=relaxed/simple;
	bh=cSNsD7+3Z4mrqgo0rphnsGv4aFTnQpuLnX2PTcn6GN0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zlr7sqgXrLYgEqW39mrVJx0NJx1NQp8rUjqQQOiC+JYf8SW+gcdMvE3YDbBFwiLYeJz06QylCrnCxFzRobg+S/XM9wz4UW1E6wEinxUQpdrL0NSvqc7ss5fAgFngwLnMJySwR8AY2ejgx7zxmUVu+7NuQl+wmPKmDkzq4BbfHZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPd4Nuev; arc=none smtp.client-ip=209.85.216.41
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36b8d414666so970124a91.3
        for <linux-rtc@vger.kernel.org>; Fri, 12 Jun 2026 15:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781303743; x=1781908543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XMVi9CRydGlBhoRGfmhtSaBSDFoM0eyM/i7pyeJ8u8U=;
        b=MPd4NuevzoC27YpipvZ06jdpWtl5esFKoyn4xw6gfRxNBUAJ0b26AdDSFNQDr/Is1x
         Takzmnuv+hbfrwaLQcZu4JjNVECmrG8dR2O0CnXDKrvv2AyTtHZ5z0BWJOSoQciglWAD
         2Wle9qeIXzNr/ttVXj07GyKaxK2p8C9Rxc4HFgkJnDoDRM0dN0yp0I+w8n7ARyLwOWx1
         4iTuNUf5/otmfG8oWYz+QDDw9s0XAJVChCo36Pb7okb3yLedeb5G7GpY+2Q5215p0Rlw
         cOl5A7v0aXgl3iMf4Zg/uDpaX3lx8A6ibzKWZv+u0rjamOrSuaF3HJceZTe5KlNqzUbf
         3ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781303743; x=1781908543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMVi9CRydGlBhoRGfmhtSaBSDFoM0eyM/i7pyeJ8u8U=;
        b=Vv8gm6u+dW1FcGl9Zfg3pZStliBpqAqSO7yvk/KAbdVlTesIVWnx9N82i1NmNhxLus
         5t4nu4DKL3En6lck66gwGSx7NqYbCudP31SzVhNvLbZSUrqEJ403ulHEBhzxMlMgalGr
         aDZJp0/hJ54Ys4iCwU76chKjHYRyzJu/MBQW5FNcmkykXvtO+t7Nx0qZFMAfFZTSZMiK
         8uwxtcUMORYDLMGTij3xESAbg38G+YVDwtRmSlQNA9F40zFy8BNKUXoLnndWF8bgOfw+
         4V5uWD4hhx7snrejbjoR9BjRMaTVLYGVzCRUGv+1ErOipvFiqKx9CQ842/BhTWhNGzIC
         z/gA==
X-Gm-Message-State: AOJu0Yz6TKD2VH3RMfmkkcVHP6qxz8BF1VaVk/DG3RQaUADjMYO+vp6M
	H7irPusbTVuaV1G6lVHDHt8TCKkFnUMc0ugd/A0g5tJGq0TS+kVB0cAK
X-Gm-Gg: Acq92OEBkYU8JihE7qB2rmHDGA9qAQovOqBZur8y0Ki2++58JLArwFDofVBWd2fGgSq
	Fjez2wUtm798eYkq8vqDFdmwVIlptBOU4m3uIuE7saYQBmTGmgmoofg40F2D8qqZ4+fKk2txY7A
	Kzf90tv5WDkdK7xItm0Hu1vGxlMk6E5nOIfvRVk5ajLOedE8BwYcPhJgmi82+r1PXEr3GyAH06R
	HVmENoZNTIbLd38D8e4vfhjIQxF29TIH+xnqgwc8KaGgipE9ee1rFEXJQjnXD6YGxfUH8DEzocx
	wD3j1ntZAKffpZmIYsx2v6UX0FNZyl7c6ZqDjXAGbIa4Tposmz/gUyCt4nCPsJUHW4H8XJYe9sp
	y1dvcXhJy0+UbV1kU2bQCKIyVZ6kKmAgjcZGVvqlwCiWJr3s8rJw6xYTRbT/2mFyGrh3ikFWvxT
	ejgWMNhwzrNsJJUwwX4AQVu9lKWGeDH9WnkayqKz9A2kk898Xc/oFjqYQ5gf1dCCQGOpEb9wrZp
	fzCk/Bj3JM=
X-Received: by 2002:a17:90b:5103:b0:36d:689a:cb27 with SMTP id 98e67ed59e1d1-37a0468ca6dmr4913075a91.24.1781303742815;
        Fri, 12 Jun 2026 15:35:42 -0700 (PDT)
Received: from bloom (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a25ecd66fsm3872249a91.12.2026.06.12.15.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 15:35:42 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Lee <skunkolee@gmail.com>
Subject: [PATCH] rtc: ds1343: replace symbolic permissions with octal
Date: Fri, 12 Jun 2026 16:35:34 -0600
Message-ID: <20260612223534.77412-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6645-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[skunkolee@gmail.com,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:skunkolee@gmail.com,s:lists@lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skunkolee@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 30D0D67CC6E

Symbolic permissions S_IRUGO and S_IWUSR are deprecated in favor of
octal permissions. Replace S_IRUGO|S_IWUSR with 0644 and S_IRUGO
with 0444.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/rtc/rtc-ds1343.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index aa9500791b7e..54f6af7886a8 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -120,7 +120,7 @@ static ssize_t ds1343_store_glitchfilter(struct device *dev,
 	return count;
 }
 
-static DEVICE_ATTR(glitch_filter, S_IRUGO | S_IWUSR, ds1343_show_glitchfilter,
+static DEVICE_ATTR(glitch_filter, 0644, ds1343_show_glitchfilter,
 			ds1343_store_glitchfilter);
 
 static int ds1343_nvram_write(void *priv, unsigned int off, void *val,
@@ -183,7 +183,7 @@ static ssize_t ds1343_show_tricklecharger(struct device *dev,
 	return sprintf(buf, "%s %s\n", diodes, resistors);
 }
 
-static DEVICE_ATTR(trickle_charger, S_IRUGO, ds1343_show_tricklecharger, NULL);
+static DEVICE_ATTR(trickle_charger, 0444, ds1343_show_tricklecharger, NULL);
 
 static struct attribute *ds1343_attrs[] = {
 	&dev_attr_glitch_filter.attr,
-- 
2.54.0


