Return-Path: <linux-rtc+bounces-685-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AEE85D397
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 10:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 42BD4B22602
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Feb 2024 09:31:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2478D40BFA;
	Wed, 21 Feb 2024 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6FVsTD4"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DD640BEA
	for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708507706; cv=none; b=r3LtTCJ1LP81wMpRc8SofMLgRwMBR0LefaLxJSwpTkCnDK2+Yq42ZDLhTe/QJkqq8vNp5OQn/WtPRYx8dCq+gdZP2/bHbv/pdQ/GPPP7ncZ8UhxdJQkNkvK5S5xCEFA+PnzteYyalQDvWylMeBIEchf8aDfKGraSgmhXXPbSscI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708507706; c=relaxed/simple;
	bh=qMDq4bdbhpPxmFVNu5BAuMHikajNGQCbrs05AJS2Hgg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sGnvArgcKVMewygydny6uqF8WIW47hWRI0nf8ee4tYXM2WyR4oXTAt/Vsf7e7Wnhs8DKA9c1Fzswg0CZkVC0XPpJhbgE6DiphLifZzEkwsF1RL2VGLGnQv/gcmqxjaCFrDOQl6uS3gzKpP0ls+g0RaK8Fk2J4kBRaXC2ieRbqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6FVsTD4; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60853aafd93so40352757b3.0
        for <linux-rtc@vger.kernel.org>; Wed, 21 Feb 2024 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708507703; x=1709112503; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
        b=D6FVsTD4raEeATxpVZ6Qcyn+x0avEjJx8xgJvJ/z4iE0JjaKunjA/Z82BKNy+FzkR2
         lp+3qO5dhnzsfc/dM+z2pECqaOjIQ8xuKlLxZGEjL601epK+6DDd3REFZfSGOt+D/HZM
         QrcMdWaNT/FVPNhZzCaV7aYI3WB+sPL2iR3DZG4z/wBKBkUExn9I09KyWYjc1rEAjpLG
         kauIplsgkQBLM8u9xwfvIXKs7VSVVqvEg0N0sOMlCRsSrHY+jA3+sukTBOcT88jfJ9ma
         2xW1OkO6ZTe6kq8rb096JA8P0VnVHqwLbFWTDc2NCFK2vAaUykNlfA4u9AFqM0ob82Px
         oggw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708507703; x=1709112503;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6oh8w0yc8LvH1yvSHI8zU+2R7q+ewyvFM42Am6pdhYA=;
        b=JkHZRt2ae0vc22WKYeCqehuTybXTB8ggxwOiwKJrETAbsXR7kRGD+rNJwD8Owc/gr+
         ENk9udJ4BNvVen1Arv8BYBoy0qVXMLlfr56MS2hW+F419xHZ/fqUmRM2TEmtXHPqJMrb
         ZOpSfxp4xVbrjS3j70FmsddO6eEnN61xN1hFwXKeTP6uXzWEaQeBVDeN8KLlpvTejol6
         A06TxfH6ONUGT3vlz2u4dLzctDqvp3WcfJky1T1NfflNBLXbeM4Gl1fyQZwsxL7unKG/
         kSNp5pwitj92fxGbvcdpPyQ0Dc+dLJAXgqcVMxZg4OT1rV0NBkX26GEZuQGWm12DLIYI
         qf+A==
X-Forwarded-Encrypted: i=1; AJvYcCXqFpArYgcvK/IDSUXg+qVgKvn9Jxh3ZYEapxFo/Xd+S0wwmcHKxPBLtdOCOEdmz5MC+GZGcPGd7GKjCbLR6SeZbqufq+Gu5pAW
X-Gm-Message-State: AOJu0Yx779YBi9p03SRPooz4hZGXrQCs7yHix4hjPM0RdumNbXmXR8+G
	GHGTpf+/diGGME0ru7Bp6BaSmQI6KjuEfx3CjcWNXYvoQxtlHtJgk6skm48KXMHbdR+ZWqMfiSM
	xQQWXCeR7Mg==
X-Google-Smtp-Source: AGHT+IHAVxan3IBdGfT14ZlxAMIfrkzUxv01ETxOcEryam+Wji8MbAhrWelAxlNmlmHCaTgl78twQW5eAT/4hw==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a0d:e8c4:0:b0:607:cd11:5464 with SMTP id
 r187-20020a0de8c4000000b00607cd115464mr4264994ywe.9.1708507703514; Wed, 21
 Feb 2024 01:28:23 -0800 (PST)
Date: Wed, 21 Feb 2024 17:27:18 +0800
In-Reply-To: <20240221092728.1281499-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221092728.1281499-1-davidgow@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221092728.1281499-6-davidgow@google.com>
Subject: [PATCH 5/9] rtc: test: Fix invalid format specifier.
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

Fixes: 1d1bb12a8b18 ("rtc: Improve performance of rtc_time64_to_tm(). Add tests.")
Signed-off-by: David Gow <davidgow@google.com>
---
 drivers/rtc/lib_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
index d5caf36c56cd..225c859d6da5 100644
--- a/drivers/rtc/lib_test.c
+++ b/drivers/rtc/lib_test.c
@@ -54,7 +54,7 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
 
 		days = div_s64(secs, 86400);
 
-		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
+		#define FAIL_MSG "%d/%02d/%02d (%2d) : %lld", \
 			year, month, mday, yday, days
 
 		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
-- 
2.44.0.rc0.258.g7320e95886-goog


