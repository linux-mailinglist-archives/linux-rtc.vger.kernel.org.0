Return-Path: <linux-rtc+bounces-687-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA3585D39E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 10:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF5F31C20BEB
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 09:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D7444C84;
	Wed, 21 Feb 2024 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WbBofezc"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8341A45013
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 09:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507715; cv=none; b=VxNPpvIR9vGBcPRfckZ0TniFI+ypXgcXv3P42BPI+jzv+xsiBVMd1PjrddfJc9ME0unKQa8Dm48fEX5WBlJc0Tl6m0p1Rjk9CJSRpAqmRtPxZ0GLYz+FGwl/GCTS2Xq8/mLNZMmPs0/Sc2QqrgiTvvU+XP4Rqev4V77F88BwaEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507715; c=relaxed/simple;
	bh=y3l6dLLVoW+zZGDnp8+WIzn6h/rf6TYI4bFoLk/AKw0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UYr/YzqXs627cKBLrpZve5dOE/T+EcNmCgLYOcT2dnOHMu07DrA9M11sLwljDUJY955kYzbYiB0KcHXDGm9Te6wJ7+TlPjaKwOoL4CJBuYGl/XxYK9NCnZ5GYfYAiruz+LDUM0bGEzCLdubTfTlytFMCygfvFiSTH3mCmx0SLqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WbBofezc; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5f38d676cecso89311787b3.0
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 01:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507712; x=1709112512; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bJ5a/DjWOVsBkmci+JDRuU6kR6Brs0uJ/9gc+PKy6/o=;
        b=WbBofezc/zbUoWWzsm77lShJjGHoXacAxiZ2p4FKNJMq33qgtckTErhjKeJ692KjE8
         Df4IBMsG/nvUFXtymbwtwpNx2N4K8N6HXUcAGmvET02hQIFr7E2SuKbDtvUgTwg4BAI2
         FRP+ChVGmdjOuNpVoTQ++qB03LrgfHplPymTB48M7ei5BJ6pBIZu7lmodVUZkZ31V7CI
         8TG6FCFveAiGCZtO0Z2/I5G0Mbu+QybUPwbOGdJzi7twoQQO06o7n8q7hB2i+cQOKw1H
         dnfPr/O+nJ9oJ9WXrT9nBKPVGKGtd0lnpKDMxn+oZYHYIT2tGfB/Fqa1wQHcU34kBYy8
         PLEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507712; x=1709112512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bJ5a/DjWOVsBkmci+JDRuU6kR6Brs0uJ/9gc+PKy6/o=;
        b=masCwE5crw1f3E2Wk+1rgF61P1EIrhely+R+px+jB4roMyH6H01/bnZIuFoGue8/O9
         J8aZEXU/pHwW818NmsRqWy2nO44g4ZjeVi2sP32E7EL5FmSqrU2awA50daIaZ1/DSJo7
         yLY3MurZHb0RMODnar9kmafA9+YWU2+5gdtt+zyOHOhZTB04XktvnPoTj1nn5DlzYkR4
         yiVFuvvbdT0NzvY8fcm4YmKGwb1GNuUVv2EJZV1V7F7UUiWIAhuCVM/aX0W8jFwC9NRt
         10js6Ys4KNPLADnRaldaeBkT4UCFs+orJjqCG4UXHxJYYoEPsQAgx1y18IP6pasgPDvy
         vcIw==
X-Forwarded-Encrypted: i=1; AJvYcCXIx7j03XOeftcHosMMUdEZFEw/IUFTOrpyUFL6uOMp8fX31f7ZiGd+zH3YM8oSJtJ88Z4RBgEM2auzpqJHM0SAOel7ovtq1UfZ
X-Gm-Message-State: AOJu0YxmTLwU0AY6NRDIR1d6eZZ6rCzOI3/yZSTJ7M04MY75QxbDRPnv
	bwvyjFKQlICdEB0j8Sr/ZzWWqzjxLWd4mtwx0TdjW97+ntSvD9yw4JYPLLPy5fPTjeqE0klHEC3
	IvoSo8A3zBA==
