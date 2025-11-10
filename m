Return-Path: <linux-rtc+bounces-5305-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 66211C4539C
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 08:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 28C6E4E8322
	for <lists+linux-rtc@lfdr.de>; Mon, 10 Nov 2025 07:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2612EB861;
	Mon, 10 Nov 2025 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jI6FNHaT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Yi8qFsPO"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E523D7C8
	for <linux-rtc@vger.kernel.org>; Mon, 10 Nov 2025 07:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762760155; cv=none; b=I31k/MNraWs16OQFN46jHz42r++28wleakAdi5eotq+Lz5bRBlt2WU9orhKp2V0y3yvHyM2h+vsLNjqTNn4ZHe9yB3O03E8bePMotveMkaEq3oAJlicatZvOUwx+sR6+fC/EMpQrpn9RRcoxv8flF2TMzYSAkk/g2hJyCeIwDb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762760155; c=relaxed/simple;
	bh=21nICoZNv0xtRro07vJ8g1b48UZfbTR27eO1M/t7uCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kok5T4Izb5QMtzUA1utoz1OcdXgvpO5Y32Wp0WkEfsrE2/mqZUbcKoXO1WJ+SCdXx+VwgPih1A4OhCUMpSM+BbotPQ6Q+ApHNqji2buaqRmuPm4GvcUTkUcago/EX7pg20E/rd/M1QeddfT3KsT5olK0h3PHA/KCTkm3K7FDvi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jI6FNHaT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Yi8qFsPO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762760152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
	b=jI6FNHaT8FdLn9EEbbYfHnA7s3RgWCKHDmXuYBs4QFpvJeURCneaoSfks/64LTrqibtQJU
	oBYD891iThDQVQl2qS5VKC1x4AW6Arq/7dg08pwMXZYpzaxd/VhXuKmFEgdTZivyIekexG
	9Hx22wtTAHXo0W7sJGmxhqWjtywAYV8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-8FXvjjppO1e4fA2QFQXiWg-1; Mon, 10 Nov 2025 02:35:51 -0500
X-MC-Unique: 8FXvjjppO1e4fA2QFQXiWg-1
X-Mimecast-MFC-AGG-ID: 8FXvjjppO1e4fA2QFQXiWg_1762760150
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b6d4f19c13cso276117166b.3
        for <linux-rtc@vger.kernel.org>; Sun, 09 Nov 2025 23:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762760150; x=1763364950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=Yi8qFsPO08Tog/Vv6/NK+T2Esh7zcTr9RSo/ApOOKb6PAr4GPo5D+a2/6rHGnn1Yyl
         F0f55iN1XIIAHFn8GbkC8LpI5sWeSmGpLIPwLZ3ZbK4dpIjgFFxAUYoTFSFBrUWM//D1
         auN7TRXF7NfTHOCjhbQroCx9IhvXgRUC3tk+CwC/RDc6u1GRjzoz+iD/WptfzRl3naMA
         hya3LmisWVhWhH1lw8JAHY6zfB/pLb2OphFH/BUfm2P+CylQ6qJsRigmMGF5momSJqwG
         pNQVDc2EYgJdXR2BGlsLH32CcbpRHSwrJIhBVAijVKEzji9fc6VqflkhS755E62WUNgC
         fqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762760150; x=1763364950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MZKl7FZF/ch5ijr8g/yA88XxaRvqJkiXLlx75JjOq5E=;
        b=AtCK8f2aJFijyfuPbfhl6Do6HyiLcOLW811cn+YOoawL9PGmINvLlZBHfaJUBNQxSB
         YWnMu1euHnfkJqYDmThNrBGSk9tVLYwJl5WtZQM2WbTOPmA+nWXbC7yjVoGb5IaULS2v
         4lW1gIQZsvusirZJxB0i6AD14Yj54PKRKWk0/adso4j5wyLJZq05ptYee803lK+a3jgy
         ekpB+DBq4GnuZ5bjHxJrZBhP1AI2FuhtYXuiMGSGHYXfvoefYASyqTVd4g1uTqob1Fqw
         Crhi2a6t4RNbOAAMGReRqhPFtTIm5YxHsY2Eccm28kaYmScFo6Akmf94usjiPmn2yRTL
         8W7A==
