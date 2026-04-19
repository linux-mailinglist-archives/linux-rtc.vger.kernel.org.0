Return-Path: <linux-rtc+bounces-6380-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKh1BfdY5WmFiQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6380-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2026 00:36:39 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A174425B2C
	for <lists+linux-rtc@lfdr.de>; Mon, 20 Apr 2026 00:36:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78449300BCBD
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Apr 2026 22:36:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FCD82FB965;
	Sun, 19 Apr 2026 22:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4UbyEPS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451F32DCBFC
	for <linux-rtc@vger.kernel.org>; Sun, 19 Apr 2026 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776638194; cv=none; b=eg0LgOA2wABCXi1/vuqkxrmekHD4xAK0a7wduEOnuATpaFIs5I8D6KzrGeNoORXXN5B3uQxM0BUBRsXqDZK7CVuunTLefODlJs5sl30GiiEBDYheZsknF71aYDiabNbVIh/E5o0IfeE4d0TZaE0ijc7c+PeIvMjO16ei1yMV6Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776638194; c=relaxed/simple;
	bh=MbsHOnyZ9XH67VDYm0Yd55VReAFjYSdBLaEWWeRgBAM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knf3Zci4qGpAxIA3zyN7UPNwzNjXKlfH2K0YPkz+V7me+zmtpgd+DfJ3QgPJK0rU1jYL9lkuiooVqUZr/pmRO9jEvzArvHzuCiZA+jJ/xBnBIDZhf3jsI/Ss8S8tctEUT4wmqPjgriAdkiSyFhVMAYPB7aclEPzv6kzPWHO0m4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4UbyEPS; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7dbcd61429cso1248853a34.2
        for <linux-rtc@vger.kernel.org>; Sun, 19 Apr 2026 15:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776638192; x=1777242992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FosC665WE8Cy1oOKr7vEfeLdTUyUScA7y3vdV3aiAok=;
        b=g4UbyEPSB/uMqZGM8XGCp9s3plz99if57VA+6OMstQdUjR804gWL16jMRW2yAqZJv0
         sFNrau4bqnPaozafRuGu8jNFJeB3Wu4uymE62//Eb21DlNwFpyIUrm852gCm8XV0+MpP
         V97cXB8WldXjyBGd1HSx6cpPtZ7Vsrol2ye4MvAJhnkkrLO0OnxR1C0dPSdlLYao3yty
         PONlgz/xaA2TAuZWnuKessJJgakjM9JK08LXQ/5oVQdvsMYlnbPqcQG90z3oc+MZ8Z+a
         9LkGd2fFxun6IcuFODGVeElp6wvdT4bS2Koc+N09LkTq/bMy9+nrXTXm5m7+5S+Ipmlt
         R3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776638192; x=1777242992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FosC665WE8Cy1oOKr7vEfeLdTUyUScA7y3vdV3aiAok=;
        b=WFiSgOWS1usub/IxOyhAgJu7VZf9N9SITFcvr1kr4iRQLiPP+DcmVl97Qeq66BXDlW
         IkLFRP4VCipZ2jy4SF5mmO0CnXRheBXA5R9TqTi+Rs7duGPwOI2TJNGT/Ipxjjfnksek
         QDH02JBWacqTHxk8H/qjP7IFLcox4nvkxlYYwEb7keTPODDBMJFMFL+209a6uUfcQMjG
         7/dkwXTkdi8zzpZt7hrHWRlDZ2UziyOvpD59jJm7P+FnCbVgkmwF8fdRhJdB7WSm1Xod
         Yq6fBLzl8Urexo2/gvyctM/1kjK5xV8rMP5LzNhxoVrN0VY4Ly3hM1musFU5ex/chAAq
         BaVw==
X-Forwarded-Encrypted: i=1; AFNElJ8lI42GA+1aAbTCB0iS9V8voq7T0zAYZcsV1ATFcDFZ+QmHK+XkU3a0K9U+RBztrE2F51h5jZ6+UUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz16O/c1aM5TYhK5hfjsMXqBZM+md3p42DEgp02M6eLdgcd8eps
	5lykqvf4Zjpg74GsR7gib0jLWJFoal2uIqlPLrjAXiqoPpX/Q1+ZhJa9vrFeLlgD
X-Gm-Gg: AeBDieufS2+G97nIrOjLwmkwLfWNLYStvk7wfX3D9g4w+8GeX2RI/gJnCZJzNuAlKrE
	kCL9brh8wtjWdqOm0Y5ZISUDJAh8PitZSXP6GNpk8goYb3LdcsV3LPaWeBYCfgrnzFK0kHM9hTT
	2KXRpxrqXtj2VzI8nrXHX3RY1LHcFw8CEVe7Wm/jiLm4cfMHnfuztZtxBhuQJ0r8a3D6wqD+HqB
	W+IcW2AWsa5TkYQLyJiVYBbsCduPYLi44cqFeVGAYhEJ/FZCWFdJvfAjN+8PH6yW5h6+03+zot7
	usm3a14qO03GNmWWu/bdAyf4ELKiujIF4WJE9lA7J6ldFe1nKmVC+24mNollB6I5+MVeVzjs6h7
	dhoMDaooKi03fJjxPrNFyiPAn73PZdTr4gLywrO/Srekzsz241SZvLn5UbXDFK0ifD7X6uYtWfq
	FYtksGhW8vh40YpFt2Irl5dg7LdG+jMrFg966YNOEaQcQ9E/gBTx1N4rK/n8WDwfhlv2H+
X-Received: by 2002:a05:6830:8d1:b0:7d7:5b78:ef31 with SMTP id 46e09a7af769-7dc94fdf204mr6753657a34.12.1776638192241;
        Sun, 19 Apr 2026 15:36:32 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc975034f2sm6979077a34.4.2026.04.19.15.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 15:36:31 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: linusw@kernel.org,
	alexandre.belloni@bootlin.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: ab8500: replace sprintf() with sysfs_emit()
Date: Sun, 19 Apr 2026 17:36:30 -0500
Message-ID: <20260419223630.67644-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6380-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6A174425B2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch replaces sprintf() with sysfs_emit() to ensure proper
bounds checking. It also simplifies the return logic by directly
returning the error after logging, instead of logging, calling
sprintf(), then returning.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
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
-- 
2.53.0