X-Google-Smtp-Source: AGHT+IGGnV8a4VQV8ckgYhdSC+moSz25Q0LZNkggi3KHg0lKbDC7oV4HVzTEvYLgrd72xK+9aVEkald37xppwg==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:eb07:0:b0:dc6:b7c2:176e with SMTP id
 d7-20020a25eb07000000b00dc6b7c2176emr3756666ybs.4.1708507712541; Wed, 21 Feb
 2024 01:28:32 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:20 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-8-davidgow@google.com>
Subject: [PATCH 7/9] drm: tests: Fix invalid printf format specifiers in KUnit tests
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

The drm_buddy_test's alloc_contiguous test used a u64 for the page size,
which was then updated to be an 'unsigned long' to avoid 64-bit
multiplication division helpers.

However, the variable is logged by some KUNIT_ASSERT_EQ_MSG() using the
'%d' or '%llu' format specifiers, the former of which is always wrong,
and the latter is no longer correct now that ps is no longer a u64. Fix
these to all use '%lu'.

Also, drm_mm_test calls KUNIT_FAIL() with an empty string as the
message. gcc warns if a printf format string is empty (apparently), so
give these some more detailed error messages, which should be more
useful anyway.

Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
Fixes: fca7526b7d89 ("drm/tests/drm_buddy: fix build failure on 32-bit targets")
Fixes: fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/gpu/drm/tests/drm_buddy_test.c | 14 +++++++-------
 drivers/gpu/drm/tests/drm_mm_test.c    |  6 +++---
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
index 8a464f7f4c61..3dbfa3078449 100644
--- a/drivers/gpu/drm/tests/drm_buddy_test.c
+++ b/drivers/gpu/drm/tests/drm_buddy_test.c
@@ -55,30 +55,30 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 		KUNIT_ASSERT_FALSE_MSG(test,
 				       drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							      ps, ps, list, 0),
-				       "buddy_alloc hit an error size=%d\n",
+				       "buddy_alloc hit an error size=%lu\n",
 				       ps);
 	} while (++i < n_pages);
 
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%d\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 
 	drm_buddy_free_list(&mm, &middle);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   2 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 2 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &right);
 	KUNIT_ASSERT_TRUE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							   3 * ps, ps, &allocated,
 							   DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc didn't error size=%llu\n", 3 * ps);
+			       "buddy_alloc didn't error size=%lu\n", 3 * ps);
 	/*
 	 * At this point we should have enough contiguous space for 2 blocks,
 	 * however they are never buddies (since we freed middle and right) so
@@ -87,13 +87,13 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    2 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 2 * ps);
+			       "buddy_alloc hit an error size=%lu\n", 2 * ps);
 
 	drm_buddy_free_list(&mm, &left);
 	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
 							    3 * ps, ps, &allocated,
 							    DRM_BUDDY_CONTIGUOUS_ALLOCATION),
-			       "buddy_alloc hit an error size=%d\n", 3 * ps);
+			       "buddy_alloc hit an error size=%lu\n", 3 * ps);
 
 	total = 0;
 	list_for_each_entry(block, &allocated, link)
diff --git a/drivers/gpu/drm/tests/drm_mm_test.c b/drivers/gpu/drm/tests/drm_mm_test.c
index 1eb0c304f960..f37c0d765865 100644
--- a/drivers/gpu/drm/tests/drm_mm_test.c
+++ b/drivers/gpu/drm/tests/drm_mm_test.c
@@ -157,7 +157,7 @@ static void drm_test_mm_init(struct kunit *test)
 
 	/* After creation, it should all be one massive hole */
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm not one hole on creation");
 		goto out;
 	}
 
@@ -171,14 +171,14 @@ static void drm_test_mm_init(struct kunit *test)
 
 	/* After filling the range entirely, there should be no holes */
 	if (!assert_no_holes(test, &mm)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm has holes when filled");
 		goto out;
 	}
 
 	/* And then after emptying it again, the massive hole should be back */
 	drm_mm_remove_node(&tmp);
 	if (!assert_one_hole(test, &mm, 0, size)) {
-		KUNIT_FAIL(test, "");
+		KUNIT_FAIL(test, "mm does not have single hole after emptying");
 		goto out;
 	}
 
-- 
2.44.0.rc0.258.g7320e95886-goog


