Return-Path: <linux-rtc+bounces-5721-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4134D0B5C5
	for <lists+linux-rtc@lfdr.de>; Fri, 09 Jan 2026 17:47:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8C6AD309FE6C
	for <lists+linux-rtc@lfdr.de>; Fri,  9 Jan 2026 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94617363C78;
	Fri,  9 Jan 2026 16:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/2Gk2sU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eFMD5P1c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B933644AF
	for <linux-rtc@vger.kernel.org>; Fri,  9 Jan 2026 16:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976950; cv=none; b=HuLMFhCAIJktGCCHIf8c36tqqHKHiDS7O/h8LXY3TUzjtq5Y/5GAnv2/k8wPxGX45X9wSqCP3bwLgyxlUBQFH5BiXPqDavYaaQAXrw8mfvdnQWPpiiaI5srUap4aat/HaC4doSp/4S+WuW5ymnY0WyCAu9gf8wUi/uxgNm7mc4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976950; c=relaxed/simple;
	bh=3HqW7NkOVbO8aH0179u8nIT1ZCotHdAKF83hAMukHcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sINAFdLHZ+gmdmxUCeX4ZjdVBUKRbwyqQ5Sqd1cRayZfFgG25DNi+MGIe0+rA1N0eOvjOM7m1fFQViEsKg1EW5zERV2PouWx9i/mMgodDZ/ZcJ9mwsPheGWi7DBMMn7Tf2ZaS359+WleF3xQBN6itJLaNloEKPGCeonxCDm3fjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/2Gk2sU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eFMD5P1c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767976941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLnbgJPuD5maib5zYCJbMoRZA4avpTVQzd7OoXxyK8s=;
	b=g/2Gk2sUbTjv1FHGkg3NcPYKZM6hEV38uv9RmpTGOWv3W/5hzRQ7Zw2WcsS/vc+ItIDrVb
	Vau6Pipkl/RZTTRrXEt9du94Ux14FhAIFaJ4bm94QN7BmSiPX/nGKoDdz/KCLJGqkWAv3V
	ZR32lGF2MaVb3DJG5WiutSqj0wmPF/4=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-RB5Fqmf1Pm2BiOrqAO4FEA-1; Fri, 09 Jan 2026 11:42:20 -0500
X-MC-Unique: RB5Fqmf1Pm2BiOrqAO4FEA-1
X-Mimecast-MFC-AGG-ID: RB5Fqmf1Pm2BiOrqAO4FEA_1767976939
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56366d7c469so1482693e0c.0
        for <linux-rtc@vger.kernel.org>; Fri, 09 Jan 2026 08:42:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767976939; x=1768581739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLnbgJPuD5maib5zYCJbMoRZA4avpTVQzd7OoXxyK8s=;
        b=eFMD5P1cZJ8E/FNp1MMOVXTW2QcvZQL5Ak7NqkFjFHpAdgs1HK9Nl5uM11zk/DNi0d
         ma855Fmd3mHX1Ux5BVXSY7PYoZXE8wiijzbSaIvnR0p2fx1F1Khtzcbt3WB3UAM/Q9we
         o6BbLrg6c/VjD4a5T7mby0OBEHHhRidva8Qb4lb56QSOSyUKdHxc0buNubIG8EADSLfe
         vV0szvkeLqN2MclFlcoxX8ggNcmGr1CT4mZo2tXV32NnWBfnUP0a/rsi/7jVABrP2+nh
         MAX8hPHLXWXJQRRDPxb4ASOmzhdoGgc6WagMrBfk9trvanHvCkr6XfvC6mXQPc4xfeql
         xHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976939; x=1768581739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLnbgJPuD5maib5zYCJbMoRZA4avpTVQzd7OoXxyK8s=;
        b=j60qcWGZEJKMLmAtDTRphrP3VV9jIw2iOKYmAw/mSyEvIeBWmT3wqjUCHCsGeRkLa5
         EXmcS55Lff5MCvEI/ZJsYChPAaGudhpkmr5GaybsgYqgMH9Z8E7mKrRjBWzqmWUvvbCp
         nG9oyJGHbn9fIYZAC5secjsAklVk7NoGHdaH0nkExmQsljvg/Ij0LI059doJg5LXsy4l
         sAEG7vM5ppC5KKDdmaM0CZ10RG6e0VSFN57SkKPCUCHtrUyExESMQMDFGA2o6YXLRpcI
         93aPaZqulMviNGLCJXzlDQqpyFDhw08k8rSpIjTWYBJKDJi0+iEF7iWOaVOZZWmUw+2a
         TZOw==
