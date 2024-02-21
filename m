Return-Path: <linux-rtc+bounces-683-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AA185D38C
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 10:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA29BB24AB3
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 09:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E35E3F8F7;
	Wed, 21 Feb 2024 09:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pzScccO8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA46A3EA6F
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507696; cv=none; b=Tb3M4ypKS+XbCvN+vzVJ0sneSQ+KMHUL30NBNnoyEJDbLoiWgU68I7aqlelIsRwYmkXCTGAaFBUi722FLSZAgOmjsyq5o/hL1jva6SzMtboE26B/Jqh+OLT3yRaZulWctcBQxvuWnGIJHVbJvGjh+Lu/eu7jF2dKwz73Qnb/95w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507696; c=relaxed/simple;
	bh=AyL+J0FmKPt3EGU4p+x7TFB+PCgMwrwT1HRvusvK3Wo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JPbh6QvkHzI576szFEdVYkAnejk/ycZxhd+MXmLQBm2fx1weCoPMuiL47iAqLOUhaI2HZ9a2L0rV0AG5q1wAH2KFMsB2ZgtuXc1lNBSNU+sSUDj8Am628xryYxzUFWmhO47DXSEa6hx46ayoUMY/QdwbQzIpPDKHS+OA5gzF5Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pzScccO8; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-607a628209eso116169977b3.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 01:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507694; x=1709112494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sajAUUIIQYuGe8qQNpfUtUdwcf5MUYWJWHx5st8lTqQ=;
        b=pzScccO83Xqt5YTyI3e8KOZjqvik1l3KJrlFrrJH9Ta+LErh21Rdrqy1ZQsGiWUMp0
         7eqXrCzrT1wkFDRx6bJ3GWZiuhLcR7Izj5Tl3tqJNl+B08Y1tdqG2h68HAH3Yl8YoiYq
         mdhkd5aPMNUAv0IRlUAoIIjj15DmcQ81fArdFxmaiatAUjGi05FpjR3GMqMzJLqDYbgM
         d2Hn6NPIoeVoPDOOZm0u26msaJfIreaBE94aplRS5P5jkrZbyhHkV8tVIjYshQPk3K88
         e23VTomTKSwjqoRLfyHjmBT0HJKCOSPNH24VjMaIkawKs9oOmfRNumUkDMPCHP2thVFp
         0grw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507694; x=1709112494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sajAUUIIQYuGe8qQNpfUtUdwcf5MUYWJWHx5st8lTqQ=;
        b=Whdx6xz7gR+zXZq2eNkGrgCB+WTNPsvzvkwScDkcYF3h0SvzibzW6JvmvybYVT+IF4
         VZttDktBUlf/TsK9sWN+oHTXM1i8ouPM4mEkE8g/HNCUSIAZ92DWq2vO4hTiWvFVFq7L
         KbsZmFertzkTWfPNKHB//b6MbO2l5J6SWliaTn0IAD8i0sMj6tMJoOiDk9jcOrZIq7m8
         1q2keUuHLjGxgaw6U7etcf2p1rIOY2dWvLV8gLxiSxmHgZoTe2HZl5YaI0K9hMtKJoMp
         Z0ARi61kr4vO4716eIosZI+cdwJ76vB8RqByEBJlpdzE7yQrc6XXxZ8/ustWzjGTRva4
         pAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWa6u715OO9D4XlLnepYBiTUSPi338e4GdCzEf0t98MYq18sL3BNt/MZSFhYvp1E/Tih66LKH8HnNGMg6O//wdn2eP041/Ku0J
X-Gm-Message-State: AOJu0YzOmmTVJ+lo/3Tp2lF0FTtztCl7y8cR6/WcANpcBi2II5zs0B0i
	sixiFYLWa6S3M9998o+YrT3Gg84zAx9v7K+Ft8gBzQigJ92jDhpoBIA/G66r4mNYrAPsebg0a2N
	4MagvZNaA9w==
X-Google-Smtp-Source: AGHT+IHXN4IhYXj6gHEWGA94Amz/iLtPWuo+Xnyc3GcMGDuMyWPS0mpLGyU+Di2N0vYTLFyOCsPHpf7g1H0Bgg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:b192:0:b0:dcd:88e9:e508 with SMTP id
 h18-20020a25b192000000b00dcd88e9e508mr4406327ybj.5.1708507694045; Wed, 21 Feb
 2024 01:28:14 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:16 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-4-davidgow@google.com>
Subject: [PATCH 3/9] lib: memcpy_kunit: Fix an invalid format specifier in an
 assertion msg
From: David Gow <davidgow@google.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rae Moar <rmoar@google.com>, 
	Matthew Auld <matthew.auld@intel.com>, 
	Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Kees Cook <keescook@chromium.org>, 
	"=?UTF-8?q?Ma=C3=ADra=20Canal?=" <mcanal@igalia.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, Willem de Bruijn <willemb@google.com>, 
	Florian Westphal <fw@strlen.de>, Cassio Neri <cassio.neri@gmail.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, Arthur Grillo <arthur.grillo@usp.br>
Cc: David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Latypov <dlatypov@google.com>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>, 
	Maxime Ripard <mripard@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, linux-rtc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 'i' passed as an assertion message is a size_t, so should use '%zu',
not '%d'.

This was found by annotating the _MSG() variants of KUnit's assertions
to let gcc validate the format strings.

Fixes: bb95ebbe89a7 ("lib: Introduce CONFIG_MEMCPY_KUNIT_TEST")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/memcpy_kunit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/memcpy_kunit.c b/lib/memcpy_kunit.c
index 440aee705ccc..30e00ef0bf2e 100644
--- a/lib/memcpy_kunit.c
+++ b/lib/memcpy_kunit.c
@@ -32,7 +32,7 @@ struct some_bytes {
 	BUILD_BUG_ON(sizeof(instance.data) != 32);	\
 	for (size_t i = 0; i < sizeof(instance.data); i++) {	\
 		KUNIT_ASSERT_EQ_MSG(test, instance.data[i], v, \
-			"line %d: '%s' not initialized to 0x%02x @ %d (saw 0x%02x)\n", \
+			"line %d: '%s' not initialized to 0x%02x @ %zu (saw 0x%02x)\n", \
 			__LINE__, #instance, v, i, instance.data[i]);	\
 	}	\
 } while (0)
@@ -41,7 +41,7 @@ struct some_bytes {
 	BUILD_BUG_ON(sizeof(one) != sizeof(two)); \
 	for (size_t i = 0; i < sizeof(one); i++) {	\
 		KUNIT_EXPECT_EQ_MSG(test, one.data[i], two.data[i], \
-			"line %d: %s.data[%d] (0x%02x) != %s.data[%d] (0x%02x)\n", \
+			"line %d: %s.data[%zu] (0x%02x) != %s.data[%zu] (0x%02x)\n", \
 			__LINE__, #one, i, one.data[i], #two, i, two.data[i]); \
 	}	\
 	kunit_info(test, "ok: " TEST_OP "() " name "\n");	\
-- 
2.44.0.rc0.258.g7320e95886-goog


