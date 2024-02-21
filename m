Return-Path: <linux-rtc+bounces-684-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 310CF85D395
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 10:30:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 54B2CB2220A
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 09:30:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACDB4405DD;
	Wed, 21 Feb 2024 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b3AoQfXx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7C03FB2C
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507702; cv=none; b=SSHAq1vEhBnxFtLso6fA1hokNKgINADhj1YCMhtGoKgJVWd5I9M40+RvY/NLzB27lcbE3HMDjyr78TK54mdPbGpwnA+d9dpcWCDG4Ng6SsT/T3+sO1I79lkIISthjIsTaDoZdvxYZIudstW5pU8FW6GTEOEueraEKDkYeITqpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507702; c=relaxed/simple;
	bh=oL7SbspJOeRYcbVFVBGkFBZAmUlrMB6hGfPhSOPP+r4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S+on2ktwlHH8A0lSn3+FhSTJs9fV8omCDIawdOE4ivkrkWUfR5rLY2BsZJsNkP5ounJhbZpwEzxVfz67nQbKbFLwajmDLhRcxs/hezTILtPPZjilnbJ83u/HzkvcVt5ZENi9mjh48snT49vuCTi6jBQ48Z7niFyrk1pjHDB82WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b3AoQfXx; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcbee93a3e1so8081185276.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 01:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507699; x=1709112499; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9U7+OVqCU0rhDEd8d2z0lAB4Gret4PnmLwRYwmvgX8=;
        b=b3AoQfXxx988FHyX9PzELXt8NrrvJobEFyBhth5Q2rbrtTy2d+2wd+HOEyGFNMuOHo
         n/oPbIlMp1nrledzymwwjSpwJQgwhl3MPqjMZv18VG+7yE2c4/AhCocx4fGXkGFcGEWE
         N3Uz9mFEfVcoB+2bkskC/YugYC0VUbJdJrKpFzzPLnwJxWbkP8pM9hl/tWdMYC6RZ0d6
         0wccmsGWSQdrDTYzEBTx5q4gwuEAVH5324VNJei90wylyVjUHjubfPTPky7GkxN99y3A
         U6iNBk2+Ip0VFdATBZ5YUvA4W6HooAq1k9G0Ld+P7WYosQKGWZWjx/bHIn66PwE2EVoH
         fDyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507699; x=1709112499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9U7+OVqCU0rhDEd8d2z0lAB4Gret4PnmLwRYwmvgX8=;
        b=M7Uz7+5VgU+WdbHj05LiV7OUh5GXOn4Z8OcFsE86VGW7Uvd5HcyG36IkFLbgDVW9m6
         XiiQtruVV3Vw3SYxquzlMtAVf2AHR6kthgOUCRWFwFBEAj7I2z+cc0n8pIXxzovpR5yj
         qS3B1gpkSmZ5rSm9QbqNUHrwZ8iAxe/Q9evRzaInLi5xDPCm8Ulp2lAiUf95ySph+fXf
         j7yk6uZghsFDcMf53At2z6qZgIDHU1WU6Ou/jaAFZvKgi1j11gbUtMEcQXIK70zSRVFf
         KeSRsXkbO3HwlxexJV6bp1OmPthA1E3wjPHQqDjB8aSrznX/Gyr0As3dQYGik/rrZRw1
         wDQw==
X-Forwarded-Encrypted: i=1; AJvYcCWwPFGXCFp9WgwyRqlNu2bAjP24pbSKm8QTFRmZATp8okLLjpAlkDkCoBRbTVXxaEXc0kMpB0H1rG3EsdESzSttaCOwXEzpcIGh
X-Gm-Message-State: AOJu0YwkTZ6tFpZZSWG+jvibvIIiB8zV4IStNu5Z2T9uM8oD1lvtQ0uM
	f3u33qxYrQ/RQktfS0I3brVHpisNMPdXUJf3iOca5B0ruyF4SwyTlenfDwWDznWmi9iw+ubP2DA
	29wNajTdjeQ==
X-Google-Smtp-Source: AGHT+IHQmEZgvDehwTVbCeyhhzp67M3ZAq3QtZNAjC+xaNviI3L4AtsF+O/jA3jQTZUOnw086+ZCDp3kuUdK4Q==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a25:69c4:0:b0:dcc:9f24:692b with SMTP id
 e187-20020a2569c4000000b00dcc9f24692bmr1016456ybc.13.1708507698808; Wed, 21
 Feb 2024 01:28:18 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:17 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-5-davidgow@google.com>
Subject: [PATCH 4/9] time: test: Fix incorrect format specifier
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

'days' is a s64 (from div_s64), and so should use a %lld specifier.

This was found by extending KUnit's assertion macros to use gcc's
__printf attribute.

Fixes: 276010551664 ("time: Improve performance of time64_to_tm()")
Signed-off-by: David Gow <davidgow@google.com>
---
 kernel/time/time_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/time/time_test.c b/kernel/time/time_test.c
index ca058c8af6ba..3e5d422dd15c 100644
--- a/kernel/time/time_test.c
+++ b/kernel/time/time_test.c
@@ -73,7 +73,7 @@ static void time64_to_tm_test_date_range(struct kunit *test)
 
 		days = div_s64(secs, 86400);
 
-		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %ld", \
+		#define FAIL_MSG "%05ld/%02d/%02d (%2d) : %lld", \
 			year, month, mdday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
-- 
2.44.0.rc0.258.g7320e95886-goog