X-Forwarded-Encrypted: i=1; AJvYcCWwvnesKvuoxHWEMhpR0R0sQX0T2qLbG0n1CL1huInPXfo5COfCcQPYHjvi4KJ/vz/C8894PBcPjwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpGyGEm9kdXv/k6f+nwZoeybxLTsMi7+bjW44XgVZvxhDJqw8
	Z1UnDEZOy3zIDHvePJUkjbzw71gouBGrNsA787RMFYkcbGmcTUN4ls4DexEv5bdyQs0IfgYEaue
	MHx5wFkUzdVy2uan76zpAQRKVghWDxqAbeQNxDYZoMeVwLjVSJhAFXJHT+NGGfA==
X-Gm-Gg: AY/fxX6sm29wRq3V4gVvNEkFgwYhtdIC0uOXGiwkLK7tVVNv5IZ6L/oHbcB21ue6gXw
	ri2qbYOT3h1mykQbCnc18xXhp7x+EYYy/O8tStGCFLfX6R2LdtwTlRMk+IiWPVmaErHjC4bTPg8
	SO3ATE5O91SVncS+uNRsUfQxJN8CV/aKf9jaQLGWnJkAcTnVLcONKylRRrXHksWFOlns/TBQeAe
	8CltXhFVehCp9i2w2far3Xl6kC4YOoXt6fW21sUuQsbDsPNhA3AM/zLIDfSk9e/AMWA9s0Q7nPk
	E9mQPDI7Fru9GNao1fd/md9pXrTZ2rYYbkkl52clvykK+CyKMEaVzn0puIoqSVlfIUiY+rsbAmI
	4JkzX+NLMtjHQCTsmuxUCmG9fmCqSrYBIqYNC7PU8FsmT001u
X-Received: by 2002:a05:6122:251c:b0:563:667f:9f98 with SMTP id 71dfb90a1353d-563667fad46mr1111707e0c.9.1767976939326;
        Fri, 09 Jan 2026 08:42:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEw9ZTkLnTNgzcaHFUMtGxxQI5/w6xFWNV5cvGbxkJ1/wAr+3DB8JZz9dtGY26ew/nfpt7lrg==
X-Received: by 2002:a05:6122:251c:b0:563:667f:9f98 with SMTP id 71dfb90a1353d-563667fad46mr1111701e0c.9.1767976939003;
        Fri, 09 Jan 2026 08:42:19 -0800 (PST)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5636c753392sm1267752e0c.6.2026.01.09.08.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 08:42:18 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 09 Jan 2026 11:41:21 -0500
Subject: [PATCH 08/13] rtc: pic32: update include to use pic32.h from
 platform_data
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-mips-pic32-header-move-v1-8-99859c55783d@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
In-Reply-To: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 linux-rtc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=3HqW7NkOVbO8aH0179u8nIT1ZCotHdAKF83hAMukHcA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT9Y/ayJy9ZKTSmhJrIv35wQrHCyvevVs7V7zEwVjqA
 rPLlwduHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyk1JLhf61cn9a7S1HHjt5Q
 n3Tz9buk33of/9bNPCQhztztIDBvSjYjw81b3KHv/6bFaD7kaQyzennoy9l1X7fvrJRrUA33XcD
 MzA0A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Use the linux/platform_data/pic32.h include instead of
asm/mach-pic32/pic32.h so that the asm variant can be dropped. This
is in preparation for allowing some drivers to be compiled on other
architectures with COMPILE_TEST enabled.

Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/rtc/rtc-pic32.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pic32.c b/drivers/rtc/rtc-pic32.c
index 52c11532bc3a3696359ca56349b42860aa90c966..3c7a38a4ac08eb0f5a44ae4e470c208a9d1dd599 100644
--- a/drivers/rtc/rtc-pic32.c
+++ b/drivers/rtc/rtc-pic32.c
@@ -15,8 +15,7 @@
 #include <linux/clk.h>
 #include <linux/rtc.h>
 #include <linux/bcd.h>
-
-#include <asm/mach-pic32/pic32.h>
+#include <linux/platform_data/pic32.h>
 
 #define PIC32_RTCCON		0x00
 #define PIC32_RTCCON_ON		BIT(15)

-- 
2.52.0


