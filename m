Return-Path: <linux-rtc+bounces-6302-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKYvNJNT12lHMggAu9opvQ
	(envelope-from <linux-rtc+bounces-6302-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:21:55 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 581B43C6F16
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 09:21:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB78A3028830
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D604377542;
	Thu,  9 Apr 2026 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBCuDOLx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE05379ECC
	for <linux-rtc@vger.kernel.org>; Thu,  9 Apr 2026 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775719288; cv=none; b=AXvDOLoSMiClRGgGtbkSLJ8EOe90R1IxsunzAD+pld3RugJYJhqqr1Ow7AUU2xH7ohr8lU8wWEF4zwvfZW7kz0aLeHKfBHWFWcNXIVthm9/ZUSdnDfZG6EhYLC1pCqDOowGMpNPuQHaVHc6AoTzJ2JTcelRfcIKK9qfXngUGJY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775719288; c=relaxed/simple;
	bh=0eF03ygD0g7fltmtQMp8ITT42LD+7kNJV2yGpXwCzrc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WS+9GxxDm3DF04rSrUthFKwc1/uOKqUQ/Z3S/jzKoB4D/8PcjKsCkh7Az0p7J4NU0yRsf7pMZPUQxIZi08SQKV5I5+Vwvnj1j7Fa84dt4PVc71y6ozWxaHNaV9T4MfZEe/ft5aXJ5IexJxNiT6f8rTvICkCyVywhMwgArELMaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBCuDOLx; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c76b9efc299so287746a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 09 Apr 2026 00:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775719287; x=1776324087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=NBCuDOLxXxRVtieI3YukM8lMcrobmOOYW7vY2FHR90sQrG7rbvh4s3XLy8pD4kU8nr
         +Biu0lYV3UnM55PZTtJ89Ovb+mDwjmSWli+H4oU7+iEFgnnF4aSS77p7zJv3v5cAg2JL
         xY0QDuOQ17iihZpt6dVIW+hmJ1nv7Ju+tRMUZLEWUdQ53DC0xVQAZ3gv8nY2ICUjdKI3
         LvkQVg2JlpCWfeg9uFPk1WIVkE4X/VqoXXPo5q6XEwiGaesyqbfuRdMAht5mebFQarDd
         u2fMwkZorjPDXvoKx5YWsV2QiMd5rKvqDHkzoprmEJdJ69EyRI3BtsX550t+gmbqvmJB
         VbRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775719287; x=1776324087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UMinz3n8an/kZF0WbbNLlDwuCyRlTdCbL2IBHoA8mM0=;
        b=r1hT+ets/mX9l3pPodiW9u0eGq5Z+LYrPDDNTmE9fd1SOAe839qssF3A2QGy9awSYe
         hHxKxoXQqYSMv3RzLUFRt4/ZqRxyVIfdJT5HwimyS/sQe5qGWJftle0tONp/Zh1zB3z3
         qE+kGl4pbfJHeGufaFqiqGTm2AJ45UBk/2LG/HC79FwAGu/GkI7F744ChUgEdlDD7I79
         3p1Yt0ZERzopKgoN9TFf8F6xMwFQdOwcEPPBkC0oL4pjLBCjTxWMgq28T+DAth6/yvD7
         4UvXRULvX0p3TxWEngNPllbG1+3TEGkCD4ocYWhjiO6JFgZRIdYy7noH4G/Cb6f+Wea+
         K4rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKpjxHBJNQBAXDhThiIEWa/JrEhg9H8aRbR0aGwazrRv21jch7A25DbVSxxng7Kd3IMn4Eoep+eC8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1MOugkRobg7gEjK5CFr83XFM0UdFyW8RAuGI0v78dp6w2ohFh
	AXBOlFWA7V19w6izK5lUhUwIYdm+ZCttrzu/JMLmj4UtV77Pf8B1TMQw
X-Gm-Gg: AeBDiesDwMF9qatWsoh8wZtECy0jmm7KIxx1NWesu79nXIfqmNDCbroaTGneB48Zc+0
	D8xua1iaHb5UelgrVHB6nokHnlIKD8dLTRO+8BB8X6kktRt1Cn1iADmr7zeGP3HM+eM80BthYAe
	X5LpYUfXTEoi5RB4hR0sbrgaYBO00FGHQMte+B7G7DcHrRGb/9UtJ4CprO28JxnQvSL/730bWD0
	hyZBTnZVa6CNvD84sjBDYXvfNZrZrJl9YW5EyXi6R/1y1KZzn+RYxQVUZ/GJNdmEb2Oq9jhrbQy
	cQ0PX83IePfZCs604ygNLOw5n7VE9UZ2VDGrVkHRKjj954F8UcxEnsFTngRko9TaMatxJybl7V3
	4llkeUFSMYofHdGKRP4MP2KuIsdE1J4nuaPwnjYoCLYzKvV4LC0hw/EatqABJH1q7RL3xbD8vj9
	FmXTYoMFccBPjTEee8Of8Uhj3yRrYoZ6cDZ5nNNV+hxZgulZwIFObubwvJD+YfCj6W3Y7lyQ==
X-Received: by 2002:a05:6a20:9191:b0:39f:1f92:28e with SMTP id adf61e73a8af0-39fc81d208fmr3244860637.27.1775719286684;
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
Received: from davidwang.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82d11f76c09sm18807603b3a.55.2026.04.09.00.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:21:26 -0700 (PDT)
From: David Wang <tomato1220@gmail.com>
To: a.zummo@towertech.it,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@aj.id.au,
	avi.fishman@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com,
	ctcchien@nuvoton.com,
	mimi05633@gmail.com,
	openbmc@lists.ozlabs.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	davidwang@quantatw.com,
	David Wang <tomato1220@gmail.com>
Subject: [PATCH 0/2] rtc: nct3018y: add support for control register initialization
Date: Thu,  9 Apr 2026 15:21:03 +0800
Message-Id: <cover.1775717959.git.tomato1220@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[aj.id.au,gmail.com,google.com,nuvoton.com,lists.ozlabs.org,vger.kernel.org,quantatw.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-6302-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tomato1220@gmail.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	NEURAL_HAM(-0.00)[-0.974];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 581B43C6F16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for an optional Device Tree property
"nuvoton,ctrl-reg-val" to initialize the RTC control register (0x0A).

This provides flexibility for different platforms (especially in
server environments) to configure behaviors such as 24h mode and
write ownership without driver source modifications.

David Wang (2):
  dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val property
  rtc: nct3018y: add optional control register initialization

 .../devicetree/bindings/rtc/nuvoton,nct3018y.yaml        | 5 +++++
 drivers/rtc/rtc-nct3018y.c                               | 9 +++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1