X-Forwarded-Encrypted: i=1; AJvYcCUgGqw0lqjACRyoElGTLFblZUOkEEq2DTAx73JXoazVy+0cFYbp1WE6uRXMtfGW55bEBECoahh/ptw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyexb5l3/0yzOk6HIb0Bp+S8RTbxUn8/Vrk6cMJj5ZaWWTI+sNI
	JYJ5fAzcmQZm8ZV4OlTxFvT4Hu3rRb4Fu+5PoPtghfObn+FRzgECHpP5MlcelCGfsLssu0hUMQk
	en/GbV34WchE6S2jqjJW+kBMjemKuRr+0uX3gqVM5j+znzFKVb1tMopE0TA0rUQHMq1Yiiw==
X-Gm-Gg: ASbGncvmBuLrJioGD43bJKVSm/sO4HpQg1CF4EFHtnm3LJa7d5kh9OddBPyOhuVUH9P
	uXX0j8IQ/2v6v/fMsYewZ08epKMW/1IcILhLz2PLP7lHDVXOtPQ7gCAtz3ZoO/xGb2j8IskVa3A
	icRCHMXou6iQqiOvCyiJyJUKwzpw4xJ/vzGkFp6gPei5hFBmJUJb0vQO+63hzXWH8sK8MY0ccAl
	y+peGDDLJVDFN99AMzQLXvzBvDxM9jxY+AdOh/PjQkXhDvEe9fMPtp4wtXrrCIzeoRtW3PpGaQa
	h12vO4Rw79xiOOZcRO8V1uj+1+cY9hIXkj09Aq5kreTE+Ji/B7SwnTL02ilUf9MPuYlzbKv20JR
	+EurNyubMe3fWdwUSJyE3/LYSs2536AcX03rNVwPhXDylMrP2
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178621166b.64.1762760149651;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFiLhLSDBHf+cnguxwEfwJFhitfhGonUvcR76zFD9RWMeGVCjQJ2GOJyu6W6FkcShrY0ZWgcg==
X-Received: by 2002:a17:906:cac7:b0:b73:845:4171 with SMTP id a640c23a62f3a-b7308454190mr178619366b.64.1762760149287;
        Sun, 09 Nov 2025 23:35:49 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc874sm1039395666b.54.2025.11.09.23.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 23:35:48 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Shubhi Garg <shgarg@nvidia.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-tegra@vger.kernel.org,
	linux-rtc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: drop unneeded file entry in NVIDIA VRS RTC DRIVER
Date: Mon, 10 Nov 2025 08:35:44 +0100
Message-ID: <20251110073544.443816-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 9d6d6b06933c ("rtc: nvvrs: add NVIDIA VRS RTC device driver") adds
the section NVIDIA VRS RTC DRIVER in MAINTAINERS, which refers to the
non-existing file include/linux/rtc/rtc-nvidia-vrs10.h

Note, with the changes of v6 to v7 of the patch series adding the driver,
the content of this include file was moved into the driver file, and the
include file was dropped from that patch. It was simply missed to adjust
the section in MAINTAINERS that was newly added with that patch.

Drop the file entry to this non-existing file accordingly now.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a881629003c..b2b55947efef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18586,7 +18586,6 @@ L:	linux-tegra@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/nvidia,vrs-10.yaml
 F:	drivers/rtc/rtc-nvidia-vrs10.c
-F:	include/linux/rtc/rtc-nvidia-vrs10.h
 
 NVIDIA WMI EC BACKLIGHT DRIVER
 M:	Daniel Dadap <ddadap@nvidia.com>
-- 
2.51.1


