Return-Path: <linux-rtc+bounces-1081-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5FD8B8342
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2024 01:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4931C20A17
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2024 23:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B18091CB311;
	Tue, 30 Apr 2024 23:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B3LDvGkQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505901CB306
	for <linux-rtc@vger.kernel.org>; Tue, 30 Apr 2024 23:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714521095; cv=none; b=VYtkeEhDeHz5iLnaOMFz6VkMq2uFUYZE3QopIWIkdMXYRR7U4B92cVp6AZMGF/CTDikBJeA7HbVhlbxa0zctmlxVygE+Jd8qlbohu84RscoBtwpNtm10hjfCnMUhX1GRp6xt3zyNJhNSezG0WxCKYG08cE72zHbwBJE+hYkSJJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714521095; c=relaxed/simple;
	bh=y7pEc5taF0Bx7YOXfxt+O85Tt8RH3vKYyQLjJaUCrbI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y+t4XlJ8oLyAW7pfNRwDpm5RnDk1a2+WfAaR2NN63TMXcL8PoKmP3to3yO4AeQhrcFk5sZZ0MqbPxlzpBRjWybl0ASVnLT6wpal3bEYwwDPdRhZsxbD2FsE/2iFBF5DTJuSCj1xCLTLkpBJRl5/W3vF+rtcFmDB9QpjpmhGoGxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B3LDvGkQ; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--edliaw.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5ce12b4c1c9so4776562a12.1
        for <linux-rtc@vger.kernel.org>; Tue, 30 Apr 2024 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714521094; x=1715125894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kM67DbNAqGoOnnaxPY0sLf1UR/LdcGYFGTuUrdY7Kyo=;
        b=B3LDvGkQNkaciOwuzfjTU/yQ+IrAzAB3KqSFdX3xAbaSkBQEJPPCSDC3cIiWW+sYs7
         TrLOWDeH5oCjdNW6YVS44lzG91MfmYVEW8ss+IT6WFYb9ApyGkGsQRIH9X4dkGIs6Ovq
         BSJgeIJm+QxSmtaRCVwBh7TOws/4IP3iq//SM/wNRpmp7aGPHJxSY0YN2/I8sO6AVb0e
         XWJLJTghTVPOMWkpj2VIEnox6MpyGTCBVJk+U0lcab4+UaasBn8gJaQaDj/roDNKwZNS
         qyNVqwgfiarIA6GsnfSlzRsZU2Z/wX9E2c/T71EoF9wQLl+jz9WV0W9T3QnmyQNeFYt0
         Qs9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714521094; x=1715125894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kM67DbNAqGoOnnaxPY0sLf1UR/LdcGYFGTuUrdY7Kyo=;
        b=bfOVRRVJkXqnwaL5S6CkMxdFYUdcuiIa6JrTsl6OuZjNyDwDgxQwSBNGEvKFacjZZx
         55z9UpdTq4I019GlOepc2ooPS6qGnk/EAbgcrg0+tsGPzO1sbupEmsSgQE2gaupQO3QR
         jVZWBTJe3yqKGUkS+E9n6Q+WC09c6MOkRQUnb9MLvIKSQwlS6zBigU0DVctBqFtVj6eG
         Njqbt8tgK/bGRvIY1q3eMSujyLsnf1OugOSeI0iyoQJrvEsqxynUp7t4RpPFTGNCxkdH
         ZjTC+umjl9TFo6kE0rXYCOEwJvkHvamQyhzx0FGG07pCHcoCom8+1WA4P9lTnQjpKmpq
         +31w==
X-Forwarded-Encrypted: i=1; AJvYcCXCJ6br0dtwntwHwjuUHTDq+EL55jormOJyF2ujdkUvSkkgZ41FgIpDoxJuvoI6mPrXAi6R9ljKanI3IQ9qnaEnayBUslagdp0X
X-Gm-Message-State: AOJu0Yx22kAaqitxdw924n7hhGHBTvoju9mrcD91wbRxPIrCNkgNvgec
	kcb3sGMWvHrekc6J5IM6aPBPA1sctecArSO4pc1tIQYYzUFpYS01bmPqR5PBoNm45c3OmI3nbU0
	J5A==
X-Google-Smtp-Source: AGHT+IF3Ddy+0Qz9qxrN5B/4JM8rOuSCmRls50+rXnvllRQCYgYHBTEmDfPd35Mfm0zRBIA+e6xOTJEscR8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:4762:0:b0:5ff:bf73:651f with SMTP id
 w34-20020a634762000000b005ffbf73651fmr2548pgk.11.1714521093463; Tue, 30 Apr
 2024 16:51:33 -0700 (PDT)
Date: Tue, 30 Apr 2024 23:50:13 +0000
In-Reply-To: <20240430235057.1351993-1-edliaw@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240430235057.1351993-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.rc0.197.gbae5840b3b-goog
Message-ID: <20240430235057.1351993-5-edliaw@google.com>
Subject: [PATCH v1 04/10] selftests/kvm: Define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Bongsu Jeon <bongsu.jeon@samsung.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sgx@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
index f3c2239228b1..7422e8ff6bd3 100644
--- a/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
+++ b/tools/testing/selftests/kvm/x86_64/fix_hypercall_test.c
@@ -4,6 +4,8 @@
  *
  * Tests for KVM paravirtual feature disablement
  */
+#define _GNU_SOURCE
+
 #include <asm/kvm_para.h>
 #include <linux/kvm_para.h>
 #include <linux/stringify.h>
--
2.45.0.rc0.197.gbae5840b3b-goog


