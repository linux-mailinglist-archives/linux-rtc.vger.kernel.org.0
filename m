Return-Path: <linux-rtc+bounces-5955-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PsAOhtyiWlA9QQAu9opvQ
	(envelope-from <linux-rtc+bounces-5955-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Feb 2026 06:35:23 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 667D910BC83
	for <lists+linux-rtc@lfdr.de>; Mon, 09 Feb 2026 06:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 302423004C37
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Feb 2026 05:35:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C483630AD10;
	Mon,  9 Feb 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7EwS5qd"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57116246BBA
	for <linux-rtc@vger.kernel.org>; Mon,  9 Feb 2026 05:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770615320; cv=none; b=QDirLXzdueFcK9DYomoixkuSa57tQJzb2Qaxxt15cZH6Wx/YqGhYveLOjFzmB4clv2OOx5+RfFFsWnHMAegC/RIjXlKG4Dpp4ds4Xwr7ztyNKjoEt7YlKeR+Mjrvynrwtk5TJ7nfefDe+MIzZniOI3jfDw+IbyTCaIsaRHqJLRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770615320; c=relaxed/simple;
	bh=DQToknmhPB4uKle7SJjsL8qz4bcKmzeaxNJRfEwJ5TE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YF2jF0ZTlkS3ekEO0VOEEIRG2JLEhHyM5vJ279jglTFfn/fL3djqatjomEugMns03hW7/DaXKo5EFuqqmv0xH5pCD6IV998fTtgJLvMs0HAnZ8a1jIl0GZC5AgG4ZuAfsLVFy6TYsCcHsqj/K7H+QDy0rauDIa6IpoTi1OOx834=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7EwS5qd; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so56903045e9.1
        for <linux-rtc@vger.kernel.org>; Sun, 08 Feb 2026 21:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770615319; x=1771220119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YO/PiduSuQrsHeimwpiI5IjM8jDW+DYLL+NZXKmBSSM=;
        b=L7EwS5qdXJLOQQkR8OY4Yo8UXzqB8nEZ8eeX11GKgjBB3vrwrJQB9IHSaC3rqRfV+m
         +fbRRzlIkXn5muGdSyfhltr3j2/IZ1iGA5ZTs5zCO3RVo6m/gWQhMxDnFTpdAFopPGX/
         k0indZcFgmS6rzhPu5WVbVXnpkfMXwB6HvhI798Q0z7hAGdzb7E5ceALniPMkQSzEdSi
         gACwodwSMlq/24mhvZOlYZYeYhIWC0bsmHnwe0rb8PPvw2LQPqgXF41HLN6F7S+6v7U+
         /6JlRAbrfaV01au0cumDCYCPQkexRLwjguLW86dy2cq+/HZdrULacvva3phflyV3bN57
         i1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770615319; x=1771220119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YO/PiduSuQrsHeimwpiI5IjM8jDW+DYLL+NZXKmBSSM=;
        b=scpM4dd9h+i73/msOn8nmDzYyw5q4w07ubEUxOgpxNRGV4bGxnmSuefi8dVIC/rUWG
         Lx06+BdWzdPLtWOjLe0NGvTBcd+MB11R9DHw9Q9+JN3yNXhoiRMZyQDHPVTQBmQvLLku
         Kx+wZX1CCus+bL095+z9g5MU7EhrGUEB2ORdsO2sjfIJT5llte5+jDRjDLsu8QhFLZ51
         fMEy64JFibwlD9EgY6ciEA4dxvekcLbFOYtqYsjBPorwTTY+YhLTpwRH8GMOFxal5R10
         5XCosNFJEYW1ol3ENn3RECuT6dx7bYt+PHw0ca5ieB6La8yWaZBE2TvcTzafO7wQaD3M
         xOFA==
X-Gm-Message-State: AOJu0Yx6Y4WjtOlam4ewg3OiVBxbnH6q+8f7Y7wjkXWz+7pdxc9k3JRD
	6w/D4njbEuRmCCQzuaZejY5HOQfxZVbheyJLUYKRPuW+vywozL8WlNe2XSwDZpD1
X-Gm-Gg: AZuq6aIm4uDLSSLXKAIEVpIxAH9faB0sGDWuuUkaBssBP8sq2YIwi6BshS5xrkY9J/O
	owEQjET/H6anrEMxKya3KjPYQz/ev5Q+3LAkh6VLehKe3vKWcgKBTL3feH5Qyeyj8K7NIYZ0zLG
	VDuLuzQlUHS2/aOalwbBG92y77iOdC1A5Xor/+CUuvx8N1vNUuHVM97xDokT9AmxKA7AnssMLdS
	88waBz/YzTAj6ztQj4Da1sPl1zr4Z4NZWUjSPKdueqDvsU5+cN1ELhVBcTUWIBl5Ac974w+19TU
	JYogH6z3yO8Nr8AlOBxW9dbBAUD2eyKvHQdXAvDltbjdRmK0SFhNgCWrhcOI5S3Jrhz3CRko9bb
	otv8H31qjkwXytDwYTVZPSlKGa9fiSjaFBiXxMJtCZjxM4UkpP3WfxYg63c+fse+gXUb60vhJVg
	2bBfCNx7EdUJE/beImx2xifnD4C1FcTWcAr5eZ9Yt+OHfIMzo/fBOZH8Kkro2L0qZaWxQAcF8=
X-Received: by 2002:a05:600c:8489:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-48320216cb8mr148076135e9.22.1770615318494;
        Sun, 08 Feb 2026 21:35:18 -0800 (PST)
Received: from localhost.localdomain (80-121-54-205.adsl.highway.telekom.at. [80.121.54.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483203e5b63sm135762785e9.1.2026.02.08.21.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 21:35:18 -0800 (PST)
From: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
To: alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Gabriel-Platschek <andi.platschek@gmail.com>
Subject: [PATCH] rtc: ds1390: fix number of bytes read from RTC
Date: Mon,  9 Feb 2026 06:34:39 +0100
Message-ID: <20260209053439.313825-1-andi.platschek@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5955-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[andiplatschek@gmail.com,linux-rtc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 667D910BC83
X-Rspamd-Action: no action

The spi_write_then_read() reads 8 bytes starting from
DS1390_REG_SECONDS (== 0x01), so the last byte read would already
be part of the alarm (Tenths and Hundredths of Seconds) feature.

However 7 bytes are engouh -- seconds (0x01), minutes (0x02), hours (0x03),
day (0x04), date (0x05), month/century (0x06) and year (0x07).

Signed-off-by: Andreas Gabriel-Platschek <andi.platschek@gmail.com>
---
 drivers/rtc/rtc-ds1390.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ds1390.c b/drivers/rtc/rtc-ds1390.c
index f46428ca77cc..f7afd6bdeb4a 100644
--- a/drivers/rtc/rtc-ds1390.c
+++ b/drivers/rtc/rtc-ds1390.c
@@ -134,7 +134,7 @@ static int ds1390_read_time(struct device *dev, struct rtc_time *dt)
 	chip->txrx_buf[0] = DS1390_REG_SECONDS;
 
 	/* do the i/o */
-	status = spi_write_then_read(spi, chip->txrx_buf, 1, chip->txrx_buf, 8);
+	status = spi_write_then_read(spi, chip->txrx_buf, 1, chip->txrx_buf, 7);
 	if (status != 0)
 		return status;
 
-- 
2.47.3


