Return-Path: <linux-rtc+bounces-682-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC65385D387
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 10:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 178FA1C21694
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 09:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FC13E477;
	Wed, 21 Feb 2024 09:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hpU1mo4c"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36183D97A
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 09:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507693; cv=none; b=fcUYaaphXPJ53SyZvU8lRXLvK+eVHt03KQcLEsdtTNPFQF53K4PRdyHuZE5QlTMmqP0uegsq/W5SyNaecCc435lSFat7xZOw/1kI4M0EcoCAqK+t8SJ+2L1HlAKhTXqjW7LOBzyG1+DFksqzl6kv5X7gcxRslo6IfDyWomLFGs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507693; c=relaxed/simple;
	bh=Dmbe5BP8c+8aPc1x3J6VMn8AMWKKdm1dWr1AhfYnkWA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IGbHC4nv97ojVDVbxRJzTgclL4iqOS4RZ9WLr12Y7TySM6KNETOC0m8pCCLDEvbeRuhyVzMSJGzfh/LZYQXUUR39p3I2a0S940sRBnugpqGEif03i7eCwIg+3kLTuNTEUR8vWNl8+cN2ejnSbPPjhbxiRtffTu0/nqbotmXpELo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hpU1mo4c; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc6b269686aso9891153276.1
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 01:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507690; x=1709112490; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NeQowu5ygMbqfsZc+b92OS1HjirLANcwpz/yagEqKMA=;
        b=hpU1mo4c4VTOaQ/zVlQmv4i7QNv4xa1OmIftHY/i6aT9JV07sXoNBTk2w44z94zsIz
         Ljhu+Zn3S0/XMosXhJs2mf6h7qi8QKM4NG4iCHeLwUds3lrrUTDD3ZnkgPffF1gheDyV
         7sOjZ1fEm166dcVzljViZzv3N73d79lOwT64ZIXsoMWhQPeeZt0QeANi4WpYEAsbLk6s
         DHm35Y91ZMS3uKeZ3dELhM9GT6JmM3d7QIcRfGGIHhz/jktGtdqlE3u7envfX1YL7g0H
         LUplByodsH6N2WrPeNquOH57ZL4BXva3havvfWeeB1f4Hopkypmg384oEusnYKnPo1Bn
         QrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507690; x=1709112490;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NeQowu5ygMbqfsZc+b92OS1HjirLANcwpz/yagEqKMA=;
        b=weNKPaaAR7Dce555uwHZgfDNvI2xbaEu4eLci/aM8uMsPxnVGX8uj7bnlBNWw1sdpW
         JtaXn3288/2HJRu+m2gknYNobMRkx8T9sZiVSfcaLryqi8G9L7XeYUB+NCsWotzLNcq6
         J6Cq0juMhoG5SokkNXv3pBwmcrBerohU4Dp5Ep+kJpXH6dQ+PiEDNWjFyUZ0Vy6yLXWl
         iV+aEpWqgl075PDqGItCfRMR0uZPO9uVUf0MMvxh93SmyKwkszKT1clB/nB4d9QRBqo0
         BnB6cPZuGj4OOpzmm3VI1HRc/mUYJTfm9cUPqliTJgLrJY/6by90IbPrS/YVFo6UTCSo
         7iaw==
X-Forwarded-Encrypted: i=1; AJvYcCX3pHbtDJYrSJ9V+mJz/5HkdNDYnHruQv5aVkcqHPPX9H6W927LRijRvlY+i8uC6Ro5on1/apldURCO/6TT1j7pV1XUAj75+DuJ
X-Gm-Message-State: AOJu0YwMaasIJgoKAbBoO9y8ToHZO0B9IZMk8wdwhYZLsoC/CxlS+Bpi
	zszWc/D9GuO27pdigC83C62XvvbKY08B3eA/Yw7s95RP1YmitN0WFByg3f2FeS4O+AVezVCsqpz
	Rfva9s8YqUg==
X-Google-Smtp-Source: AGHT+IGKmHDvlseXRZ4Y+4ut8ocdYLBEplEGH+dd9qwAR6JMHTXNGTF3psUQFQki1OvQHuO3rgwKUwj3z7weqQ==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:1001:b0:dcc:79ab:e522 with SMTP
 id w1-20020a056902100100b00dcc79abe522mr728743ybt.11.1708507689903; Wed, 21
 Feb 2024 01:28:09 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:15 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-3-davidgow@google.com>
Subject: [PATCH 2/9] lib/cmdline: Fix an invalid format specifier in an
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

The correct format specifier for p - n (both p and n are pointers) is
%td, as the type should be ptrdiff_t.

This was discovered by annotating KUnit assertion macros with gcc's
printf specifier, but note that gcc incorrectly suggested a %d or %ld
specifier (depending on the pointer size of the architecture being
built).

Fixes: 0ea09083116d ("lib/cmdline: Allow get_options() to take 0 to validate the input")
Signed-off-by: David Gow <davidgow@google.com>
---
 lib/cmdline_kunit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/cmdline_kunit.c b/lib/cmdline_kunit.c
index d4572dbc9145..705b82736be0 100644
--- a/lib/cmdline_kunit.c
+++ b/lib/cmdline_kunit.c
@@ -124,7 +124,7 @@ static void cmdline_do_one_range_test(struct kunit *test, const char *in,
 			    n, e[0], r[0]);
 
 	p = memchr_inv(&r[1], 0, sizeof(r) - sizeof(r[0]));
-	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %u out of bound", n, p - r);
+	KUNIT_EXPECT_PTR_EQ_MSG(test, p, NULL, "in test %u at %td out of bound", n, p - r);
 }
 
 static void cmdline_test_range(struct kunit *test)
-- 
2.44.0.rc0.258.g7320e95886-goog


